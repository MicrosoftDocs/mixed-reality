---
title: Unity UI Sample Scene
description: Illustrated walkthrough of featured UI elements
author: Species521
ms.author: wettigmarti
ms.date: 06/01/2022
ms.localizationpriority: medium
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Graphics Tools, MRGT, MR Graphics Tools, Standard Shader, Animation
---

# Unity UI Elements

UI elements provide interaction models which are intuitive and easily readable for the user.


![Standard Shader hover lights](images/SampleScenes/UnityUI_01.jpg)

## Interactive Elements

Buttons and sliders for example give the user a way to trigger an immediate action, they are two of the most foundational components in Mixed Reality.
In the Graphics Tools there are already button and slider prefabs available with a lot of customization options.
When you enter the scene in Unity's Play mode, you'll be able to interact with the samples.


<img src="images/SampleScenes/UnityUI_interactive_01.jpg" width="40%" height="40%">

In the above example, from top to bottom there are:
* the standard slider prefab, below an example of grouped standard buttons with a backplate as  

Button and slider templates are also heavily featured in the Mixed Reality Toolkit. For more details have a look at these pages:

* [Sliders in the MRTK](https://docs.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/sliders?view=mrtkunity-2022-05)
* [Buttons in the MRTK](https://docs.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/button?view=mrtkunity-2022-05)

## Masking Options

When building user interfaces you might want to mask out certain areas or restrict visibility for user guidance.
In Graphics Tools there are several options to achieve that: A fast rectangular masking option, a mask with options for rounded corners which is a little more expensive on performance, and it's also possible to make use of 3D meshes to be used as masking objects.


<img src="images/SampleScenes/UnityUImasking_sample_01.gif" width="40%" height="40%">


## 3D Mesh Integration and Animations

This example is a combination of several UI components. Several properties are also animatable, e.g. position and the amount of corner roundness described above. 
It is possible to integrate 3D meshes in your UI builds too.

<img src="images/SampleScenes/UnityUIinteractive_sample_01.gif" width="40%" height="40%">

Be aware that only static models can be intergrated, animations as in FBX exports aren't supported at the moment.

Related Topics:

* [Mixed Reality Toolkit on Github](https://github.com/microsoft/MixedRealityToolkit-Unity)
* [Graphics Tools Standard Shader sample scene](standard-shader.md)
