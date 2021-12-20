---
title: Secure Connection with Holographic Remoting and the OpenXR API
description: This page explains how to configure Holographic Remoting to use encrypted and authenticated connections between player and remote apps with the OpenXR API.
author: vimusc
ms.author: vimusch
ms.date: 12/15/2021
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting, mixed reality headset, windows mixed reality headset, virtual reality headset, security, authentication, server-to-client, OpenXR
---
# Secure Connection with Holographic Remoting and the OpenXR API

When using the [OpenXR API](openxr.md), all secure connection-related API is available as part of the `XR_MSFT_holographic_remoting` OpenXR extension.

> [!IMPORTANT]
> To learn about the Holographic Remoting OpenXR extension API, check out the [specification](https://htmlpreview.github.io/?https://github.com/microsoft/MixedReality-HolographicRemoting-Samples/blob/main/remote_openxr/specification.html) which can be found in the [Holographic Remoting samples github repository](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples).

Remember that you need to implement custom remote and player apps if you want to enable connection security. Both of the custom apps need:

* A certificate provider and an authentication validator if the app runs as the server.
* An authentication provider and a certificate validator if the app runs as the client.

The OpenXR API is similar to the Windows Mixed Reality API described [here](holographic-remoting-secure-connection-wmr.md).
However, instead of implementing interfaces, the key elements for secure connection using the `XR_MSFT_holographic_remoting` OpenXR extension are the following callbacks:

* `xrRemotingRequestAuthenticationTokenCallbackMSFT`, generates, or retrieves the authentication token to be sent.
* `xrRemotingValidateServerCertificateCallbackMSFT`, validates the certificate chain.
* `xrRemotingValidateAuthenticationTokenCallbackMSFT`, validates the client authentication token.
* `xrRemotingRequestServerCertificateCallbackMSFT`, supply the server application with the certificate to use.

> [!NOTE]
> With Holographic Remoting it is possible that either the Player or the Remote is the server depending on your needs (For more information, see [Holographic Remoting Terminology](holographic-remoting-terminology.md)). If your custom remote or custom player application can run as client and server the app has to provide all four callbacks.

The callbacks can be provided to the remoting OpenXR runtime via `xrRemotingSetSecureConnectionClientCallbacksMSFT` and `xrRemotingSetSecureConnectionServerCallbacksMSFT`.
In order to do so, you can create static functions for the callbacks:

```cpp
class SecureConnectionCallbacks {
public:
    ...

    // Static callbacks
    static XrResult XRAPI_CALL
    RequestAuthenticationTokenStaticCallback(XrRemotingAuthenticationTokenRequestMSFT* authenticationTokenRequest) {
        if (!authenticationTokenRequest->context) {
            return XR_ERROR_RUNTIME_FAILURE;
        }
        return reinterpret_cast<SecureConnectionCallbacks*>(authenticationTokenRequest->context)
            ->RequestAuthenticationToken(authenticationTokenRequest);
    }

    static XrResult XRAPI_CALL
    ValidateServerCertificateStaticCallback(XrRemotingServerCertificateValidationMSFT* serverCertificateValidation) {
        if (!serverCertificateValidation->context) {
            return XR_ERROR_RUNTIME_FAILURE;
        }
        return reinterpret_cast<SecureConnectionCallbacks*>(serverCertificateValidation->context)
            ->ValidateServerCertificate(serverCertificateValidation);
    }

    static XrResult XRAPI_CALL
    ValidateAuthenticationTokenStaticCallback(XrRemotingAuthenticationTokenValidationMSFT* authenticationTokenValidation) {
        if (!authenticationTokenValidation->context) {
            return XR_ERROR_RUNTIME_FAILURE;
        }
        return reinterpret_cast<SecureConnectionCallbacks*>(authenticationTokenValidation->context)
            ->ValidateAuthenticationToken(authenticationTokenValidation);
    }

    static XrResult XRAPI_CALL
    RequestServerCertificateStaticCallback(XrRemotingServerCertificateRequestMSFT* serverCertificateRequest) {
        if (!serverCertificateRequest->context) {
            return XR_ERROR_RUNTIME_FAILURE;
        }
        return reinterpret_cast<SecureConnectionCallbacks*>(serverCertificateRequest->context)
            ->RequestServerCertificate(serverCertificateRequest);
    }
}
```

The static callback functions all look similar and in the example above they just call a function on the context object, which is set in `xrRemotingSetSecureConnectionClientCallbacksMSFT` or `xrRemotingSetSecureConnectionServerCallbacksMSFT`. The actual implementation of the callbacks is then done inside the member functions of the context object:

```cpp
class SecureConnectionCallbacks {   
    ...

private:
    // The client has to provide a token and has to validate the certificate.
    XrResult RequestAuthenticationToken(XrRemotingAuthenticationTokenRequestMSFT* authenticationTokenRequest) {
        // To provide a token fill out the authenticationTokenRequest with your token.
    }
    XrResult ValidateServerCertificate(XrRemotingServerCertificateValidationMSFT* serverCertificateValidation) {
        // Validate the certificate.
    }

    // The server has to provide a certificate and hast to validate the token.
    XrResult ValidateAuthenticationToken(XrRemotingAuthenticationTokenValidationMSFT* authenticationTokenValidation) {
        // Validate the token.
    }
    XrResult RequestServerCertificate(XrRemotingServerCertificateRequestMSFT* serverCertificateRequest) {
        // To provide a certificate fill out the serverCertificateRequest with your certificate.
    }
}
```

Now you can provide the callbacks to `xrRemotingSetSecureConnectionClientCallbacksMSFT` and `xrRemotingSetSecureConnectionServerCallbacksMSFT`. Additionally, the secure connection needs to be enabled via the secureConnection parameter on the `XrRemotingConnectInfoMSFT` structure or the `XrRemotingListenInfoMSFT` structure depending on whether you're using `xrRemotingConnectMSFT` or `xrRemotingListenMSFT`:

```cpp
...

SecureConnectionCallbacks callbackObject;

...

if (client) 
{
    XrRemotingSecureConnectionClientCallbacksMSFT clientCallbacks;
    clientCallbacks.context = &callbackObject;
    clientCallbacks.requestAuthenticationTokenCallback = SecureConnectionCallbacks::RequestAuthenticationTokenStaticCallback;
    clientCallbacks.validateServerCertificateCallback = SecureConnectionCallbacks::ValidateServerCertificateStaticCallback;
    clientCallbacks.performSystemValidation = true;
    CHECK_XRCMD(m_extensions.xrRemotingSetSecureConnectionClientCallbacksMSFT(m_instance.Get(), m_systemId, &clientCallbacks));
    
    ...

    connectInfo.secureConnection = true; // Enable secure connection!
    CHECK_XRCMD(m_extensions.xrRemotingConnectMSFT(m_instance.Get(), m_systemId, &connectInfo));
}

if (server) 
{
    XrRemotingSecureConnectionServerCallbacksMSFT serverCallbacks;
    serverCallbacks.context = &callbackObject;
    serverCallbacks.requestServerCertificateCallback = SecureConnectionCallbacks::RequestServerCertificateStaticCallback;
    serverCallbacks.validateAuthenticationTokenCallback = SecureConnectionCallbacks::ValidateAuthenticationTokenStaticCallback;
    serverCallbacks.authenticationRealm = /*YourAuthenticationRealm*/;
    CHECK_XRCMD(m_extensions.xrRemotingSetSecureConnectionServerCallbacksMSFT(m_instance.Get(), m_systemId, &serverCallbacks));

    ...

    listenInfo.secureConnection = true; // Enable secure connection!
    CHECK_XRCMD(m_extensions.xrRemotingListenMSFT(m_instance.Get(), m_systemId, &listenInfo));
}
```

> [!NOTE]
> You can find a detailed example in the [OpenXR sample app](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples).

## See Also

* [Secure Connection with Holographic Remoting Overview](holographic-remoting-secure-connection.md)