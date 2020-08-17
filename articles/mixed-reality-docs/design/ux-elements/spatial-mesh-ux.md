---
title: Spatial mesh visualization
author: cre8ivepark
ms.author: dongpark
ms.date: 06/19/2020
ms.topic: article
keywords: Mixed Reality, HoloLens, UI Controls, interaction, ui, ux, UX Design, spatial UI, spatial interaction, 3D UI, 3D UX
---

# Spatial mesh

![Spatial mesh](images/UX/MRTK_PulseShader_SpatialMesh.gif)

Through the spatial mesh visualization, the user can learn how a device perceives and understands the physical environment. In addition to providing spatial context, proper spatial mesh visualization can create a delightful and magical experience.  

## Design guideline
Since it's important to allow the user to focus and interact with content, continuous and repeated visualization of the spatial mesh in the background could be distracting. It is recommended to visualize the environment sparingly, either only once in the initial launch or when the user shows clear intention to see the environmental mesh by targeting and air-tapping space. You can observe this behavior in the HoloLens shell.
<br>


## Spatial mesh visualization in MRTK (Mixed Reality Toolkit) for Unity
MRTK provides several materials for the spatial mesh visualization.

- **MRTK_Wireframe.mat, MRTK_Wireframe.mat**: Default static spatial mesh material which shows the mesh outlines without animation. This material is useful for debugging purposes since it shows the entire spatial mesh geometries. However, it is not recommended for production.
<br>
<img src="images/SurfaceReconstruction.jpg" alt="Wireframe spatial mesh visualization" width="640px">

- **MRTK_SurfaceReconstruction.mat**: This material gives you an animated pulse effect on the spatial mesh. You can use this material to visualize the environment at a specific moment of your experience or on the user's air-tap input. See **PulseShaderExamples.unity** scene for the examples.
<br>
<img src="images/UX/MRTK_SRMesh_Pulse.jpg" alt="Pulse spatial mesh visualization" width="640px">
* Please see [MRTK - Spatial Awareness](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/SpatialAwareness/SpatialAwarenessGettingStarted.html) and [MRTK - Pulse Shader](https://microsoft.github.io/MixedRealityToolkit-Unity/Assets/MRTK/SDK/Experimental/PulseShader/README.html) for more details.

<br>

---

## See also

* [Cursors](cursors.md)
* [Hand ray](point-and-commit.md)
* [Button](button.md)
* [Interactable object](interactable-object.md)
* [Bounding box and App bar](app-bar-and-bounding-box.md)
* [Manipulation](direct-manipulation.md)
* [Hand menu](hand-menu.md)
* [Near menu](near-menu.md)
* [Object collection](object-collection.md)
* [Voice command](voice-input.md)
* [Keyboard](keyboard.md)
* [Tooltip](tooltip.md)
* [Slate](slate.md)
* [Slider](slider.md)
* [Shader](shader.md)
* [Billboarding and tag-along](billboarding-and-tag-along.md)
* [Displaying progress](progress.md)
* [Surface magnetism](surface-magnetism.md)
