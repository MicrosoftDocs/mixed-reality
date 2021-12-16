---
title: MRTK 2.7 release notes
description: Release notes for MRTK version 2.7
author: RogPodge
ms.author: roliu
ms.date: 06/16/2021
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, XRSDK, Legacy XR, Leap Motion, Ultraleap, OpenXR
ms.localizationpriority: high
monikerRange: '>= mrtkunity-2021-05'
---

# Microsoft Mixed Reality Toolkit 2.7 Release Notes

## What's new in 2.7.3

### Unity 2021 support

MRTK now officially supports Unity 2021 with the release of 2.7.3! If you find any issues while using MRTK with Unity 2021, please [file an issue](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/) on our GitHub repository and add the Unity 2021 tag.

### Notable Bugfixes and Changes

- Previous MRTK versions would generate invalid shader bytecode errors in the Unity console for the MRTK Standard Shader, when compiling for Android or iOS. [#10041](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10041).
- Add ClearProgressBar call to fix Build Window freeze on Unity 2020 [#10046](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10046)
- Remove support for preview Microsoft OpenXR plug-in versions [#10119](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10119)
- Add support for Leap UnityModules 4.9.1 [#10282](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10282)
- Reduced Hand Constraint debug log spam [#10331](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10331) [#10326](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10326)
- This is not an exhaustive list of the fixes that were made for MRTK 2.7.3! You can find the fixes that were made, on the [MRTK 2.7.3 milestone](https://github.com/microsoft/MixedRealityToolkit-Unity/milestone/25?closed=1)



## What's new in 2.7.2

### Fixed a UPM package dependency issue

There is an issue with MRTK 2.7.1 UPM packages where the dependencies were not set up correctly. The issue caused the Mixed Reality Feature Tool to fail to import MRTK 2.7.1 packages properly. The issue is now resolved in 2.7.2. There is no code change in this version compared to 2.7.1.


## What's new in 2.7.1

### Show version

The `Mixed Reality` > `Toolkit` menu now contains a `Show version...` entry that examines the Mixed Reality Toolkit Foundation package to determine the version of MRTK that is being used by the project.

![Show version menu](images/ShowVersionMenu.png)

![MRTK version dialog](images/VersionDialog.png)

> [!NOTE]
> If MRTK was cloned from the [GitHub repository](https://aka.ms/mrtk), the version information will not have been set.
>
> ![Unable to determine version](images/CannotDetermineVersion.png)

### Authors list

Starting with MRTK 2.7.1, the authors list file is included in the Mixed Reality Toolkit Foundation package.

### Integrated OpenXR project setup into the Configurator setup flow

Starting with MRTK 2.7.1, users of the Mixed Reality OpenXR plugin will receive instructions on how to set up that plugin with MRTK. There is an option for users targeting HoloLens 2 to apply recommended settings automatically.

![Configurator window with OpenXR setup instructions](images/configuratorMROpenXR.png)

### Notable Bugfixes and Changes

- Marked Unity Joystick Manager as supported on XR SDK pipeline [#9954](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9954), [#9994](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9994)
- Added checks to interactable inspector code to prevent null errors [#9943](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9943)
- Add OpenXR mesh provider to pulse shader example scene [#9902](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9902)
- Restore hand physics profile to example scene [#9915](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9915)
- Some cleanup to the HandConstraint* scripts [#9935](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9935)
- Fixed some bugs affecting creating and cloning profiles [#9982](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9982)


## What's new in 2.7.0

### OpenXR is now officially supported in MRTK

As the new OpenXR plugins are becoming more and more mature MRTK now officially supports OpenXR. Compared to previous releases we added the following capabilities to projects using OpenXR:

- [Support for the system-provided motion controller model](#support-for-the-system-provided-motion-controller-model-on-openxr)
- Support for WinMR gestures (select, hold, manipulation and navigation) [#9843](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9843)
- [Support for controller haptics](#support-for-controller-haptics-across-legacy-wmr-windows-xr-plugin-and-openxr)
- [Support for articulated hand mesh on HoloLens 2](#support-for-hololens-2-articulated-hand-mesh-on-openxr)
- Support for Spatial Mapping on HoloLens 2 [#9567](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9567), [#9827](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9827)
- Support for Scene Understanding on HoloLens 2 [#9744](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9744)

If you are targeting HoloLens 2 or Windows Mixed Reality headsets via OpenXR please make sure to install/update to **Mixed Reality OpenXR plugin version 0.9.5 or later** via [Mixed Reality Feature Tool](https://aka.ms/MRFeatureTool), otherwise you might miss some of the improvements above.

### Legacy XR and XR SDK Data Providers can now be used within the same profile

Data providers will now also only be loaded when the appropriate pipeline is selected, allowing both Legacy XR and XR SDK data providers to co-exist within
the same profile. To accommodate this, Legacy XR and XR SDK Data Providers are now organized under different tabs within the profile view, helping users
determine whether they have the correct profile for their targeted XR pipeline.

![Legacy and XR SDK data providers can now be unified under a single profile](../features/images/xrsdk/LegacyAndXrsdkUnified.png)

To accommodate this, null data providers will now no longer be loaded and displayed in the profile inspector. Users can toggle `Show null data providers in the profile inspector`
under **Edit -> Project Settings -> Mixed Reality Toolkit** to debug unexpected behaviors with missing data providers.

![Null data providers are now hidden by default](https://user-images.githubusercontent.com/39840334/115093658-ead24600-9ecf-11eb-91c2-486a37f69aba.png)
![Toggle show null data providers in the profile inspector](https://user-images.githubusercontent.com/39840334/115093670-f6257180-9ecf-11eb-96ec-ffe44a225a55.png)

### Added Experience Settings and an associated Mixed Reality Scene Content behavior

Users can now configure [Experience Settings](../features/experience-settings/experience-settings.md), which will allow MRTK to display [Mixed Reality Scene Content](../features/experience-settings/scene-content.md)
appropriately based on the targeted experience.

If user's previous Experience Scale settings do not match the new Experience Settings Profile, they will be prompted to correct it in the inspector

![Experience Scale Migration](https://user-images.githubusercontent.com/39840334/114946863-d70bde80-9e00-11eb-9859-fa40d40d2b36.gif)

### The Redesigned Configurator now guides the user through the setup process

The new MRTK configurator provides users step-by-step guidance to properly configure the project for XR development and use with MRTK. It covers the selection of XR pipeline, getting the platform specific plugins, importing TextMeshPro, displaying the examples (when using UPM) and other previously included recommended settings for the project.

![Configurator showing the pipelines list](images/Configurator.png)

### Graduated Teleport Hotspot

A new [teleport hotspot component](../features/teleport-system/teleport-hotspot.md) has been graduated. You can add a teleport hotspot to your GameObject to ensure that the user is in a certain position and orientation when they teleport to that location.

![Teleport Hotspot example](images/TeleportHotspot.gif)

### Graduated Dwell

The dwell feature and example is now graduated from experimental. New examples of volumetric HoloLens 2 style buttons are included in the sample scene.

![Dwell hero](../features/images/dwell/MRTK_UX_Dwell.png)

### Added support for Leap Motion Unity Modules version 4.6.0, 4.7.0, 4.7.1 and 4.8.0

Support for the latest versions of the [Leap Motion Unity Modules](https://developer.leapmotion.com/unity) is now compatible with MRTK 2.7.0. See [How to Configure MRTK for Leap Motion](../supported-devices/leap-motion-mrtk.md) for more information.

Big thanks to @jackyangzzh for contributing the new LeapMotionOrientationExample scene!

### Targeted speech events raised no longer restricted to gaze pointers

Previously, targeted speech events could only be raised on objects which were focused on with the gaze pointer. Now, objects can receive speech events if they are focused by any pointer.

![Speech Events with Far Pointers](https://user-images.githubusercontent.com/39840334/117516612-6fa00500-af4e-11eb-94ba-d5fb2ed4e7de.gif)

### Ported TextToSpeech from HTK to MRTK

The beloved TextToSpeech script is now finally available in MRTK to help you generate speech from text on the UWP platform using [`SpeechSynthesizer`](/uwp/api/windows.media.speechsynthesis.speechsynthesizer). Also added a sample scene to demonstrate the feature.

### Support for the system-provided motion controller model on OpenXR

Added support, both in-editor and at runtime, for the system-provided motion controller model on OpenXR.

![Editor window showing two motion controller models](https://user-images.githubusercontent.com/3580640/116493405-89a55d80-a853-11eb-95ae-d430e6fdc8b4.png)

### Support for HoloLens 2 articulated hand mesh on OpenXR

![The hand mesh running on-device in an MRTK example scene](https://user-images.githubusercontent.com/3580640/112909923-32bb3580-90a7-11eb-925d-464b135edc61.png)

### Support for controller haptics across legacy WMR, Windows XR Plugin, and OpenXR

Added support for controller haptics across legacy WMR, Windows XR Plugin, and OpenXR. [#9735](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9735)

### Support for eye tracking on Windows XR Plugin

Added support for eye gaze when using Windows XR Plugin minimum versions of 2.7.0 (Unity 2019), 4.4.2 (Unity 2020), and 5.2.2 (Unity 2021). [#9609](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9609)

### Notable Bugfixes and Changes

- Pinch detection made smoother. It is now harder to accidentally drop the pinch gesture. [#9576](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9576)
- Objects with the Object Manipulator component now consistently maintain velocity on release when the flag is set. [#9733](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9733)
- Back-strafing now checks for a floor, helping prevent situations where the camera can clip into the environment or where the user is left hovering over empty space.[#9697](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9697)
- IsNearObject is now a virtual property, allowing more flexibility when extending the sphere or poke pointer. [#9803](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9803)
- Buttons now display the proper keyword when showing the available speech command. [#9824](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9824)
- Oculus Controllers now uses it's own standalone visualizer, preventing the MRTK visualization from clashing with the Oculus Integration Package's visualization. [#9589](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9589)
- Keyboard related scripts have been changed to align with the behavior in latest Unity versions (2019.4.25+ & 2020.3.2+). As of the release there is still an auto-completion bug and a TMP Input Field bug (both are external to MRTK) impacting HoloLens. For more information please see [#9056](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9056) and [#9724](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9724).
- Improved the performance of Scrolling Object Collection. Also fixed an issue causing GameObject within the collection to lose material when duplicated. [#9813](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9813), [#9718](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9718)
- In the Scene Understanding demo script, added the `GetSceneObjectsOfType` function to retrieve all observed scene object of a certain kind. [#9524](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9524), [#9744](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9744)
- In command line build tool, only scenes specified by the `sceneList` or `sceneListFile` flags (when any flag is present) will be included in the build. [#9695](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9695)
- In build tool, there is a new option to specify a path to `nuget.exe` and use that to perform package restore instead of using `msbuild` (the default option). [#9556](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9556)
- Fixed issue where using Windows XR Plugin could result in stale hand joints and doubled hand meshes. [#9890](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9890)
- Fixed issue where using Windows XR Plugin's automatic remoting feature led to missing input and interactions. [#9868](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9868)
- Fixed issue where the BuildDeployWindow would try to query an invalid reg key for the Windows SDK path. [#9664](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9664)
- MRTK's glTF importers are now optional. If multiple glTF importers are present, MRTK's can be disabled by adding `MRTK_GLTF_IMPORTER_OFF` to the custom scripting define symbols. [#9658](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9658)
- Fixed issue where the Knuckles controllers on OpenVR weren't being detected properly. [#9881](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9881)
- Reduce the number of per-frame allocations when visualizing the hand mesh [#9756](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9756)
- Added a menu item to launch the MRTK Examples package (in Unity Package Manager) to make it easier to import samples [#9798](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9798)
- Reduced the number of load-time warnings when using Unity 2020.3.
- Added Build Window feature documentation: [Visit the page](../features/tools/build-window.md)

## Known Issues

### Audio demos are missing an asmdef file (UPM package)

When importing MRTK via the Mixed Reality Feature Tool, samples and demos are added to the project using the Unity Package Manager UI. After importing the Audio demos, the `WindowsMicrophoneStreamDemo.unity` scene will not behave properly. This is a result of a missing .asmdef file for the sample.

To work around this [issue](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/9908), please perform the following steps:

- Copy Library/PackageCache/com.microsoft.mixedreality.toolkit.examples@[...]/MRTK.Examples.asmdef into your "Assets/Samples/Mixed Reality Toolkit Examples" folder
- Rename the copied file to Examples
- Open the Examples file
- In the Name box, replace the contents with Examples
- Click Apply
- Build and deploy

This issue will be fixed in an upcoming MRTK release.

### MRTK build window triggers indefinite "Importing assets" dialog in Unity 2020.3

There is a known [issue](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/9723) with the MRTK build window on Unity 2020.3 where after successfully performing a UWP build, the "Importing assets" dialog does not complete. This issue is being investigated in partnership with Unity.

### Text Mesh Pro Canvas Renderer warnings in Unity 2020

The following warning is logged in most MRTK example scenes while using Unity 2020:

```txt
Please remove the CanvasRenderer component from the [TextMeshPro] GameObject as this component is no longer necessary.
```

The Canvas Renderer warning was added in [TextMeshPro version 3.0.3](https://docs.unity3d.com/Packages/com.unity.textmeshpro@3.0/changelog/CHANGELOG.html#changes-3). These warning do not have an impact on MRTK's example scenes and can be cleared from the console. See [Issue 9811](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/9811) for more details.