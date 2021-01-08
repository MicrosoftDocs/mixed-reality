---
title: MRTK 101 - Using common spatial interactions 
description: How to use Mixed Reality Toolkit Unity for Basic Interactions for HoloLens 2, HoloLens, Windows Mixed Reality, and Open VR.
author: cre8ivepark
ms.author: dongpark
ms.date: 08/27/2019
ms.topic: article
keywords: HoloLens, MRTK, Mixed Reality Toolkit, Windows Mixed Reality, design, sample app, controls, mixed reality headset, windows mixed reality headset, virtual reality headset
ms.localizationpriority: high
---

# MRTK 101: How to use Mixed Reality Toolkit Unity for common spatial interactions

![MRTK](images/MRTK101/MRTK101Cover.png)

Learn about how to use MRTK to achieve some of the most widely used common interaction patterns in mixed reality.

- How to simulate input interactions in Unity editor?
- How to grab and move an object?
- How to resize an object?
- How to move or rotate an object with precision?
- How to make an object respond to input events?
- How to add visual feedback?
- How to add audio feedback?
- How to use HoloLens 2 style button prefabs?
- How to make an object follow you?
- How to make an object face you?

> [!NOTE]
> This article has been updated to reflect the changes in [MRTK v2.5.1 release](https://github.com/microsoft/MixedRealityToolkit-Unity/releases/tag/v2.5.1)

All contents in this page can be tested in Unity editor with MRTK's Input Simulation. If you haven't, follow [MRTK Installation Guide (GitHub)](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/Installation.html) to install the latest version of MRTK.

## How to simulate input interactions in Unity editor?

MRTK supports in-editor input simulation. Run your scene by clicking Unity's play button, then use the following keys to simulate input:
- Press W, A, S, D keys to move the camera.
- Hold the right mouse button and move the mouse to look around.
- Press Space bar(Right hand) or left Shift key(Left hand) to bring up the simulated hands
- Press T or Y keys to keep simulated hands in view
- Press Q or E(horizontal) / R or F(vertical) to rotate simulated hands

You can learn more about Input Simulation in the [MRTK documentation](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/InputSimulation/InputSimulationService.html).

## How to grab and move an object?

Attach the **ObjectManipulator.cs** and **NearInteractionGrabbable.cs** scripts to make an object grabbable. ObjectManipulator supports both near and far interactions. You can grab and move an object with HoloLens 2's articulated hand tracking input(near), hand ray(far), motion controller's beam(far), and HoloLens gaze cursor and air-tap(far).

<br/><img alt="NearInteractionGrabbable and ObjectManipulator.cs assigned to an object" width="800" src="images/MRTK101/MRTK_ManipulationHandler.png">

<br/><img alt="NearInteractionGrabbable and ObjectManipulator.cs assigned to an object for grab and move" width="800" src="images/MRTK101/MRTK_GrabMove.gif">


## How to resize an object?
**ObjectManipulator.cs** supports two-handed scale/rotation. The script works with various input types, such as HoloLens 2's articulated hand input, HoloLens 1's gaze + gesture input, and Windows Mixed Reality immersive headset's motion controller input.

- [Learn more about Object Manipulator in the MRTK documentation](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_ObjectManipulator.html)

<br/><img alt="NearInteractionGrabbable and ObjectManipulator.cs assigned to an object for manipulation" width="800" src="images/MRTK101/MRTK_ManipulationHandler.gif">

## How to move or rotate an object with precision?
Assign **BoundsControl.cs** to an object to use Bounding Box, which is the interface for scaling and rotating an object. By default, it shows HoloLens 1 style blue handles and wires. To use HoloLens 2 style proximity-based animated handles, you need to assign prefabs and materials. 

<br/><img alt="BoundsControl.cs assigned to an object image" width="800" src="images/MRTK101/MRTK_BoundingBox.png">

<br/><img alt="BoundsControl.cs assigned to an object gif" width="800" src="images/MRTK101/MRTK_BoundingBox.gif">

- [Learn more about Bounds Control in the MRTK documentation](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_BoundsControl.html)


## How to make an object respond to input events?
Assign **PointerHandler.cs** to an object. In the inspector, you can use events OnPointerDown(), OnPointerUp(), OnPointerClicked(), OnPointerDragged()
To use these events in a script, implement **IMixedRealityPointerHandler**.

<br/><img alt="PointerHandler.cs assigned to an object image" width="800" src="images/MRTK101/MRTK_PointerHandler.png">

- [Learn more about Input System in the MRTK documentation](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/Input/Overview.html)

## How to add visual feedback?
Assign **Interactable.cs** to an object. In the inspector, add target object and create a new theme. Using Interactable's theme profiles, you can easily add visual feedback to all available input interaction states.

<br/><img alt="Image of PointerHandler.cs assigned to an object" width="800" src="images/MRTK101/MRTK_Interactable.png">

<br/><img alt="Interactable gif" width="800" src="images/MRTK101/MRTK_Interactable.gif">


Interactable provides various types of themes including the shader theme, which allows you to control properties of the shader per interaction state.

- [Learn more about Interactable in the MRTK documentation](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_Interactable.html)

Another important building block for visual feedback is the **MRTK Standard Shader**. With MRTK Standard Shader, you can easily add visual feedback effects such as hover light and proximity light. Since MRTK Standard shader performs less computation than the Unity Standard shader, you can create a performant experience.

Create a new material and select the Shader 'Mixed Reality Toolkit > Standard'. Or you can pick one of the existing materials that use MRTK Standard Shader.

<br/><img alt="MRTK Standard Shader image 1" width="400" src="images/MRTK101/MRTK_Shader0.png">
<br/><br/>
<img alt="MRTK Standard Shader image 2" width="800" src="images/MRTK101/MRTK_Shader1.png">

<img alt="MRTK Standard Shader image 3" width="800" src="images/MRTK101/MRTK_Shader.gif">


- [Learn more about MRTK Standard Shader in the MRTK documentation](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_MRTKStandardShader.html)

## How to add audio feedback?
Add **AudioSource** to an object. Then, in the scripts that expose input events(e.g. Interactable.cs or PointerHandler.cs), assign the object with AudioSource to the event and select **AudioSource.PlayOneShot()**. You can use your audio clips or choose one from MRTK's audio assets.

<br/><img alt="Audio Source assigned to an object. AudioSource.PlayOneShot configured in the Interactable's OnPress() and OnRelease() events." width="800" src="images/MRTK101/MRTK_Audio.png">

## How to use HoloLens 2 style button prefabs?
MRTK provides various types of HoloLens 2's shell (OS) style buttons, including visual feedback like proximity light, compressing box, and a ripple effect on the button surface that improve the user's confidence.

<br/><img alt="Interactable button" width="800" src="images/MRTK101/MRTK_Button.gif">

Drag and drop one of the **HoloLens 2 style pressable button prefab** into your scene. The prefab uses Interactable.cs introduced above. You can use exposed events such as OnClick() in the Interactable to trigger actions.

<br/><img alt="HoloLens 2 Button Prefab" width="800" src="images/MRTK101/MRTK_Button.png">

- [Learn more about Button prefabs in the MRTK documentation](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_Button.html)

## How to make an object follow you?
Assign **RadialView.cs** or **Follow.cs** script to an object. It's part of the Solver script series that allows you to achieve various types of object positioning in 3D space. **SolverHandler.cs** will be automatically added.
Below is an example of RadialView configuration to achieve 'lazy follow' tag-along behavior just like the Start menu in the HoloLens shell. You can specify the minimum/maximum distance and minimum/maximum view degrees. The example below shows positioning the object between 0.4 m and 0.8-m range within 15°. Adjust Lerp Time values to make the positional update faster or slower.

<br/><img alt="MRTK Standard Shader for solver" width="400" src="images/MRTK101/MRTK_SolverRadialView.png">

<br/><img alt="Interactable radial solver" width="800" src="images/MRTK101/MRTK_RadialViewSolver.gif">

- [Learn more about Solvers in the MRTK documentation](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_Solver.html)

## How to make an object face you?
Assign **Billboard.cs** script to an object. It will always face you, whatever your position. You can specify the pivot axis option.

<br/><img alt="Image of Billboard.cs script assigned to an object with Pivot Axis option Y" width="800" src="images/MRTK101/MRTK_Billboard.png">

<br/><img alt="Billboard.cs script assigned to an object with Pivot Axis option Y" width="800" src="images/MRTK101/MRTK_Billboard.gif">


Ready to create amazing experiences for mixed reality? Visit the pages below and learn more about MRTK and mixed reality.

## About the author

<table style="border-collapse:collapse" padding-left="0px">
<tr>
<td style="border-style: none" width="60px"><img alt="Picture of Dong Yoon Park" width="60" height="60" src="images/dongyoonpark.jpg"></td>
<td style="border-style: none"><b>Dong Yoon Park</b><br>UX Designer @Microsoft</td>
</tr>
</table>

## Next Development Checkpoint

If you're following the Unity development checkpoint journey we've laid out, you're in the midst of exploring the MRTK core building blocks. From here, you can continue to the next building block: 

> [!div class="nextstepaction"]
> [Camera](camera-in-unity.md)

Or jump to Mixed Reality platform capabilities and APIs:

> [!div class="nextstepaction"]
> [Shared experiences](shared-experiences-in-unity.md)

You can always go back to the [Unity development checkpoints](unity-development-overview.md#2-core-building-blocks) at any time.

## See also
* [MRTK Installation Guide (GitHub)](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/Installation.html)
* [Mixed Reality Toolkit-Unity (MRTK) GitHub](https://github.com/Microsoft/MixedRealityToolkit-Unity)
* [MRTK Documentation Portal (GitHub)](https://microsoft.github.io/MixedRealityToolkit-Unity/README.html)
* [HoloToolkit to MRTK Porting Guideline](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/HTKToMRTKPortingGuide.html)
