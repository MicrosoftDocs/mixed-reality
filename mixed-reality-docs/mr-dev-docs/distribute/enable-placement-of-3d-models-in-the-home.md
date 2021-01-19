---
title: Enable placement of 3D models in the home
description: Learn how to place 3D models from your website or application in the Windows Mixed Reality home.
author: thmignon
ms.author: thmignon
ms.date: 05/04/2018
ms.topic: article
keywords: 3D, model, place in home, place, world, modeling, mixed reality home, web, app, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Enable placement of 3D models in the mixed reality home

> [!NOTE]
> This feature was added as part of the [Windows 10 April 2018 Update](/windows/mixed-reality/enthusiast-guide/release-notes-april-2018). Older versions of Windows are not compatible with this feature.

The [Windows Mixed Reality home](../discover/navigating-the-windows-mixed-reality-home.md) is the starting point where users land before launching applications. In some scenarios, 2D apps (like the Holograms app) enable placement of 3D models directly into the mixed reality home as decorations or for further inspection in full 3D. The *add model protocol* allows you to send a 3D model from your website or application directly into the Windows Mixed Reality home, where it will persist like [3D app launchers](3d-app-launcher-design-guidance.md), 2D apps, and holograms. 

For example, if you're developing an application that surfaces a catalog of 3D furniture for designing a space, use the *add model protocol* to allow users to place those 3D furniture models from the catalog. Once placed in the world, users can move, resize, and remove these 3D models just like other holograms in the home. This article provides an overview of implementing the *add model protocol* for enabling users to decorate their world with 3D objects from your app or the web.

## Device support

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><strong>Feature</strong></td>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Add model protocol</td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
</table>

## The basics

There are two steps to enabling the placement of 3D models in the Windows Mixed Reality home:
1. [Ensure your 3D model is compatible with the Windows Mixed Reality home](creating-3d-models-for-use-in-the-windows-mixed-reality-home.md).
2. Implement the *add model protocol* in your application or webpage (this article).

## Implementing the *add model protocol*

Once you have a [compatible 3D model](creating-3d-models-for-use-in-the-windows-mixed-reality-home.md), you can implement the *add model protocol* by activating the following URI from any webpage or application:

```
ms-mixedreality:addmodel?uri=<Path to a .glb 3D model either local or remote>
```

If the URI points to a remote resource, then it will automatically be downloaded and placed in the home. Local resources will be copied to the mixed reality home's app data folder before being placed in the home. We recommend designing your experience to account for scenarios where the user might be running an older version of Windows that doesn't support this feature by hiding the button or disabling it if possible. 

### Invoking the *add model protocol* from a Universal Windows Platform app:

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

### Invoking the *add model protocol* from a webpage:

```html
<a class="btn btn-default" href="ms-mixedreality:addModel?uri=sample.glb"> Place 3D Model </a>
```

## Considerations for immersive (VR) headsets

* For immersive (VR) headsets, the Mixed Reality Portal doesn't have to be running before invoking the *add model protocol*. In this case, the *add model protocol* will launch the Mixed Reality Portal and place the object directly where the headset is looking once you arrive in the mixed reality home. 
* When invoking the *add model protocol* from the desktop with the Mixed Reality Portal already running, ensure that the headset is "awake". If not, the placement won't succeed. 

## See also

* [Creating 3D models for use in the Windows Mixed Reality home](creating-3d-models-for-use-in-the-windows-mixed-reality-home.md)
* [Navigating the Windows Mixed Reality home](../discover/navigating-the-windows-mixed-reality-home.md)