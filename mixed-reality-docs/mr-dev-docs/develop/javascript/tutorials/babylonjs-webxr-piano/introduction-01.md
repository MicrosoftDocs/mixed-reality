---
title: Introduction to building a piano in WebXR using BabylonJS
description: Complete this course to learn how to build a functioning 88-key piano keyboard in WebXR using BabylonJS
author: JING1201
ms.author: t-jinglow
ms.prod: mixed-reality
ms.topic: tutorial
ms.date: 05/31/2021
keywords: mixed reality, javascript, tutorial, BabylonJS, hololens, mixed reality, UWP, Windows 10, WebXR, immersive web
ms.localizationpriority: high
---


# Tutorial: Build a piano in WebXR using babylon.js

Building a piano in the real world requires a lot of time, skills, and materials. What about building one for the VR/AR world?

Through this tutorial series, you will learn about using babylon.js to create a Mixed Reality web app that contains a functioning 88-key standup piano in the virtual world. In the completed app, you will be able to easily teleport to the position in front of the piano and begin playing on the keys using your mixed reality controllers.

In this tutorial series, you will learn how to:

> [!div class="checklist"]
> * Create, position, and merge meshes to build a piano keyboard
> * Import a babylon.js model of a standup piano frame
> * Add pointer interactions to each piano key
> * Enable teleportation and multipointer support in WebXR
> * (Optional) Enable hand tracking in WebXR

<!-- 4. Prerequisites 
Required. First prerequisite is a link to a free trial account if one exists. If there 
are no prerequisites, state that no prerequisites are needed for this tutorial.
-->

## Prerequisites
* Basic Javascript Knowledge
* [WebXR Javascript Hello World Tutorial](../babylonjs-webxr-helloworld/introduction-01.md)
* WebXR-supported browser, for example [Microsoft Edge](https://docs.microsoft.com/windows/mixed-reality/whats-new/new-microsoft-edge)
* [Babylon.js](https://doc.babylonjs.com/divingDeeper/developWithBjs/frameworkVers) 4.2 or higher
* Any Mixed Reality device or [Windows Mixed Reality simulator](https://docs.microsoft.com/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-windows-mixed-reality-simulator)
* Optional: [Windows 10 Creator Update](https://www.microsoft.com/software-download/windows10) if you want to use a Windows Mixed Reality Simulator

## Getting started
Let's begin by setting up the HTML web page that will contain the babylon.js scene.

1. Using your favorite code editor, create a file named *index.html* and insert the template below into the file:

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
            </script>
        </body>
    </html>
    ```

    If you need more explanation on the content of this template, please refer back to the [Hello World Tutorial](../babylonjs-webxr-helloworld/introduction-01.md), which is a prerequisite of this tutorial.

1. If you try to open this file in a browser, the console will show an error indicating that the `createScene()` function is not found. Let's resolve this error by implementing the function `createScene()` in the next section.

## Setup the scene

1. In the same folder as *index.html*, create another file named *scene.js*. This is where we will store all of the javascript code related to setting up the scene and creating the piano.

1. Let's add the `createScene()` function into *scene.js*:

    ```javascript
    const createScene = async function(engine) {
        const scene = new BABYLON.Scene(engine);
        return scene;
    }
    ```

    Note that here we are making `createScene()` an async function. Stay tuned to find out why.

1. Next, we will need a light and a camera to make the scene visible to us. Append the following lines of code into the `createScene()` function:

    ```javascript
    const alpha =  3*Math.PI/2;
    const beta = Math.PI/50;
    const radius = 220/scale;
    const target = new BABYLON.Vector3(0, 0, 0);
    
    const camera = new BABYLON.ArcRotateCamera("Camera", alpha, beta, radius, target, scene);
    camera.attachControl(canvas, true);
    
    const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(0, 1, 0), scene);
    light.intensity = 0.6;
    ```

    Here, we have created an [ArcRotateCamera](https://doc.babylonjs.com/divingDeeper/cameras/camera_introduction#arc-rotate-camera) which points almost completely downwards and targets the origin point of the space. The light we have created is a [HemisphericLight](https://doc.babylonjs.com/divingDeeper/lights/lights_introduction#the-hemispheric-light) which points to the sky, which is very useful for simulating an ambient space. We have also dimmed the light a little by lowering its intensity.

1. Finally, since we are developing for a WebXR platform, we will need to [enable the XR experience](https://doc.babylonjs.com/divingDeeper/webXR/introToWebXR) in the scene by inserting the following line before `return scene;`:

    ```javascript
    const xrHelper = await scene.createDefaultXRExperienceAsync();
    ```

    In javascript, in order to use the `await` keyboard on an `async` function within a function, the parent function would also have to be `async`, which is why we defined `createScene` function as async earlier. Later in this tutorial series, we will be using this `xrHelper` to enable and configure different WebXR features supported by babylon.js.

1. Now that we have a working `createScene()` function, let's have *index.html* load the *scene.js* file as a script so that the `createScene()` function is recognized in *index.html*. Add this line of code within the `<header>` section of the html file:

    ```html
    <script src="scene.js"></script>
    ```

1. Open *index.html* in your browser, and you will find that the error message we saw earlier is no longer present, and we have an empty babylon.js scene in the page.

## Summary

Hope that was a good review of the concepts introduced in the previous tutorials! Here is the code that you should have at this point.

### *index.html*

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
        </script>
    </body>
</html>
```

### *scene.js*

```javascript
const createScene = async function(engine) {
    const scene = new BABYLON.Scene(engine);

    const alpha =  3*Math.PI/2;
    const beta = Math.PI/50;
    const radius = 220/scale;
    const target = new BABYLON.Vector3(0, 0, 0);
    
    const camera = new BABYLON.ArcRotateCamera("Camera", alpha, beta, radius, target, scene);
    camera.attachControl(canvas, true);
    
    const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(0, 1, 0), scene);
    light.intensity = 0.6;

    const xrHelper = await scene.createDefaultXRExperienceAsync();

    return scene;
}
```

## Next steps

> [!div class="nextstepaction"]
> [Next tutorial: Build a piano 3D model](keyboard-model.md)