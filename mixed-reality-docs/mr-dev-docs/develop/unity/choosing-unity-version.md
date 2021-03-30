---
title: Choosing a Unity version and XR plugin
description: Stay up to date on the latest Unity and XR plugin recommendations for HoloLens application development.
author: hferrone
ms.author: v-hferrone
ms.date: 03/26/2021
ms.topic: article
keywords: mixedrealitytoolkit, mixedrealitytoolkit-unity, mixed reality headset, windows mixed reality headset, virtual reality headset, unity
---

# Choosing a Unity version and XR plugin

While we currently **recommend installing Unity 2019.4 LTS and using Legacy Built-in XR** for Mixed Reality development, you can build apps with other Unity configurations as well.

## Unity 2019.4 LTS (Recommended)

Microsoft’s current recommended Unity configuration for HoloLens 2 and Windows Mixed Reality development is **Unity 2019.4 LTS using Legacy Built-in XR** support.

The best way to install and manage Unity is through the <a href="https://unity3d.com/get-unity/download" target="_blank">[Unity Hub]</a>. When it's installed, open Unity Hub:

1. Select the **Installs** tab and choose **ADD**
2. Select Unity 2019.4 LTS and click **Next**

![Unity hub instal new version](images/unity-hub-img-01.png)

3. Check following components under **'Platforms'**
    * **Universal Windows Platform Build Support** 
    * **Windows Build Support (IL2CPP)**

![Unity Universal Windows Platform Build Support option](../images/Unity_Install_Option_UWP.png)

4. If you installed Unity without these options, you can add them through **'Add Modules'** menu in Unity Hub:

![Unity Windows Build Support option](../images/Unity_Install_Option_UWP2.png)

To get started with Legacy Built-in XR in Unity 2019.4 LTS, click here:

> [!div class="nextstepaction"]
> [Set up Legacy Built-in XR](legacy-xr-support.md)

> [!NOTE]
> Unity has deprecated its Legacy Built-in XR support as of Unity 2019.  While Unity 2019 does offer a new XR Plug-in framework, Microsoft is not currently recommending that path in Unity 2019 due to Azure Spatial Anchors incompatibilities with AR Foundation 2.  In Unity 2020, Azure Spatial Anchors is supported within the XR Plug-in framework.

If you are developing apps for HoloLens (1st gen), these headsets remain supported in Unity 2019 LTS with Legacy Built-in XR for the full lifecycle of Unity 2019 LTS through mid-2022.

## Unity 2020.3 LTS 

If you’re using **Unity 2020.3 LTS**, you can use the **Windows XR plugin** to develop HoloLens 2 and Windows Mixed Reality applications.

However, there are known issues that affect hologram stability and other features on HoloLens 2: 

* Depth buffer submission has regressed in recent Unity 2020 builds, which results in severe hologram instability.
* Holographic app remoting applications using the Universal Windows Platform build target are not working.
* The Unity graphics jobs system is defaulted on, even though it is not compatible with HoloLens projects.

If you choose to start a new project in Unity 2020 today, be sure to follow up over the coming months for updated Unity builds and Windows XR plugin builds before shipping your app.  This will ensure that your users experience proper hologram stability.

> [!div class="nextstepaction"]
> [Using the Windows XR plugin](windows-xr-plugin.md)

### Using OpenXR

Unity 2020.3 LTS also supports a public preview of the **Mixed Reality OpenXR** plugin.

The Mixed Reality OpenXR plugin fully supports AR Foundation 4.0, providing ARPlaneManager and ARRaycastManager implementations. This enables you to write hit-testing code once that then spans HoloLens 2 and ARCore/ARKit phones and tablets. 

Later this year, **Unity 2020.3 LTS with the OpenXR plugin** will become the recommended Unity configuration, and future HoloLens 2 features in Unity will be exposed only through this plugin.  You can start your project here for now - however, if your project targets HoloLens 2, you will currently encounter the Unity 2020 hologram stability and other issues listed above.  Be sure to check back in the coming months for updated Unity builds and OpenXR plugin builds before shipping your app.  This will ensure that your users experience proper hologram stability. 

> [!div class="nextstepaction"]
> [Using the OpenXR plugin](openxr-getting-started.md)

## Unity 2021.1

If you are trying out early **Unity 2021.1** builds, you should move forward to the **OpenXR plugin**, as the Windows XR plugin is deprecated there.  Starting in Unity 2021.2, the OpenXR plugin will be the only path for Mixed Reality development, as the Windows XR plugin will no longer be supported.

## Unity 2018.4 LTS

If you already have a project using Unity 2018.4 LTS, your Unity engine continues to be supported for 2 years after its release.  Unity 2018 LTS will reach end of service in the spring of 2021.
