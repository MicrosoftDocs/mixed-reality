---
title: BabylonJs tutorial to interact with 3D objects
description: Learn how to use BabylonJS and interact with 3D objects.
author: bogenera
ms.author: ayyonet
ms.date: 03/05/2021
ms.topic: article
keywords: mixed reality, javascript, tutorial, BabylonJS, hololens, mixed reality, UWP, Windows 10
ms.localizationpriority: high
---

# Tutorial: Interact with 3D object

Learn how to add 3D object interactions to your Mixed Reality experiences with BabylonJS. In this section, you'll start with something simple, like painting the faces of a cube with different colors when you select the object.

This tutorial covers the following topics:

> [!div class="checklist"]
> * How to add interactions
> * Enable WebXR immersive mode
> * Run the app on HoloLens2 emulator

## Add interaction

1. First, let's update our code so that the cube faces are painted with distinct colors:

    ```javascript
    const createScene = function() {
        //code skipped for simplicity
        ...

        const faceColors = new Array(6);
        for (let i = 0; i < 6; i++) {
            var red = Math.floor(Math.random() * 256)/255;
            var green = Math.floor(Math.random() * 256)/255;
            var blue = Math.floor(Math.random() * 256)/255;
            faceColors[i] = new BABYLON.Color4(red, blue, green, 1);
            }
            
        const options = {
            faceColors: faceColors,
            wrap: true
        };
        const box = BABYLON.MeshBuilder.CreateBox("box", options);
        
        //code skipped for simplicity
        ...
    }
    ```

2. Now that the cube faces are painted with different colors, let's add an interaction to: 
* Change the face color when the cube is clicked 
* Move the cube after the color is changed

    ```javascript
    const createScene = function() {
        //code skipped for simplicity
        ...

        //upon clicking on the box, it will change the color and move upright
        box.actionManager = new BABYLON.ActionManager(scene);
        box.actionManager.registerAction(new BABYLON.ExecuteCodeAction(BABYLON.ActionManager.OnPickTrigger, function (evt) {
            var sourceBox = evt.meshUnderPointer;
            
            //generate random colors
            var red = Math.floor(Math.random() * 256)/255;
            var green = Math.floor(Math.random() * 256)/255;
            var blue = Math.floor(Math.random() * 256)/255;

            //apply new material
            var boxMaterial = new BABYLON.StandardMaterial("material", scene);
            boxMaterial.emissiveColor = new BABYLON.Color3(red, green, blue);
            sourceBox.material = boxMaterial;

            //move the box upright
            sourceBox.position.x += 0.1;
            sourceBox.position.y += 0.1;
        }));

        //code skipped for simplicity
        ...
    }
    ```

## Enable WebXR immersive experience

Now that our cube is changing colors, we're ready to try the immersive experience. Your task is to update the stylesheet so the canvas occupies the entire web page. 

1. Add the style tag into the page header as follows:

    ```html
    <head>
        <script src="https://preview.babylonjs.com/babylon.js"></script>    
        <style>
            body,#renderCanvas { width: 100%; height: 100%;}
        </style>
    </head>
    ```

2. In this step we're going to introduce the ground. The cube will be hanging in the air and we will see a floor at the bottom. Add the ground as follows:

    ```javascript
    const createScene = function() {
        //code skipped for simplicity
        ...

        var ground = BABYLON.MeshBuilder.CreateGround("ground", {width: 10, height: 10}, scene);

        //code skipped for simplicity
        ...
    }
    ```

3. In order to add WebXR support, we need to call *createDefaultXRExperienceAsync*, which has a *Promise* result. For simplicity, we'll keep using the Promise. For real-world applications, you would convert this code to use the async/await pattern. Here is the updated version:

    ```javascript
     const createScene = function() {
        //code skipped for simplicity
        ...

        var ground = BABYLON.MeshBuilder.CreateGround("ground", {width: 10, height: 10}, scene);

        var xrPromise = scene.createDefaultXRExperienceAsync({
            floorMeshes: [ground]
        });
        xrPromise.then((xrExperience) => {
            console.log("Done, WebXR is enabled.");
        });

        //code skipped for simplicity
        ...
    }
    ```

1. The above code generates the following output in the browser window:
![WebXR scene](../images/hello-world-webxr-scene.png)

5. Select the Immersive-VR button on the bottom right corner:
![Immersive VR Button](../images/immersive-vr-button.png)

1. This action will launch the Mixed Reality Portal window as shown below:
![Mixed Reality Portal](../images/mixed-reality-portal.png)

## Run on HoloLens2 emulator

TBD

TBD: research how??

## Takeaways

TBD

Next steps
Congratulations! You've completed our series of BabylonJS tutorials and learned how to:
> [!div class="checklist"]
> * Set up a development environment
> * Create a new web page to display results
> * The API to create and interact with basic 3D elements
> * Deploy and test the application in a HoloLens2 emulator

For more information on Mixed Reality javascript development see [JavaScript development overview](/javascript-development-overview.md).
