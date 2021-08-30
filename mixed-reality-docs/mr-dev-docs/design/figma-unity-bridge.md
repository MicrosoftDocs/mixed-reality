---
title: MRTK Figma Unity Bridge
description: Download Figma file which contains assets for common UI building blocks.
author: dongpark
ms.author: dongpark
ms.date: 03/29/2021
ms.topic: article
keywords: Figma, Sketch, Adobe XD, design, designer, design file, UX design, HoloLens, MRTK, Mixed Reality Toolkit
---

# MRTK Figma Unity Bridge (Beta)

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RWGqke]

MRTK Figma Unity Bridge allows you to bring the layout from Figma Toolkit into Unity. The bridge can import UI layout created with MRTK Figma Toolkit, then instantiates corresponding MRTK prefabs with proper position and size. This will help design integration process and collaboration between designers and developers.

> [!IMPORTANT]
> **Requires MRTK-Unity 2.7.0 or higher**
> 
> Since Figma Toolkit and Figma Bridge are based on MRTK 2.7.0 prefabs, MRTK 2.7.0 or higher version is required. When used with lower version of MRTK, some components won't be translated properly.

See [MRTK Figma Toolkit](figma-toolkit.md) page to learn about Figma Toolkit which is the design file with HoloLens 2 style UI library.

## How to use Figma Unity Bridge

### 1. Install Figma Unity Bridge

Figma Unity Bridge can be installed through [Mixed Reality Feature Tool](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/unity/welcome-to-mr-feature-tool). Download and run Mixed Reality Feature Tool.

In **Discover features** page, under **Mixed Reality Toolkit** section, select **MRTK Figma Unity Bridge**. Follow the steps to finish MR Feature Tool and come back to your Unity project. Unity will import the package for MRTK Figma Unity Bridge.

### 2. Open Figma Unity Bridge window

Once the import process is done, you will be able to find Figma Unity Bridge under the menu **Mixed Reality > Toolkit > Figma Unity Bridge**

### 3. Generate and enter your Figma Token


### 4. Enter ID for a Figma document


### 5. Load file and build a page


### 6. Refresh a document for changes












Use **Duplicate to your drafts** menu to make a copy.

<img src="images/UX_Figma_Use1.png" width="500px" alt="Menu duplicate 1"><br>

Click **Back to files** to see duplicated copy. You can use this copy for your own creation.

<img src="images/UX_Figma_Use2.png" width="400px" alt="Menu duplicate 2"><br>

<img src="images/UX_Figma_Use3.png" width="300px" alt="Menu duplicate 3"><br>

To download and work locally, use **File > save local copy** menu. Import downloaded file (.fig) into Figma using the **Import** button on the upper right corner.

<img src="images/UX_FigmaToolkit_Import.png" width="200px" alt="Import menu"><br>

You can use the **Pages** menus on the left to open different pages included in the file.

<img src="images/UX_FigmaToolkit_PageMenu.png" width="200px" alt="Page menu"><br>

Open **Introduction** page to learn about how to use components and states.

## UI Gallery & Components
UI Gallery and Components page show all available components for your design.

![Figma Toolkit Example - Menu UI 1](images/UX_FigmaToolkit_Components_Menu1.png)<br>

![Figma Toolkit Example - Menu UI 2](images/UX_FigmaToolkit_Components_Menu2.png)<br>


![Figma Toolkit Example - Menu UI 4](images/UX_FigmaToolkit_Components_Menu3a.png)<br>

Using **Assets** tab, you can browse these components and drag into your page.

<img src="images/UX_FigmaToolkit_Components_Menu3.png" width="200px" alt="Assets tab"><br>


## Examples

Figma Toolkit could be useful to sketch menu UI. 

![Figma Toolkit Example - Menu UI 5](images/UX_FigmaToolkit_Examples_Menu.png)<br>


Assets could be used for storyboarding.

![Figma Toolkit Example - Storyboarding](images/UX_FigmaToolkit_Examples_Storyboarding.png)<br>


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
