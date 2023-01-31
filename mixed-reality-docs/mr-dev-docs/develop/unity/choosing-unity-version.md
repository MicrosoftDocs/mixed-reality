---
title: Choosing a Unity version and XR plugin
description: Stay up to date on the latest Unity and XR plugin recommendations for HoloLens application development.
author: qianw211
ms.author: qianwen
ms.date: 01/10/2022
ms.topic: article
keywords: mixedrealitytoolkit, mixedrealitytoolkit-unity, mixed reality headset, windows mixed reality headset, virtual reality headset, unity
---

# Choosing a Unity version and XR plugin

While we currently **recommend installing Unity 2020.3 LTS with the Mixed Reality OpenXR plugin** for Mixed Reality development, you can build apps with other Unity configurations as well.

## Unity 2020.3 LTS or 2021.3 LTS (Recommended)

Microsoft recommends to use [Unity LTS (Long term support) streams](https://blog.unity.com/technology/new-plans-for-unity-releases-introducing-the-tech-and-long-term-support-lts-streams) for HoloLens 2 and Windows Mixed Reality development **with the Mixed Reality OpenXR plugin**.  

[!INCLUDE[](includes/xr/recommended-version.md)]

> [!IMPORTANT]
> Unity 2020 does not support targeting HoloLens (1st gen). These headsets remain supported in **[Unity 2019 LTS](#unity-20194-lts)** with Legacy Built-in XR for the full lifecycle of Unity 2019 LTS through mid-2022.

The best way to install and manage Unity is through the **Unity Hub**:

1. Install <a href="https://unity3d.com/get-unity/download" target="_blank">**Unity Hub**</a>.
2. Select the **Installs** tab and choose **Add**.
3. Select **Unity 2020.3 LTS** and click **Next**.

![Unity Hub install new version](images/unity-hub-img-01.png)

4. Check the following components under **'Platforms'**:
    * **Universal Windows Platform Build Support**
    * **Windows Build Support (IL2CPP)**

![Unity Universal Windows Platform Build Support option](../images/Unity_Install_Option_UWP.png)

5. If you previously installed Unity without these options, you can add them through **'Add Modules'** menu in Unity Hub:

![Unity Windows Build Support option](../images/Unity_Install_Option_UWP2.png)

Once you have Unity 2020.3 installed, get started creating a project or upgrading an existing project using the Mixed Reality OpenXR plugin:

> [!div class="nextstepaction"]
> [Set up a new OpenXR project with MRTK](new-openxr-project-with-mrtk.md)

> [!NOTE]
> While we recommend using OpenXR for all new projects, Unity 2020.3 LTS also supports the [Windows XR plugin](new-openxr-project-with-mrtk.md). This plugin is fully supported, although it won't receive new features such as AR Foundation 4.0 support.

## Unity 2019.4 LTS

Unity 2019.4 LTS has reached the end of Unity's two-year Long-Term Support window and is no longer receiving updates from Unity, although your projects will continue to run.

If you need to use Unity 2019, you can use **Unity 2019 LTS with Legacy Built-in XR**.

> [!NOTE]
> Unity has deprecated its Legacy Built-in XR support as of Unity 2019.  While Unity 2019 does offer a new XR Plug-in framework, Microsoft is not currently recommending that path in Unity 2019 due to Azure Spatial Anchors incompatibilities with AR Foundation 2.  In Unity 2020, Azure Spatial Anchors is supported within the XR Plug-in framework.

If you are developing apps for HoloLens (1st gen), these headsets remain supported in Unity 2019 LTS with Legacy Built-in XR for the full lifecycle of Unity 2019 LTS through mid-2022.


## Unity 2018.4 LTS

Unity 2018.4 LTS has reached the end of Unity's two-year Long-Term Support window and is no longer receiving updates from Unity, although your projects will continue to run.

If you have a Unity 2018 project, you should consider planning for a migration forward to Unity 2020.3 LTS and the Mixed Reality OpenXR plugin.

## Next steps

> [!div class="nextstepaction"]
> [Set up a new OpenXR project with MRTK](new-openxr-project-with-mrtk.md)
> [Set up a new OpenXR project without MRTK](new-openxr-project-without-mrtk.md)