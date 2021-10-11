---
title: Enabling connection security for Holographic Remoting
description: This page explains how to configure Holographic Remoting to use encrypted and authenticated connections between player and remote apps.
author: florianbagarmicrosoft
ms.author: v-vtieto
ms.date: 9/3/2021
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting, mixed reality headset, windows mixed reality headset, virtual reality headset, security, authentication, server-to-client
---

# Enabling connection security for Holographic Remoting

If you're new to Holographic Remoting, you may want to [read our overview].

>[!IMPORTANT]
>This guidance is specific to Holographic Remoting on HoloLens 2.

This page gives you an overview of network security for Holographic Remoting. You'll find information about

* security in the context of Holographic Remoting and why you might need it
* recommended measures based on different use cases
* implementing security in your Holographic Remoting solution

## Holographic Remoting security

Holographic Remoting exchanges information over a network. If no security measures are in place, adversaries on the same network may compromise the integrity of the communication or access confidential information.

The sample apps and the Holographic Remoting Player in the Windows Store come with security disabled. Doing so makes the samples easier to understand. It also helps you to get started more quickly with development.

For field testing or production, we strongly recommend enabling security in your Holographic Remoting solution.

Security in Holographic Remoting, when set up correctly for your use case, gives you the following guarantees:

* **Authenticity:** both player and remote app can be sure the other side is who they claim to be
* **Confidentiality:** no third party can read the information exchanged between player and remote app
* **Integrity:** player and remote can detect any in-transit changes to their communication

>[!IMPORTANT]
>To be able to use security features, you will need to implement both a [custom player](holographic-remoting-create-player.md) and a custom remote app using either [Windows Mixed Reality](holographic-remoting-create-remote-wmr.md) or [OpenXR](holographic-remoting-create-remote-openxr.md) APIs.

>[!NOTE]
> Starting with version [2.4.0](holographic-remoting-version-history.md#v2.4.0) remote apps using the [OpenXR API](../native/openxr.md) can be created. An overview on how to establish a secure connection in an OpenXR environment can be found [below](#secure-connection-using-the-openxr-api).

## Planning the security implementation

When you enable security in Holographic Remoting, the remoting library will automatically enable encryption and integrity checks for all data exchanged over the network.

Ensuring proper authentication requires some extra work though. What exactly you need to do depends on your use case, and the rest of this section is about figuring out the necessary steps.

>[!IMPORTANT]
> This article can only provide general guidance. If you feel unsure, consider consulting a security expert that can give you guidance specific to your use case.

First some terminology: when describing network connections, the terms _client_ and _server_ will be used. The server is the side listening for incoming connections on a known endpoint address, and the client is the one connecting to the server's endpoint.

>[!NOTE]
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

## Implementing holographic remoting security

Remember that you need to implement custom remote and player apps if you want to enable connection security. You can use the provided samples as starting points for your own apps.

To enable security, call `ListenSecure()` instead of `Listen()`, and `ConnectSecure()` instead of `Connect()` to establish the remoting connection.

These calls require you to provide implementations of certain interfaces for providing and validating security-related information:

* The server needs to implement a certificate provider and an authentication validator
* The client needs to implement an authentication provider and a certificate validator.

All interfaces have a function requesting you to take action, which receives a callback object as parameter. Using this object, you can easily implement asynchronous handling of the request. Keep a reference to this object, and call the completion function when the asynchronous action is complete. The completion function may be called from any thread.

>[!TIP]
>Implementing WinRT interfaces can easily be done using C++/WinRT. The [Author APIs with C++/WinRT](/windows/uwp/cpp-and-winrt-apis/author-apis) chapter describes this in detail.

>[!IMPORTANT]
>The `build\native\include\HolographicAppRemoting\Microsoft.Holographic.AppRemoting.idl` inside the NuGet package contains detailed documentation for the API related to secure connections.

### Implementing a certificate provider

Certificate providers supply the server application with the certificate to use. The implementation consists of two parts:

1) A certificate object, which implements the `ICertificate` interface:

    * `GetCertificatePfx()` should return the binary contents of a `PKCS#12` certificate store. A `.pfx` file contains `PKCS#12` data, so its contents can be used directly here.
    * `GetSubjectName()` should return the friendly name that identifies the certificate to use. If no friendly name is assigned to the certificate, this function should return the certificate's subject name.
    * `GetPfxPassword()` should return the password required to open the certificate store (or an empty string if no password is required).

2) A certificate provider implementing the `ICertificateProvider` interface:
    * `GetCertificate()` should construct a certificate object and return it by calling `CertificateReceived()` on the callback object.

### Implementing an authentication validator

Authentication validators receive the authentication token sent by the client, and answer back with the validation result.

Implement the `IAuthenticationReceiver` interface as follows:

* `GetRealm()` should return the name of the authentication realm (an HTTP realm  used during the remoting connection handshake).
* `ValidateToken()` should validate the client authentication token and call `ValidationCompleted()` on the callback object with the validation result.

### Implementing an authentication provider

Authentication providers generate or retrieve the authentication token to be sent to the server.

Implement the `IAuthenticationProvider` interface as follows:

* `GetToken()` should generate or retrieve the authentication token to be sent. Once the token is ready, call the `TokenReceived()` method on the callback object.

### Implementing a certificate validator

Certificate validators receive the certificate chain sent by the server and determine whether the server can be trusted.

To validate certificates, you can use the validation logic of the underlying system. This system validation can either support your own validation logic, or replace it altogether. If you don't pass your own certificate validator when requesting a secure connection, system validation will be used automatically.

On Windows, the system validation will check for:

* Integrity of the certificate chain: the certificates form a consistent chain that ends at a trusted root certificate
* Certificate validity: the server's certificate is within its validity timespan, and is issued for server authentication
* Revocation: The certificate hasn't been revoked
* Name match: The host name of the server matches one of the host names the certificate was issued for

Implement the `ICertificateValidator` interface as follows:

 * `PerformSystemValidation()` should return `true` if a system validation as described above should be performed. In this case, the system validation result is passed as an input to the `ValidateCertificate()` method.
* `ValidateCertificate()` should validate the certificate chain and then call `CertificateValidated()` on the passed callback with the final validation result. This method accepts the certificate chain, the name of the server the connection is being established with, and whether a revocation check should be forced. If the certificate chain contains multiple certificates, the first one is the subject certificate.

>[!NOTE]
>If your use case requires a different form of validation (see certificate use case #1 above), bypass system validation entirely. Instead, use any API or library that can handle DER-encoded X.509 certificates to decode the certificate chain and perform the checks needed for your use case.

## Secure connection using the OpenXR API

When using the [OpenXR API](../native/openxr.md) all secure connection-related API is available as part of the `XR_MSFT_holographic_remoting` OpenXR extension.

>[!IMPORTANT]
>To learn about the Holographic Remoting OpenXR extension API, check out the [specification](https://htmlpreview.github.io/?https://github.com/microsoft/MixedReality-HolographicRemoting-Samples/blob/master/remote_openxr/specification.html) which can be found in the [Holographic Remoting samples github repository](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples).

The key elements for secure connection using the `XR_MSFT_holographic_remoting` OpenXR extension are the following callbacks.
- `xrRemotingRequestAuthenticationTokenCallbackMSFT`, generates, or retrieves the authentication token to be sent.
- `xrRemotingValidateServerCertificateCallbackMSFT`, validates the certificate chain.
- `xrRemotingValidateAuthenticationTokenCallbackMSFT`, validates the client authentication token.
- `xrRemotingRequestServerCertificateCallbackMSFT`, supply the server application with the certificate to use.

These callbacks can be provided to the remoting OpenXR runtime via `xrRemotingSetSecureConnectionClientCallbacksMSFT` and `xrRemotingSetSecureConnectionServerCallbacksMSFT`. Additionally, the secure connection needs to be enabled via the secureConnection parameter on the `XrRemotingConnectInfoMSFT` structure or the `XrRemotingListenInfoMSFT` structure depending on whether you're using `xrRemotingConnectMSFT` or `xrRemotingListenMSFT`.

This API is similar to the IDL-based API described in [Implementing holographic remoting security](#implementing-holographic-remoting-security). However, instead of implementing interfaces, you're supposed to provide callback implementations. You can find a detailed example in the [OpenXR sample app](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples).

## See Also
* [Holographic Remoting overview](holographic-remoting-overview.md)
* [Writing a Holographic Remoting remote app using Windows Mixed Reality APIs](holographic-remoting-create-remote-wmr.md)
* [Writing a Holographic Remoting remote app using OpenXR APIs](holographic-remoting-create-remote-openxr.md)
* [Writing a custom Holographic Remoting player app](holographic-remoting-create-player.md)
* [Holographic Remoting troubleshooting and limitations](holographic-remoting-troubleshooting.md)
* [Holographic Remoting software license terms](/legal/mixed-reality/microsoft-holographic-remoting-software-license-terms)
* [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?LinkId=521839)