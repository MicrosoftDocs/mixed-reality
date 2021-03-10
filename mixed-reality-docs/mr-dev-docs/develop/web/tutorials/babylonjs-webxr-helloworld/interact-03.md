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

Learn how to add some interaction, such as painting the faces of a cube with different color upon clicking on the cube.

In this tutorial, learn how to:

> [!div class="checklist"]
> * How to add interactions
> * Enable WebXR immersive mode
> * Run the app on HoloLens2 emulator

## Add interaction

1. Let's update our code, so that the cube faces are painted with distinct colors. Update the code as follows:

    ```javascript
        const createScene = function() {
            const scene = new BABYLON.Scene(engine);
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

            return scene;
        }
    ```

1. Now you will see the cube faces painted with different colors. Let's add a simple interaction, so that the face color is changing upon clicking the cube and the cube changes its position. Add the following code:

    ```javascript
        const createScene = function() {
            const scene = new BABYLON.Scene(engine);
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

            //upon clicking on the box, it will change the color and move upright
            box.actionManager = new BABYLON.ActionManager(scene);
            box.actionManager.registerAction(new BABYLON.ExecuteCodeAction(BABYLON.ActionManager.OnPickTrigger, function (evt) {
                var sourceBox = evt.meshUnderPointer;
                
                var red = Math.floor(Math.random() * 256)/255;
                var green = Math.floor(Math.random() * 256)/255;
                var blue = Math.floor(Math.random() * 256)/255;

                var boxMaterial = new BABYLON.StandardMaterial("material", scene);
                boxMaterial.emissiveColor = new BABYLON.Color3(red, green, blue);
                sourceBox.material = boxMaterial;

                sourceBox.position.x += 0.1;
                sourceBox.position.y += 0.1;     
            }));

            return scene;
        }
    ```

## Test application locally

TBD

## Run on emulator

TBD

## Deploy to HoloLens2

TBD: research how??

## Takeaways

TBD

Next steps
You have completed this series of BabylonJS tutorials. You learned how to:
> [!div class="checklist"]
> * Set up a development environment
> * Create a new web page to display results
> * The API to create and interact with basic 3D elements
> * Deploy and test the application in a HoloLens2 emulator

For more information on Mixed Reality javascript development see [JavaScript development overview](/javascript-development-overview.md).