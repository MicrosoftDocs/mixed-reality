---
title: Introduction to the BabylonJS and WebXR tutorials
description: Complete this course to learn how to use BabylonJS and create basic Mixed Reality application.
author: bogenera
ms.author: ayyonet
ms.date: 03/05/2021
ms.topic: article
keywords: mixed reality, javascript, tutorial, BabylonJS, hololens, mixed reality, UWP, Windows 10
ms.localizationpriority: high
---

# Tutorial: Create your first WebXR application using BabylonJS

This tutorial shows you how to create a basic Mixed Reality app using BabylonJS and Visual Studio Code. The app renders a cube allowing user to rotate it to bring the other faces into view and interact with it. In this tutorial, you learn how to:

> [!div class="checklist"]
> * Set up a development environment
> * The API to create basic 3D elements  
> * Create a new web page to display results
> * Interact with 3D elements
> * Deploy and test the application in a HoloLens2 emulator

## Prerequisites
<!-- Perhaps list the browsers explicitly? Microsoft Edge 2020 or later, Chrome 79, Firefox? -->
* WebXR-supported browser, for example [Microsoft Edge](https://docs.microsoft.com/windows/mixed-reality/whats-new/new-microsoft-edge)
* [BabylonJS](https://doc.babylonjs.com/divingDeeper/developWithBjs/frameworkVers) 4.2 or higher
* [NodeJS](https://nodejs.org/)
* [Git](https://git-scm.com/)

## Getting started

To create this project from scratch, start with a Visual Studio Code (VSCode) project.

> [!NOTE]
> It is not mandatory to use only VSCode, it is for convenience only. More experienced javascript developers can
use any other editor of their choice, even the simplest Notepad.

1. Either download the [BabylonJS](https://doc.babylonjs.com/divingDeeper/developWithBjs/frameworkVers) single file or use an online version. Alternatively you can clone an entire BabylonJS project from [GitHub](https://github.com/BabylonJS/Babylon.js)
1. Create an empty file and save it as html page, for example index.html
1. Create a basic html markup and reference the Babylon.js javascript file, as following:

    ```html
    <html>
        <head>
            <title>Babylon.js sample code</title>
            <script src="https://preview.babylonjs.com/babylon.js"></script>
            <style>
                body { width: 100%; height: 100%;}
            </style>
        </head>
    <body>
    </body>
    </html>
    ```

1. Add a *canvas* html element inside the body to render contents of BabylonJS, as shown below. Note the canvas has id attribute, so that this html element can be accessed from JavaScript code later.

    ```html
    <body>
        <canvas id="renderCanvas"></canvas>
    </body>
    ```

1. That completes our hosting web page. At this point, the hosting web page is ready. You can open it in any browser and ensure there are no errors shown, though there is no immersive experience yet.

> [!div class="nextstepaction"]
> [Next Tutorial: 2. Setup a canvas](prepare-scene-02.md)