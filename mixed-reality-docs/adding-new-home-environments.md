---
title: Adding new home environments
description: How to add new environments to your list of places
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Home, Custom Environments, places
---


# Adding new home environments
Starting with the Windows April 2018 update (OS Version 1803) we've enabled an experimental feature that lets you add custom environments to your places picker. Windows Mixed Reality has two default environments, Cliff House and Skyloft that you can navigate between. Custom environments let you expand that list with your own creations so you can fully customize your home experience. We are making this available in an early experimental state to see what types of worlds artists and developers in the community build and how you work with different authoring tools. 

Custom environments expand the creative possibilities of Windows Mixed Reality by giving you the flexiblity to change the backdrop for the Mixed Reality. When using a custom environment you'll notice that teleporting, interacting with apps, and placing holograms works just like it does in the Cliff House and Skyloft. Browse the web in a fantasy world, or fill a futuristic city with holograms from the Holograms app, the possibilities are endless!

## Getting started
We've created 3 sample environments that show off some of some of the creative possibilities of custom environments. To get started:
1. Download one of our sample environments
<br>[Environment 1 Picture Placeholder] [Environment 2 Picture Placeholder] [Environment 3 Picture Placeholder]
<br>[Download Environment 1] [Download Environment 2] [Download Environment 3]
2. Open up File Explorer and navigate to the Environments folder by pasting the following in the address bar "%LOCALAPPDATA%\Packages\EnvironmentsApp_cw5n1h2txyewy\LocalState"
3. Copy and Paste the environment that you downloaded in step 1 into this environments folder
4. Restart the Mixed Reality Portal - this will refresh the list of environments in the places picker
5. Put on your headset and once in the Cliff House or Skyloft environment open the Start Menu using the Windows button your controller
6. Select the "Home" icon to go to the places picker
7. You will find the Fantasy Environment in your list of environments, select it to enter your new custom environment!

## Creating your own custom environment
We've created a few sample environments for you to explore, but you can also export your own custom environments using your favorite 3D editing software. 

### Modeling guidelines
When modeling your environment keep the following recommendations in mind. This will help ensure the user spawns in the correct orientation in a believably sized world:
1. Users will spawn at 0,0,0 so center your desired spawn location around the origin
2. Working Units should be set to meters so that assets can be authored at world scale
3. The Up axis should be set to “Y”.
4. The asset should face “forward” towards the positive Z axis.
5. All meshes do not need to be combined but it is recommended if you are targeting resource constrained devices

### Exporting your environment
Windows Mixed Reality relies on binary glTF (.glb) as the asset delivery format for environments. glTF is a royalty free open standard for 3D asset delivery maintained by the Khronos group. As glTF evolves as an industry standard for interoperable 3D content so will Microsoft’s support for the format across Windows apps and experiences.

The first step in exporting assets for to be used as Mixed Reality Home environments is generating a glTF 2.0 model. The glTF working group maintains a [list of supported exporters and converters](https://github.com/KhronosGroup/glTF/blob/master/README.md#converters-and-exporters) to create a glTF 2.0 model. To get started use one of the programs listed on this page to create and export a glTF 2.0 model, or convert an existing model using one of the supported converters.

Additionally check out [this helpful article](https://www.khronos.org/blog/art-pipeline-for-gltf) which provides an overview of an art workflow for exporting glTF models from Blender and 3DS Max directly. 

### Limits
All environments must be < 256 mbs. Environments larger than 256 mbs will fail to load and fallback to an empty world with just the default skybox surrounding the user. Please keep this file size limit in mind when creating your models. Additionally if you plan to optimize your environment using the WindowsMRAssetConverter as described below, be cognizant that the texture size will increase as the optimizer creates textures that have a larger file size, but load faster. 

### Optimizing your environment
Windows Mixed Reality supports a number of optional optimizations that will significantly reduce the load time of your environments. This can be important especially for environments with many textures as they will sometimes timeout while loading. In general we recommend this step for all assets, however smaller environments with few or low resolution textures won't always require it. 

To make this process easier we have created the Windows Mixed Reality Asset Converter which is [available on Github](https://github.com/Microsoft/glTF-Toolkit/releases) to perform your optimizations. This tool uses a set of utilities available in the Microsoft glTF toolkit to optimize any standard 2.0 glTF or .glb by performing an additional texture packing, compression and resolution down scaling. 

The converter currently supports a number of flags to tweak the exact behavior of the optimizations. We recommend running with the following flags for best results:

Flag|Recommended Value(s)|Description
---|---|---
-max-texture-size|1024 or 2048| Tweak this to improve the quality of the textures, default is 512x512. Note that a larger value will significantly impact the file size of the environment so keep the 256 mb limit in mind
-min-version|1803|Custom environments are only supported on versions of windows >= 1803. This flag will remove textures for older versions and reduce the file size of the final asset

For example:
```note
WindowsMRAssetConverter FileToConvert.gltf -max-texture-size 1024 -min-version 1803
```
### Testing your environment
Once you have your final .glb environment you're ready to test it out in the headset. Follow the steps above in the getting started section to take it for a spin. 

## Feedback
In this experimental release we're interested to see how you're using custom environments. Please share any and all feedback for creating and using these environments in the Windows Feedback Hub. The Windows Feedback Hub is preinstalled on Windows, simply search "Feedback Hub" with the Windows search bar and open the first result. When submitting feedback include "Custom Environments" in the title so that we can quickly find your suggestions. 

## Troubleshooting and tips
### How do I change the name of the environment?
The file name in the environments folder will be used in the places picker. To change the name of your environment simply rename the environment and then restart the Mixed Reality Portal
### How do I remove custom environments from my places picker?
To remove a custom environment simply open up the environments app folder on your PC and delete the environment. Once you restart the Mixed Reality portal this environment will no longer appear in the places picker. 
### How do I default to my favorite custom environment?
You can't currently change the default environment. Each time your restart the mixed reality portal you will be returned to the Cliff House environment. 
### I load into a blank space
Windows Mixed Reality doesn't support environments that exceed 256 mb. When an environment exceeds this limit you will land in the empty sky box with no model. 
### It takes a long time to load my environment, but eventually it shows up
You can optionally optimize your environment to make it load faster. See the optimizing your environment section above for details
### My environment loads but the scale is incorrect
Windows Mixed Reality translates glTF units to 1 meter when loading environments. If you environment loads up an unexpected scale, double check your exporter to ensure that you're modeling at a 1 meter scale. 
### I'm spawning in the wrong location in my environment
The default spawn location is located at 0,0,0 in the environment. Its not currently possible to customize this location so you must modify the spawn point by exporting your environment with the origin positioned at the desired spawn point. 

