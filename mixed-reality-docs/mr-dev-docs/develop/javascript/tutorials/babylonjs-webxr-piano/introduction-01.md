---
title: Introduction to building a piano in WebXR using BabylonJS
description: Complete this course to learn how to build a functioning 88-key piano keyboard in WebXR using BabylonJS
author: JING1201
ms.author: t-jinglow
ms.service: #Required; service per approved list. slug assigned by ACOM.
ms.topic: tutorial
ms.date: 05/31/2021
ms.custom: template-tutorial
---


<!--
This template provides the basic structure of a tutorial article.
See the [tutorial guidance](contribute-how-to-mvc-tutorial.md) in the contributor guide.

To provide feedback on this template contact 
[the templates workgroup](mailto:templateswg@microsoft.com).
-->

<!-- 1. H1 
Required. Start with "Tutorial: ". Make the first word following "Tutorial: " a 
verb.
-->

# Tutorial: Build a piano in WebXR using babylon.js

<!-- 2. Introductory paragraph 
Required. Lead with a light intro that describes, in customer-friendly language, 
what the customer will learn, or do, or accomplish. Answer the fundamental “why 
would I want to do this?” question. Keep it short.
-->

Through this tutorial series, you will learn about using babylon.js to create a Mixed Reality web app that contains a functioning 88-key standup piano. In the completed app, you will be able to easily teleport to the position in front of the piano and begin playing on the keys using your mixed reality controllers.

<!-- 3. Tutorial outline 
Required. Use the format provided in the list below.
-->

In this tutorial, you will learn how to:

> [!div class="checklist"]
> * Create, position, and merge meshes to build a model of a standup piano
> * Add pointer interactions to each piano key
> * Enable key WebXR features such as teleportation and multipointer support
> * (Optional) Enable hand tracking WebXR feature when viewing on Oculus Quest

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
<!-- Introduction paragraph -->

1. Using your favorite code editor, create a file named index.html and insert the template below into the file:

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

    If you need more explanation on each component in this template, please refer back to the Hello World Tutorial, which is a prerequisite of this tutorial.
1. If you try to open this file in a browser, you'll see an error complaining that the `createScene()` function is not found. We will take care of that in the next section.

## Setup the scene
<!-- Introduction paragraph -->
1. In the same folder as *index.html*, create another file named *scene.js*. This is where we will store all of the javascript code related to setting up the scene.
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
    Here, we have created a camera which points almost completely downwards and targets the origin point of the space. The light we have created is a hemispheric light which points to the sky, which is very useful for simulating an ambient space. We have also dimmed the light a little by modifying its intensity.
1. Finally, since we are developing for a WebXR platform, we will need to enable the XR experience in the scene by inserting the following line before `return scene;`:

    ```javascript
    const xrHelper = await scene.createDefaultXRExperienceAsync();
    ```
    In order to call an async function within a function, the parent function would also have to be async, which is why we defined `createScene` function as async earlier. Later in this tutorial series, we will be using this `xrHelper` to enable and configure different WebXR features supported by babylon.js.

1. Now that we have a working `createScene()` function, let's have *index.html* load the *scene.js* file as a script so that the `createScene()` function is recognized in *index.html*. Add this line of code ithin the `<header>` tag of the html file:

    ```html
    <script src="scene.js"></script>
    ```

## Summary
Hope that was a good review of the concepts introduced in the previous tutorials! Here is the code that you should have at this point.

*index.html*
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

*scene.js*
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

<!-- 6. Clean up resources
Required. If resources were created during the tutorial. If no resources were created, 
state that there are no resources to clean up in this section.
-->

## Clean up resources

If you're not going to continue to use this application, delete
<resources> with the following steps:

1. From the left-hand menu...
1. ...click Delete, type...and then click Delete

<!-- 7. Next steps
Required: A single link in the blue box format. Point to the next logical tutorial 
in a series, or, if there are no other tutorials, to some other cool thing the 
customer can do. 
-->

## Next steps

Advance to the next article to learn how to create...
> [!div class="nextstepaction"]
> [Next steps button](contribute-how-to-mvc-tutorial.md)

<!--
Remove all the comments in this template before you sign-off or merge to the 
main branch.
-->
