---
title: Design your own immersive environments
description: Learn how to create Windows Mixed Reality home environments of your own.
author: thmignon
ms.author: v-chmccl
ms.date: 04/30/2018
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Home, Custom Environments, places, cliff house, skyloft, user, create, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit
---

# Design your own immersive environments

>[!NOTE]
>This is an experimental feature. Give it a try and have fun with it, but don't be surprised if everything doesn't quite work as expected. We're evaluating the viability of this feature and interest in using it, so please tell us about your experience (and any bugs you've found) in the [developer forums](https://forums.hololens.com/categories/custom-home-environments).

Starting with the [Windows 10 April 2018 update](/windows/mixed-reality/enthusiast-guide/release-notes-april-2018), we've enabled an experimental feature that lets you add custom environments to the Places picker (on the Start menu) to use as the [Windows Mixed Reality home](../discover/navigating-the-windows-mixed-reality-home.md). Windows Mixed Reality has two default environments, Cliff House and Skyloft, you can choose as your home. Creating custom environments allows you to expand the list with your own creations. We're making this feature available in an early state to evaluate interest from creators and developers. See what kinds of worlds you create and understand how you work with different authoring tools.

When using a custom environment you'll notice that teleporting, interacting with apps, and placing holograms works just like it does in the Cliff House and Skyloft. You can browse the web in a fantasy landscape or fill a futuristic city with holograms - the possibilities are endless!

## Device support

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><strong>Feature</strong></td>
        <td><a href="/hololens/hololens2-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="/windows/mixed-reality/enthusiast-guide/immersive-headset-hardware-details"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Custom home environments</td>
        <td>❌</td>
        <td>✔️</td>
    </tr>
</table>

## Trying a sample environment

We've created a sample environment that shows off some of the creative possibilities of custom home environments. Follow these steps to try it out:
1. [Download our sample Fantasy Island environment](https://download.microsoft.com/download/B/2/5/B25C1AEF-40CD-4B03-A596-4BCA3D33035A/Fantasy_Island.exe) (link points to self-extracting executable).

    ![Fantasy Island sample environment](images/FantasyLand.jpg)<br>
    *Fantasy Island sample environment*<br>

2. Run the **Fantasy_Island.exe** file you downloaded.

    > [!NOTE]
    > When attempting to run a .exe file downloaded from the web (like this one), you may encounter a "Windows protected your PC" pop-up. To run Fantasy_Island.exe from this pop-up, select **More info** and then **Run anyway**. This security setting is meant to protect you from downloading files you may not want to trust, so please only choose this option when you trust the source of the file.

3. Open **File Explorer** and navigate to the environments folder by pasting the following file location in the address bar: `%LOCALAPPDATA%\Packages\EnvironmentsApp_cw5n1h2txyewy\LocalState`.
4. Copy the sample environment that you downloaded into this folder.
5. Restart **Mixed Reality Portal** to refresh the list of environments in the Places picker.
6. Put on your headset. Once you're in the home, open the **Start menu** using the Windows button your controller.
7. Select the **Places** icon above the list of pinned apps to choose a home environment.
8. You'll find the Fantasy Island environment that you downloaded in your list of places. Select **Fantasy Island** to enter your new custom home environment!

## Creating your own custom environment

In addition to using our sample environments, you can export your own custom environments using your favorite 3D editing software. 

### Modeling guidelines

When modeling your environment, keep the following recommendations in mind so that users spawns in the correct orientation in a believably sized world:

1. Users will spawn at 0,0,0 so center your spawn location around the origin.
2. Working Units should be set to meters so that assets can be authored at world scale.
3. The Up axis should be set to “Y”.
4. The asset should face “forward” towards the positive Z axis.
5. You don't have to combine all your meshes, but it's recommended if you're targeting resource-constrained devices.

### Exporting your environment

Windows Mixed Reality relies on binary glTF (.glb) as the asset delivery format for environments. glTF is a royalty free open standard for 3D asset delivery maintained by the Khronos group. Microsoft’s support for the format across Windows apps and experiences will grow as glTF evolves as an industry standard for interoperable 3D content.

The first step in exporting assets to be used as custom home environments is generating a glTF 2.0 model. The glTF working group maintains a [list of supported exporters and converters](https://github.com/KhronosGroup/glTF/blob/master/README.md#converters-and-exporters) to create a glTF 2.0 model. To get started, use one of the programs listed on this page to create and export a glTF 2.0 model, or convert an existing model using one of the supported converters.

<!-- Additionally, check out [this helpful article, which provides an overview of an art workflow for exporting glTF models from Blender and 3DS Max directly.  -->

### Environment limits

All environments must be < 256 mbs. Environments larger than 256 mbs will fail to load and fall back to an empty world with just the default skybox surrounding the user. Keep this file size limit in mind when creating your models. Additionally, if you plan to optimize your environment using the WindowsMRAssetConverter as described below, be cognizant that the texture size will increase as the optimizer creates textures that have a larger file size, but load faster. 

### Optimizing your environment

Windows Mixed Reality supports many optional optimizations that can significantly reduce your environment load times. Pay special attention with environments that have lots of textures, as they'll sometimes time out while loading. In general, we recommend this step for all assets, however, smaller environments with few or low-resolution textures won't always require it. 

To make this process easier, we've created the [Windows Mixed Reality Asset Converter (available on GitHub)](https://github.com/Microsoft/glTF-Toolkit/releases) to do your optimizations. This tool uses a set of utilities available in the Microsoft glTF toolkit to optimize any standard 2.0 glTF or.glb by performing an extra texture packing, compression, and resolution down-scaling. 

The converter currently supports several flags to tweak the exact behavior of the optimizations. We recommend running with the following flags for best results:

Flag|Recommended Value(s)|Description
---|---|---
-max-texture-size|1024 or 2048| Tweak the value to improve the quality of the textures, default is 512x512. A larger value will significantly impact the file size of the environment so keep the 256-mb limit in mind
-min-version|1803|Custom environments are only supported on versions of windows >= 1803. This flag will remove textures for older versions and reduce the file size of the final asset

For example:

```cmd
WindowsMRAssetConverter FileToConvert.gltf -max-texture-size 1024 -min-version 1803
```

### Testing your environment

Once you have your final.glb environment, you're ready to test it out in the headset. Start at step 2 in the ["Trying a sample environment"](#trying-a-sample-environment) section to use your custom environment as the mixed reality home. 

## Sending feedback

While we're evaluating this experimental feature, we're interested in learning how you're using custom environments, any bugs you may find, and how you like the feature. Share any feedback for creating and using custom home environments in the [developer forums](https://forums.hololens.com/categories/custom-home-environments).

## Troubleshooting and tips

### How do I change the name of the environment?

The file name in the environments folder will be used in the Places picker. To change the name of your environment, rename the environment file name, and then restart Mixed Reality Portal.

### How do I remove custom environments from my Places picker?

To remove a custom environment, open the environments folder on your PC (`%LOCALAPPDATA%\Packages\EnvironmentsApp_cw5n1h2txyewy\LocalState`) and delete the environment. Once you restart Mixed Reality Portal, this environment will no longer appear in the Places picker. 

### How do I default to my favorite custom environment?

You can't currently change the default environment. Each time you restart Mixed Reality Portal, you'll be returned to the Cliff House environment. 

### I spawn into a blank space

Windows Mixed Reality [doesn't support environments that exceed 256 mb](#environment-limits). When an environment exceeds this limit, you'll land in the empty sky box with no model.

### It takes a long time to load my environment

You can add optional optimizations to your environment to make it load faster. See ["Optimizing your environment"](#optimizing-your-environment) for details.

### The scale of my environment is incorrect

Windows Mixed Reality translates glTF units to 1 meter when loading environments. If your environment loads up an unexpected scale, double check your exporter to ensure that you're modeling at a 1-meter scale. 

### The spawn location in my environment is incorrect

The default spawn location is located at 0,0,0 in the environment. It's not currently possible to customize this location, so you must modify the spawn point by exporting your environment with the origin positioned at the spawn point you want.

### The audio doesn't sound correct in the environment

When you create your custom environment, it will be using an acoustics rendering simulation that doesn't match the physical space you've created. Sound may come from the wrong directions and may sound muffled. 

## See also
* [Windows Mixed Reality Asset Converter (on GitHub)](https://github.com/Microsoft/glTF-Toolkit/releases)