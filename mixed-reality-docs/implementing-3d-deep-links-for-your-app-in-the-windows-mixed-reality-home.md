---
title: Implementing 3D deep links for your app in the Windows Mixed Reality home
description: 
author: 
ms.author: thmignon
ms.date: 2/28/2018
ms.topic: article
keywords: 
---



# Implementing 3D deep links for your app in the Windows Mixed Reality home

Your 2D applications can be enhanced for Windows Mixed Reality by adding the ability to place 3D models from your app into the [Windows Mixed Reality home](navigating-the-windows-mixed-reality-home.md) as deep links to content within your 2D app, just like [2D secondary tiles](https://docs.microsoft.com/en-us/windows/uwp/controls-and-patterns/tiles-and-notifications-secondary-tiles) on the Windows Start menu. For example, you can create 360° photospheres that link directly into a 360° photo viewer app, or let users place 3D content from a collection of assets that opens a details page about the author. These are just a couple ways to expand the functionality of your 2D application with 3D content.

**Note:** 3D deep links are not currently available for use on HoloLens, and only work with 2D apps on immersive headsets. You can, however, create a [3D app launcher](implementing-3d-app-launchers.md) to launch an exclusive app from the Windows Mixed Reality home.

## Creating a 3D “secondaryTile”
> [!NOTE]
> This feature was added as part of the Fall Creators updated. Make sure your application is targeting a version of the Windows SDK greater than or equal to 10.0.16299.91 which can be downloaded [here](https://developer.microsoft.com/en-US/windows/downloads/windows-10-sdk)

 You can place 3D content from your application using “secondaryTiles” by defining a mixed reality model at creation time. Mixed reality models are created by referencing a 3D asset in your app package and optionally defining a bounding box. **Note:** creating “secondaryTiles” from within an exclusive view is not currently supported.

```
using Windows.UI.StartScreen;
using Windows.Foundation.Numerics;
using Windows.Perception.Spatial;

// Initialize the tile
SecondaryTile tile = new SecondaryTile("myTileId")
{
    DisplayName = "My Tile",
    Arguments = "myArgs"
};

tile.VisualElements.Square150x150Logo = new Uri("ms-appx:///Assets/MyTile/Square150x150Logo.png");

//Assign 3D model (only ms-appx and ms-appdata are allowed)
TileMixedRealityModel model = tile.VisualElements.MixedRealityModel;
model.Uri = new Uri("ms-appx:///Assets/MyTile/MixedRealityModel.glb");
model.BoundingBox = new SpatialBoundingBox
{
    Center = new Vector3 { X = 1, Y = 0, Z = 0 },
    Extents = new Vector3 { X = 3, Y = 5, Z = 4 }
};

// And place it
await tile.RequestCreateAsync();
```

## Bounding box

A bounding box can be used to add an additional buffer region around the object. The bounding box is specified using a center point and extents which indicate the distance from the center of the bounding box to its edges along each axis. Units for the bounding box can be mapped to 1 unit = 1 meter. If a bounding box is not provided then one will be automatically fitted to the mesh of the object. If the provided bounding box is smaller than the model then it will be resized to fit the mesh.

## Obtaining and updating an existing “secondaryTile”

Developers can get back a list of their existing secondary tiles, which includes the properties that they previously specified. They can also update the properties by changing the value and then calling UpdateAsync().

```
// Grab the existing secondary tile
SecondaryTile tile = (await SecondaryTile.FindAllAsync()).First();

Uri updatedUri = new Uri("ms-appdata:///local/MixedRealityUpdated.glb");

// See if the model needs updating
if (!tile.VisualElements.MixedRealityModel.Uri.Equals(updatedUri))
{
    // Update it
    tile.VisualElements.MixedRealityModel.Uri = updatedUri;

    // And apply the changes
    await tile.UpdateAsync();
}
```

## Checking that you're in Mixed Reality

3D deep links can only be created while the view is being displayed in a Mixed Reality headset. When your view isn't being presented in a Mixed Reality headset we recommend gracefully handling this by either hiding the entry point or showing an error message. You can check this by querying [IsCurrentViewPresentedOnHolographic()](https://docs.microsoft.com/en-us/uwp/api/windows.applicationmodel.preview.holographic.holographicapplicationpreview#Windows_ApplicationModel_Preview_Holographic_HolographicApplicationPreview_IsCurrentViewPresentedOnHolographicDisplay_).

## Tile notifications

Tile notifications do not currently support sending an update with a 3D asset. This means that developers will not be able to do the following
* Push Notifications
* Periodic Polling
* Scheduled Notifications

For more information on the other tiles features and attributes and how they are used for 2D tiles refer to the [Tiles for UWP Apps documentation](https://docs.microsoft.com/en-us/windows/uwp/controls-and-patterns/tiles-and-notifications-creating-tiles).

## Creating 3D assets

3D Assets to be used as launchers for your application should be authored using the [Windows Mixed Reality authoring guidelines](creating-3d-models-for-use-in-the-windows-mixed-reality-home.md) to ensure compatibility. Assets that fail to meet this authoring specification will not be rendered in the Windows Mixed Reality home.

## See also
* [Mixed Reality Model Sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/MixedRealityModel) demonstrates 3D secondary tiles.
* [Implementing 3D app launchers](implementing-3d-app-launchers.md)
* [Creating 3D models for use in the Windows Mixed Reality home](creating-3d-models-for-use-in-the-windows-mixed-reality-home.md)
* [Navigating the Windows Mixed Reality home](navigating-the-windows-mixed-reality-home.md)