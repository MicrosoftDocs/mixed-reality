---
title: Introduction to the babylon.js and WebXR tutorials
description: Complete this course to learn how to use babylon.js and create basic Mixed Reality application.
author: bogenera
ms.author: ayyonet
ms.date: 03/05/2021
ms.topic: article
keywords: mixed reality, javascript, tutorial, BabylonJS, hololens, mixed reality, UWP, Windows 10, WebXR, immersive web
ms.localizationpriority: high
---

# Tutorial: Create your first WebXR application using babylon.js

This tutorial will show you how to create a basic Mixed Reality app using babylon.js and Visual Studio Code. The app you're going to build will render a cube, let you rotate it to bring the other faces into view, and add interactions. In this tutorial, you learn how to:

> [!div class="checklist"]
> * Set up a development environment
> * The API to create basic 3D elements  
> * Create a new web page to display results
> * Interact with 3D elements
> * Run the application in a MixedReality emulator

## Prerequisites
<!-- Perhaps list the browsers explicitly? Microsoft Edge 2020 or later, Chrome 79, Firefox? -->
* [Windows 10 Creator Update](https://www.microsoft.com/software-download/windows10)
* WebXR-supported browser, for example [Microsoft Edge](https://docs.microsoft.com/windows/mixed-reality/whats-new/new-microsoft-edge)
* [Babylon.js](https://doc.babylonjs.com/divingDeeper/developWithBjs/frameworkVers) 4.2 or higher
* [NodeJS](https://nodejs.org/)
* [Git](https://git-scm.com/)
* [Windows Mixed Reality simulator](https://docs.microsoft.com/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-windows-mixed-reality-simulator)

## Getting started

To create this project from scratch, start with a Visual Studio Code (VSCode) project.

> [!NOTE]
> Using VSCode isn't mandatory, but we'll be using it for convenience throughout the tutorial. More experienced javascript developers can use any other editor of their choice, even the simplest Notepad.

1. Either download the [babylon.js](https://doc.babylonjs.com/divingDeeper/developWithBjs/frameworkVers) single file or use an online version. You can also clone an entire BabylonJS project from [GitHub](https://github.com/BabylonJS/Babylon.js)
1. Create an empty file and save it as html page, for example index.html
1. Create a basic html markup and reference the Babylon.js javascript file. The final code is as shown below:

    ```html
    <html>
        <head>
            <title>Babylon.js sample code</title>
            <script src="https://cdn.babylonjs.com/babylon.js"></script>
        </head>
    <body>
    </body>
    </html>
    ```

1. Add a *canvas* HTML element inside the body to render the contents of babylon.js. Note that the canvas has an id attribute, which lets you access this HTML element from JavaScript later on.

    ```html
    <html>
        <head>
            <title>Babylon.js sample code</title>
            <script src="https://cdn.babylonjs.com/babylon.js"></script>
            <style>
                body,#renderCanvas { width: 100%; height: 100%;}
            </style>
        </head>
    <body>
        <canvas id="renderCanvas"></canvas>
    </body>
    </html>
    ```

1. The canvas occupies the entire web page. That completes our hosting web page. At this point, the hosting web page is ready. You can open it in any browser and ensure there are no errors shown, though there is no immersive experience yet.

## Next steps

> [!div class="nextstepaction"]
> [Next Tutorial: 2. Prepare a scene](prepare-scene-02.md)
