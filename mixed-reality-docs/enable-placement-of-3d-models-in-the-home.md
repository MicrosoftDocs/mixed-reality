---
title: Enable Placement of 3D Models in the home
description: How to place 3D models from your website or application in the Windows Mixed Reality home 
author: thmignon
ms.author: thmignon
ms.date: 05/04/2018
ms.topic: article
keywords: 3D, model, place in home, place, world, modeling
---


# Enable placement of 3D models in the home

> [!NOTE]
> This feature was added as part of the Windows April 2018 (1803) update. Older versions of Windows are not compatible with this feature so keep the Windows version that your experience is running on in mind. 

The [Windows Mixed Reality home](navigating-the-windows-mixed-reality-home.md) is the starting point where users land before launching applications. In some scenarios flat apps, like the Holograms app wish to place 3D models directly in the Mixed Reality home as decorations or for further inspection in full 3D. The add model protocol allows you to send a 3D model from your website or application directly to the Windows Mixed Reality home where it will persist amongst other apps and holograms. 

For example, if you're developing an application that surfaces a catalog of 3D furniture for designing a space you can use the add model protocol to let users place those 3D models from the catalog. Once placed in the world users can move, resize and remove them just like other holograms in the space. This article provides an overview of implementing the add model protocol so that you can start enabling users to decorate their world with objects from your experience.

## Overview
There are 2 steps to enabling the placement of 3D models in the Windows Mixed Reality home:
1. [Ensure your 3D model is compatible with the Windows Mixed Reality home](creating-3d-models-for-use-in-the-windows-mixed-reality-home.md)
2. Add the placement protocol to your application (this article)

## Implementing the add model protocol
Once you have a compatible 3D asset you can implement the add model protocol by activating the following URI from any website or application:
```note
ms-mixedreality:addmodel?uri=<Path to a .glb 3D model either local or remote>
```
If the URI points to a remote resource, then it will automatically be downloaded and placed in the home. Local resources will be copied to the mixed reality homes app data folder before being placed in the home. We recommend designing your experience to account for scenarios where the user might be running on an older Windows OS by hiding the button or disabling it if possible. 

Example: Invoking the add model protocol from a Universal Windows App:

```C#
private async void launchURI_Click(object sender, RoutedEventArgs e)
{
   // Define the add model URI
   var uriAddModel = new Uri(@"ms-mixedreality:addModel?uri=sample.glb");

   // Launch the URI to invoke the placement
   var success = await Windows.System.Launcher.LaunchUriAsync(uriAddModel);

   if (success)
   {
      // URI launched
   }
   else
   {
      // URI launch failed
   }
}
```

Invoking the add model protocol from a website:
```html
<a class="btn btn-default" href="ms-mixedreality:addModel?uri=sample.glb"> Place 3D Model </a>
```

## Experience notes
1. For immersive headsets, the Mixed Reality Portal does not have to be running before invoking the add model protocol. In this case the add model protocol will launch the Mixed Reality Portal and place the object directly where the headset is looking once you arrive in the Mixed Reality home. 
2. When invoking the add model protocol from the desktop with the Mixed Reality Portal already running ensure that the headset is "Awake". If not, the placement will not succeed. 

## See also
* [Creating 3D models for use in the Windows Mixed Reality home](creating-3d-models-for-use-in-the-windows-mixed-reality-home.md)
* [Navigating the Windows Mixed Reality home](navigating-the-windows-mixed-reality-home.md)
