---
title: Object collection
description: Overview of Object collection in MRTK
author: CDiaz-MS
ms.author: cadia
ms.date: 01/12/2021
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Object collection,
---

# Object collection &#8212; MRTK2

![Object collection](../images/object-collection/MRTK_ObjectCollection_Main.jpg)

Object collection is a script to help lay out an array of objects in predefined three-dimensional shapes. It supports various surface styles including plane, cylinder, sphere, and radial. Since it supports any object in Unity, it can be used to layout both 2D and 3D objects.

## Object collection scripts

- [`GridObjectCollection`](xref:Microsoft.MixedReality.Toolkit.Utilities.GridObjectCollection?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) supports Cylinder, Plane, Sphere, Radial surface types
- [`ScatterObjectCollection`](xref:Microsoft.MixedReality.Toolkit.Utilities.ScatterObjectCollection?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) supports scattered style collection  
- [`TileGridObjectCollection`](xref:Microsoft.MixedReality.Toolkit.Utilities.TileGridObjectCollection?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) provides some additional options to GridObjectCollection. **Note:** TileGridObjectCollection does not extend [`GridObjectCollection`](xref:Microsoft.MixedReality.Toolkit.Utilities.GridObjectCollection?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true), and has several bugs (see [issue 6237](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/6237)). Therefore, it is recommended to use [`GridObjectCollection`](xref:Microsoft.MixedReality.Toolkit.Utilities.GridObjectCollection?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true).

:::row:::
    :::column:::  
    ![Grid Object Collection - Cylinder](../images/object-collection/MRTK_ObjectCollectionCylinder.png) Grid Object Collection - Cylinder
    :::column-end:::
    :::column:::
    ![Grid Object Collection - Sphere](../images/object-collection/MRTK_ObjectCollectionSphere.png) Grid Object Collection - Sphere
    :::column-end:::
:::row-end:::
:::row:::
    :::column:::  
    ![Grid Object Collection - Radial](../images/object-collection/MRTK_ObjectCollectionRadial.png) Grid Object Collection - Radial
    :::column-end:::
    :::column:::
    ![Grid Object Collection - Plane](../images/object-collection/MRTK_ObjectCollectionPlane.png) Grid Object Collection - Plane
    :::column-end:::
:::row-end:::
:::row:::
    :::column:::  
    ![Scattered Object Collection](../images/object-collection/MRTK_ObjectCollectionScattered.png) Scattered Object Collection
    :::column-end:::
    :::column:::
    ![Tile Grid Object Collection](../images/object-collection/MRTK_ObjectCollectionTileGrid.png) Tile Grid Object Collection
    :::column-end:::
:::row-end:::



## How to use an object collection

To create a collection, create an empty GameObject and assign one of the Object Collection scripts to it. Any object(s) can be added as a child of the GameObject. Once finished adding child objects, click the *Update Collection* button in the inspector panel to generate the object collection. The objects will be laid out in the scene according to the collection parameters. Update Collection can be accessed through the code too.

![Object collection Script](../images/object-collection/MRTK_ObjectCollectionScript.png)

## `GridObjectCollection` content alignment

The content in a GridObjectCollection can be aligned so that the parent object is anchored to the top/middle/bottom and left/center/right of the collection. Use the **anchor** property to specify content alignment.

## `GridObjectCollection` layout order

Use the **Layout** field to specify the row / column order that children are laid out:

**Column Then Row** - Children are first laid out by horizontally (by column), then vertically (by row). Use **Num Columns** (or Columns property in code) to specify the number of columns in the grid.

![Column then row layout](../images/object-collection/MRTK_ColumnThenRow.png)

**Row Then Column** - Children are first laid out vertically (by row), then horizontally (by columns). Use **Num Rows** (or Rows property in code) to specify the number of rows in the grid.

![Row then column layout](../images/object-collection/MRTK_RowThenColumn.png)

**Horizontal** - Children are laid out in a single row using columns only

**Vertical** - Children are laid out in a single column using rows only.

## Object collection examples

The `ObjectCollectionExamples` (Assets/MRTK/Examples/Demos/UX/Collections/Scenes/ObjectCollectionExamples.unity) example scene contains various examples of object collection types.

[Periodic table of the elements](https://github.com/Microsoft/MRDesignLabs_Unity_PeriodicTable) is an example app that demonstrates how object collections work. It uses object collection to layout the 3D element boxes in different shapes.

## Object collection types

**3D objects**

An object collection can be used to layout imported 3D objects. The example below shows the plane and cylindrical layouts of 3D chair model objects using a collection.

![Object collection 3D](../images/object-collection/MRTK_ObjectCollection_3DObjects.jpg)

**2D Objects**

An object collection can also be crated from 2D images. For example, multiple images can be placed in a grid style.

![Object collection 2D](../images/object-collection/MRTK_ObjectCollection_Layout_2DImages.jpg)
