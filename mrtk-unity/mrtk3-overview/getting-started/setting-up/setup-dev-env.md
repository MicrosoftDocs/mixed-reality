---
title: Setting up the Development Environment
description: Setting up the Development Environment
author: RogPodge
ms.author: roliu
ms.date: 1/13/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, initial setup, setup, Mixed Reality Toolkit, MRTK, Quest, Oculus, Meta
---

# Setting up your development environment

Before setting up a Unity Project with MRTK3, make sure you have the following prerequisites

- A Windows 10 or 11 PC
- Visual Studio 2022 with the required workloads (as noted in the [Installation Checklist](/windows/mixed-reality/develop/install-the-tools?tabs=unity))
- Windows 10 SDK 10.0.18362.0 or later
- Unity Hub with Unity 2021.3.4f1 LTS installed

If your target platform is a Hololens device, your unity installation will need to include the Universal Windows Platform Support Module

      ![UWP Module Installation](../images/setting-up/MRTK-Development-Setup-UWPModule.png)

If your target platform is a Quest device, your unity installation will need to include the Android Build Support Module and its sub-modules. More more information specifics, see the [Oculus Developer documentation](https://developer.oculus.com/documentation/unity/book-unity-gsg/#install-unity-editor)

      ![Android Module Installation](../images/setting-up/MRTK-Development-Setup-AndroidModule.png)

## Next steps

After setting up the development environment, there are few options for creating a Unity Project with MRTK3.

- [Starting from a Template Project](setup-template.md): This project is preconfigured to consume all MRTK packages and is initialized with project settings vital for running your application on a device.
- [Starting from a New Project](setup-new-project.md): This will guide you through adding vital MRTK3 packages to a new Unity project. It will also help you initialize the project settings needed to run your application on a device.