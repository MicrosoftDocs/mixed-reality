---
title: Choosing a Unity version and XR plugin
description: Stay up to date on the latest Unity and XR plugin recommendations for HoloLens application development.
author: hferrone
ms.author: v-hferrone
ms.date: 06/18/2021
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

![Unity hub instal new version](images/unity-hub-img-2019.png)

3. Check following components under **'Platforms'**
    * **Universal Windows Platform Build Support** 
    * **Windows Build Support (IL2CPP)**

![Unity Universal Windows Platform Build Support option](images/Unity_Install_Option_UWP_2019.png)

4. If you installed Unity without these options, you can add them through **'Add Modules'** menu in Unity Hub:

![Unity Windows Build Support option](images/Unity_Install_Option_UWP2_2019.png)

To get started with Legacy Built-in XR in Unity 2019.4 LTS, click here:

> [!div class="nextstepaction"]
> [Set up Legacy Built-in XR](./xr-project-setup.md?tabs=legacy)

> [!NOTE]
> Unity has deprecated its Legacy Built-in XR support as of Unity 2019.  While Unity 2019 does offer a new XR Plug-in framework, Microsoft is not currently recommending that path in Unity 2019 due to Azure Spatial Anchors incompatibilities with AR Foundation 2.  In Unity 2020, Azure Spatial Anchors is supported within the XR Plug-in framework.

If you are developing apps for HoloLens (1st gen), these headsets remain supported in Unity 2019 LTS with Legacy Built-in XR for the full lifecycle of Unity 2019 LTS through mid-2022.

## Unity 2020.3 LTS 

If you’re using **Unity 2020.3 LTS**, Microsoft’s current recommendation is the latest **Mixed Reality OpenXR plugin**. You MUST use Unity patch release 2020.3.8f1 or later to avoid known performance issues with earlier 2020.3 builds.

The Mixed Reality OpenXR plugin fully supports AR Foundation 4.0, providing ARPlaneManager and ARRaycastManager implementations. This enables you to write hit-testing code once that then spans HoloLens 2 and ARCore/ARKit phones and tablets.

However, there are known issues that affect Unity 2020 LTS projects:

* The Universal Rendering Pipeline (URP) 10.5.0 or older has performance penalties on HoloLens 2 devices.

If you choose to start a new project in Unity 2020 today, be sure to follow up over the coming weeks for updated Unity builds and URP packages before shipping your app.  This will ensure that your users experience proper hologram stability.

> [!div class="nextstepaction"]
> [Using the OpenXR plugin](./xr-project-setup.md?tabs=openxr)

## Unity 2021.1

If you are trying out early **Unity 2021.1** builds, you should move forward to the **OpenXR plugin**, as the Windows XR plugin is deprecated there.  Starting in Unity 2021.2, the OpenXR plugin will be the only path for Mixed Reality development, as the Windows XR plugin will no longer be supported.

## Unity 2018.4 LTS

If you already have a project using Unity 2018.4 LTS, your Unity engine continues to be supported for 2 years after its release.  Unity 2018 LTS will reach end of service in the spring of 2021.