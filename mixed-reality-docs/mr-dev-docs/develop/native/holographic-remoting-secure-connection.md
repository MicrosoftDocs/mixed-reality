---
title: Secure Connection with Holographic Remoting Overview
description: This page explains how to configure Holographic Remoting to use encrypted and authenticated connections between player and remote apps.
author: florianbagarmicrosoft
ms.author: vinnietieto
ms.date: 9/3/2021
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting, mixed reality headset, windows mixed reality headset, virtual reality headset, security, authentication, server-to-client
---

# Secure Connection with Holographic Remoting Overview

If you're new to Holographic Remoting, you may want to [read our overview](/windows/mixed-reality/develop/native/holographic-remoting-overview).

> [!NOTE]
> This guidance is specific to Holographic Remoting on HoloLens 2 and Windows PCs running [Windows Mixed Reality](../../discover/navigating-the-windows-mixed-reality-home.md).

This page gives you an overview of network security for Holographic Remoting. You'll find information about:

* Security in the context of Holographic Remoting and why you might need it
* Recommended measures based on different use cases

## Holographic Remoting security

Holographic Remoting exchanges information over a network. If no security measures are in place, adversaries on the same network may compromise the integrity of the communication or access confidential information.

The sample apps and the Holographic Remoting Player in the Windows Store come with security disabled. Doing so makes the samples easier to understand. It also helps you to get started more quickly with development.

For field testing or production, we strongly recommend enabling security in your Holographic Remoting solution.

Security in Holographic Remoting, when set up correctly for your use case, gives you the following guarantees:

* **Authenticity:** both player and remote app can be sure the other side is who they claim to be
* **Confidentiality:** no third party can read the information exchanged between player and remote app
* **Integrity:** player and remote can detect any in-transit changes to their communication

> [!IMPORTANT]
> To be able to use security features, you will need to implement both a [custom player](holographic-remoting-create-player.md) and a custom remote app using either [Windows Mixed Reality](holographic-remoting-create-remote-wmr.md) or [OpenXR](holographic-remoting-create-remote-openxr.md) APIs.

> [!NOTE]
> Starting with version [2.4.0](holographic-remoting-version-history.md#v2.4.0) remote apps using the [OpenXR API](../native/openxr.md) can be created. An overview on how to establish a secure connection in an OpenXR environment can be found [here](holographic-remoting-secure-connection-openxr.md).

## Planning the security implementation

When you enable security in Holographic Remoting, the remoting library will automatically enable encryption and integrity checks for all data exchanged over the network.

Ensuring proper authentication requires some extra work though. What exactly you need to do depends on your use case, and the rest of this section is about figuring out the necessary steps.

> [!IMPORTANT]
> This article can only provide general guidance. If you feel unsure, consider consulting a security expert that can give you guidance specific to your use case.

First some terminology: when describing network connections, the terms _client_ and _server_ will be used. The server is the side listening for incoming connections on a known endpoint address, and the client is the one connecting to the server's endpoint.

> [!NOTE]
> The client and and server roles are not tied to whether an app is acting as a player or as a remote. While the samples have the player in the server role, it's easy to reverse the roles if it better fits your use case.

### Planning the server-to-client authentication

The server uses digital certificates to prove its identity to the client. The client validates the server's certificate during the connection handshake phase. If the client doesn't trust the server, it will end the connection at this point.

How the client validates the server certificate, and what kinds of server certificates can be used, depends on your use case.

**Use case 1:** The server hostname isn't fixed, or the server isn't addressed by host name at all.

In this use case, it isn't practical (or even possible) to issue a certificate for the server's host name. We recommendation you validate the certificate's thumbprint instead. Like a human fingerprint, the thumbprint uniquely identifies a certificate.

It's important to communicate the thumbprint to the client out-of-band. That means, you can't send it over the same network connection that's used for remoting. Instead, you could manually enter it into the client's configuration, or to have the client scan a QR code.

**Use case 2:** The server can be reached over a stable host name.

In this use case, the server has a specific host name, and you know this name isn't likely to change. You can then use a certificate issued to the server's host name. Trust will be established based on the host name and the certificate's chain of trust.

If you choose this option, the client needs to know the server's host name and the root certificate in advance.

### Planning the client-to-server authentication

Clients authenticate against the server using a free-form token. What this token should contain will again depend on your use case:

**Use case 1:** You only need to verify the client app's identity.

In this use case, a shared secret can be sufficient. This secret must be complex enough that it can't be guessed.

A good shared secret is a random GUID, which is manually entered in both the server's and client's configuration. To create one you can, for example, use the `New-Guid` command in PowerShell.

Make sure this shared secret is never communicated over insecure channels. The remoting library ensures that the shared secret is always sent encrypted, and only to trusted peers.

**Use case 2:** You also need to verify the identity of the client app's user.

A shared secret won't be enough to cover this use case. Instead, you can use tokens created by an identity provider. An authentication workflow using an identity provider would look like this:

* The client authorizes against the identity provider and requests a token
* The identity provider generates a token and sends it to the client
* The client sends this token to the server through Holographic Remoting
* The server validates the client's token against the identity provider

One example of an identity provider is the [Microsoft identity platform](/azure/active-directory/develop/).

Like in the previous use case, make sure these tokens aren't sent through insecure channels or otherwise exposed.

## See Also

* [Holographic Remoting Overview](holographic-remoting-overview.md)
* [Secure Connection with the OpenXR API](holographic-remoting-secure-connection-openxr.md)
* [Secure Connection with the Windows Mixed Reality API](holographic-remoting-secure-connection-wmr.md)