---
title: Establishing a secure connection with Holographic Remoting
description: This page explains how to establish a secure encrypted connection when using Holographic Remoting.
author: bethau
ms.author: bethau
ms.date: 08/01/2019
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting
---



# Establishing a secure connection with Holographic Remoting

>[!IMPORTANT]
>This guidance is specific to Holographic Remoting on HoloLens 2.

This page explains how to establish a secure encrypted connection when using Holographic Remoting.

When streaming content to HoloLens 2 over a insecure Network such as an open WiFi or the internet it is highly recommended to use an encrypted connection.

>[!IMPORTANT]
>Even when using a trusted local WiFi using an encrypted connection should be considered.

To be able to use a encrypted connection you will need to implement both a [custom player](holographic-remoting-create-player.md) and a [custom host app](holographic-remoting-create-host.md).

The encryption is achieved by using the underlying platforms TLS implementation.

## Basics of an encrypted connection

The following objects need to be implemented to allow for a certificate exchange.

>[!TIP]
>Implementing WinRT interfaces can easily be done using C++/WinRT. The [Author APIs with C++/WinRT](https://docs.microsoft.com/en-us/windows/uwp/cpp-and-winrt-apis/author-apis) chapter describes this in detail.

>[!IMPORTANT]
>The ```build\native\include\HolographicAppRemoting\Microsoft.Holographic.AppRemoting.idl``` inside the NuGet package contains detailed documentation for the API related to secure connections.

1) A certificate object, which needs to implement the ```ICertificate``` interface.

    * Return the binary contents of the pfx certificate through the ```GetCertificatePfx``` method. Same as the binary contents of a .pfx file.
    * Return the certificate subject name through ```GetSubjectName```.
    * Return the pfx password through ```GetPfxPassword```. Return an empty string for an unprotected pfx.

2) A certificate provider implementing the ```ICertificateProvider``` interface which provides a certificate when asked through the ```GetCertificate``` method.

3) A certificate validator implementing the ```ICertificateValidator``` interface. Its task is to verify incoming certificates.
    * The ```PerformSystemValidation``` method should return ```true``` when the underlying platform should validate the incoming certificate chain, ```false``` otherwise.
    * ```ValidateCertificate``` is called by the client context to request validation of a certificate. This method accepts the certificate chain (with the first certificate being the subject certificate), the name of the server the connection is being established with, and whether a revocation check should be forced. The system validation result will be provided if validation by the underlying system has been requested. To continue processing either ```CertificateValidated``` with the appropriate result or ```Cancel``` to cancel validation needs to be called on the passed ```ICertificateValidationCallback```.

Furthermore, to allow for the exchange of a secure token the following objects need to be implemented.

1) An authentication provider implementing the ```IAuthenticationProvider``` interface. Its ```GetToken``` method is called by the client context to request a token for client authentication. To continue either ```TokenReceived``` to provide the authentication token and continue the connection process or ```Cancel``` to cancel the process needs to be called on the passed ```IAuthenticationProviderCallback```.
2) An authentication receiver implementing the ```IAuthenticationReceiver``` interface. Its task is to validate incoming tokens.
    * The ```GetRealm``` method should return the name of the authentication realm.
    * The ```ValidateToken``` method is called by the server network context to request validation of a client authentication token. To continue either call ```ValidationCompleted``` to signal completion of the validation or ```Cancel``` to reject the client connection.. The client connection will be admitted or rejected based on the validation result passed to ```ValidationCompleted```. 

Once these objects are implemented ```ListenSecure``` needs to be called instead of ```Listen``` and ```ConnectSecure``` instead of ```Connect``` on the remote context and player context respectively. ```ListenSecure``` requires an additional certificate provider and authentication receiver over ```Listen```. ```ConnectSecure``` requires an additional authentication provider and certificate validator over ```Connect```.

## See Also
* [Writing a Holographic Remoting host app](holographic-remoting-create-host.md)
* [Writing a custom Holographic Remoting player app](holographic-remoting-create-player.md)
* [Holographic Remoting troubleshooting and limitations](holographic-remoting-troubleshooting.md)
* [Holographic Remoting software license terms](https://docs.microsoft.com/en-us/legal/mixed-reality/microsoft-holographic-remoting-software-license-terms)
* [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?LinkId=521839)