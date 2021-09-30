---
title: Building a piano in WebXR using BabylonJS
description: Complete this tutorial series to learn how to build a functioning 88-key piano keyboard in WebXR using BabylonJS
author: JING1201
ms.author: v-vtieto
ms.prod: mixed-reality
ms.topic: tutorial
ms.date: 09/10/2021
keywords: mixed reality, javascript, tutorial, BabylonJS, hololens, mixed reality, UWP, Windows 10, WebXR, immersive web
ms.localizationpriority: high
---


# Tutorial: Build a piano in WebXR using Babylon.js

Building a piano in the real world requires much in the way of time, skills, and materials. What about building one for the VR/AR world?

In this tutorial series, you'll learn how to use Babylon.js to create a Mixed Reality web app that contains a functioning 88-key standup piano in the virtual world. In the completed app, you'll be able to teleport to the piano and play the keys using your Mixed Reality controllers.

In this tutorial series, you'll learn how to:

> [!div class="checklist"]
> * Create, position, and merge meshes to build a piano keyboard
> * Import a Babylon.js model of a standup piano frame
> * Add pointer interactions to each piano key
> * Enable teleportation and multipointer support in WebXR

## Prerequisites

* A computer connected to the internet
* Basic Javascript Knowledge
* [WebXR Javascript Hello World Tutorial](../babylonjs-webxr-helloworld/introduction-01.md)
* WebXR-supported browser, for example [Microsoft Edge](../../../../whats-new/new-microsoft-edge.md)
* [Babylon.js](https://doc.babylonjs.com/divingDeeper/developWithBjs/frameworkVers) 4.2 or higher
* Any [VR headset](../../../../discover/immersive-headset-hardware-details.md) or [Windows Mixed Reality simulator](../../../platform-capabilities-and-apis/using-the-windows-mixed-reality-simulator.md)
* Optional: [Windows 10 Creator Update](https://www.microsoft.com/software-download/windows10) if you want to use a Windows Mixed Reality Simulator

## Getting started

Let's begin by setting up the HTML web page that will contain the Babylon.js scene.

1. Create a folder named *babylonjs-piano-tutorial* and open the folder in Visual Studio Code.

    > [!NOTE]
    > While you can use any code editor to follow along, we'll be using Visual Studio Code throughout this tutorial for convenience.

1. Within the folder, create a file named *index.html* and insert the template below into the file:

    ```html
    <html>
        <head>
            <title>Piano in BabylonJS</title>
            <script src="https://cdn.babylonjs.com/babylon.js"></script>
            <style>
                body,#renderCanvas { width: 100%; height: 100%;}
            </style>
        </head>
        <body>
            <canvas id="renderCanvas"></canvas>
            <script type="text/javascript">
                const canvas = document.getElementById("renderCanvas"); 
                const engine = new BABYLON.Engine(canvas, true); 

                createScene(engine).then(sceneToRender => {
                    engine.runRenderLoop(() => sceneToRender.render());
                });
        
                // Watch for browser/canvas resize events
                window.addEventListener("resize", function () {
                    engine.resize();
                });
            </script>
        </body>
    </html>
    ```

    If you need more explanation on the content of this template, see the [Hello World Tutorial](../babylonjs-webxr-helloworld/introduction-01.md), which is a prerequisite of this tutorial.

1. If you try to open this file in a browser, the console shows an error indicating that the `createScene()` function isn't found. Let's resolve this error by implementing the function `createScene()` in the next section.

## Setup the scene

1. In the same folder as *index.html*, create another file named *scene.js*. We'll store all of the javascript code related to setting up the scene and creating the piano in this file.

1. Let's add the `createScene()` function into *scene.js*:

    ```javascript
    const createScene = async function(engine) {
        const scene = new BABYLON.Scene(engine);
        return scene;
    }
    ```

    Note that we're making `createScene()` an async function. Stay tuned to find out why.

1. Next, we'll need a light and a camera to make the scene visible to us. Update the `createScene()` function:

    ```javascript
    const createScene = async function(engine) {
        const scene = new BABYLON.Scene(engine);

        const alpha =  3*Math.PI/2;
        const beta = Math.PI/50;
        const radius = 220;
        const target = new BABYLON.Vector3(0, 0, 0);
        
        const camera = new BABYLON.ArcRotateCamera("Camera", alpha, beta, radius, target, scene);
        camera.attachControl(canvas, true);
        
        const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(0, 1, 0), scene);
        light.intensity = 0.6;

        return scene;
    }
    ```

    Here, we have created an [ArcRotateCamera](https://doc.babylonjs.com/divingDeeper/cameras/camera_introduction#arc-rotate-camera), which points almost completely downwards and targets the origin point of the space. The light we have created is a [HemisphericLight](https://doc.babylonjs.com/divingDeeper/lights/lights_introduction#the-hemispheric-light) that points to the sky and is useful for simulating an ambient space. We've also dimmed the light a little by lowering its intensity.

    If you need a refresher on how to create a camera and a light, revisit the [Prepare Scene section of the Hello World Tutorial Series](../babylonjs-webxr-helloworld/prepare-scene-02.md#add-a-camera) before proceeding to the next step.

1. Finally, since we are developing for a WebXR platform, we will need to [enable the XR experience](https://doc.babylonjs.com/divingDeeper/webXR/introToWebXR) in the scene by inserting the following line before `return scene;`:

    ```javascript
    const xrHelper = await scene.createDefaultXRExperienceAsync();
    ```

    In javascript, in order to use the `await` keyboard on an `async` function within a function, the parent function would also have to be `async`, which is why we defined `createScene` function as async earlier. Later in this tutorial series, we will be using this `xrHelper` to enable and configure different WebXR features supported by Babylon.js.

1. The completed *scene.js* should look like this:

    ```javascript
    const createScene = async function(engine) {
        const scene = new BABYLON.Scene(engine);
        
        const alpha =  3*Math.PI/2;
        const beta = Math.PI/50;
        const radius = 220;
        const target = new BABYLON.Vector3(0, 0, 0);
        
        const camera = new BABYLON.ArcRotateCamera("Camera", alpha, beta, radius, target, scene);
        camera.attachControl(canvas, true);
        
        const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(0, 1, 0), scene);
        light.intensity = 0.6;
    
        const xrHelper = await scene.createDefaultXRExperienceAsync();
    
        return scene;
    }
    ```

1. Now that we have a working `createScene()` function, let's have *index.html* load the *scene.js* file as a script so that the `createScene()` function is recognized in *index.html*. Add this line of code within the `<header>` section of the html file:

    ```html
    <html>
        <head>
            <title>Piano in BabylonJS</title>
            <script src="https://cdn.babylonjs.com/babylon.js"></script>
            <script src="scene.js"></script>
            <style>
                body,#renderCanvas { width: 100%; height: 100%;}
            </style>
        </head>
        <body>
            <canvas id="renderCanvas"></canvas>
            <script type="text/javascript">
                const canvas = document.getElementById("renderCanvas");
                const engine = new BABYLON.Engine(canvas, true); 

                createScene(engine).then(sceneToRender => {
                    engine.runRenderLoop(() => sceneToRender.render());
                });
                
                // Watch for browser/canvas resize events
                window.addEventListener("resize", function () {
                    engine.resize();
                });
            </script>
        </body>
    </html>
    ```

1. Open *index.html* in your browser, and you will find that the error message we saw earlier is no longer present, and we have an empty Babylon.js scene in the page.

## Next steps

> [!div class="nextstepaction"]
> [Next tutorial: Build a 3D piano model](keyboard-model-02.md)
