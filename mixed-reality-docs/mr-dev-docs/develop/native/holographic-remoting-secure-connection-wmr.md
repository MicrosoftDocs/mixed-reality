---
title: Secure Connection with Holographic Remoting and the Windows Mixed Reality API
description: This page explains how to configure Holographic Remoting to use encrypted and authenticated connections between player and remote apps with the Windows Mixed Reality API.
author: florianbagarmicrosoft
ms.author: v-vtieto
ms.date: 9/3/2021
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting, mixed reality headset, windows mixed reality headset, virtual reality headset, security, authentication, server-to-client
---

# Secure Connection with Holographic Remoting and the Windows Mixed Reality API

Remember that you need to implement custom remote and player apps if you want to enable connection security. You can use the provided samples as starting points for your own apps.

To enable security, call `ListenSecure()` instead of `Listen()`, and `ConnectSecure()` instead of `Connect()` to establish the remoting connection.

These calls require you to provide implementations of certain interfaces for providing and validating security-related information:

* The server needs to implement a certificate provider and an authentication validator
* The client needs to implement an authentication provider and a certificate validator.

All interfaces have a function requesting you to take action, which receives a callback object as parameter. Using this object, you can easily implement asynchronous handling of the request. Keep a reference to this object, and call the completion function when the asynchronous action is complete. The completion function may be called from any thread.

> [!TIP]
> Implementing WinRT interfaces can easily be done using C++/WinRT. The [Author APIs with C++/WinRT](/windows/uwp/cpp-and-winrt-apis/author-apis) chapter describes this in detail.

> [!IMPORTANT]
> The `build\native\include\HolographicAppRemoting\Microsoft.Holographic.AppRemoting.idl` inside the NuGet package contains detailed documentation for the API related to secure connections.

## Implementing a certificate provider

Certificate providers supply the server application with the certificate to use. The implementation consists of two parts:

1) A certificate object, which implements the `ICertificate` interface:

    * `GetCertificatePfx()` should return the binary contents of a `PKCS#12` certificate store. A `.pfx` file contains `PKCS#12` data, so its contents can be used directly here.
    * `GetSubjectName()` should return the friendly name that identifies the certificate to use. If no friendly name is assigned to the certificate, this function should return the certificate's subject name.
    * `GetPfxPassword()` should return the password required to open the certificate store (or an empty string if no password is required).

2) A certificate provider implementing the `ICertificateProvider` interface:
    * `GetCertificate()` should construct a certificate object and return it by calling `CertificateReceived()` on the callback object.

## Implementing an authentication validator

Authentication validators receive the authentication token sent by the client, and answer back with the validation result.

Implement the `IAuthenticationReceiver` interface as follows:

* `GetRealm()` should return the name of the authentication realm (an HTTP realm  used during the remoting connection handshake).
* `ValidateToken()` should validate the client authentication token and call `ValidationCompleted()` on the callback object with the validation result.

## Implementing an authentication provider

Authentication providers generate or retrieve the authentication token to be sent to the server.

Implement the `IAuthenticationProvider` interface as follows:

* `GetToken()` should generate or retrieve the authentication token to be sent. Once the token is ready, call the `TokenReceived()` method on the callback object.

## Implementing a certificate validator

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

> [!NOTE]
> If your use case requires a different form of validation (see certificate use case #1 above), bypass system validation entirely. Instead, use any API or library that can handle DER-encoded X.509 certificates to decode the certificate chain and perform the checks needed for your use case.

## See Also

* [Secure Connection with Holographic Remoting Overview](holographic-remoting-secure-connection.md)