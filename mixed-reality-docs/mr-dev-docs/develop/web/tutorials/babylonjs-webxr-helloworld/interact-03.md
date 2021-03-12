---
title: Babylon.js tutorial to interact with 3D objects
description: Learn how to use babylon.js and interact with 3D objects.
author: bogenera
ms.author: ayyonet
ms.date: 03/05/2021
ms.topic: article
keywords: mixed reality, javascript, tutorial, BabylonJS, hololens, mixed reality, UWP, Windows 10
ms.localizationpriority: high
---

# Tutorial: Interact with 3D object

Learn how to add 3D object interactions to your Mixed Reality experiences with babylon.js. In this section, you'll start with something simple, like painting the faces of a cube with different colors when you select the object.

This tutorial covers the following topics:

> [!div class="checklist"]
> * How to add interactions
> * Enable WebXR immersive mode
> * Run the app on HoloLens2 emulator

## Before you begin

In previous tutorial step a basic web page with a scene was created. Have the hosting web page open for editing.

```html
<html>
<head>
    <script src="https://preview.babylonjs.com/babylon.js"></script>
</head>
<body>
    <canvas id="renderCanvas"></canvas>
    <script>
        var canvas = document.getElementById("renderCanvas");
        var engine = new BABYLON.Engine(canvas, true);
        
        var createScene = function() {
            const scene = new BABYLON.Scene(engine);
            scene.clearColor = new BABYLON.Color3.Black;

            var longitude =  -Math.PI/2;
            var latitude = Math.PI/3;
            var radius = 10;
            var position = new BABYLON.Vector3(-0.5, 0, -0.5);
            const camera = new BABYLON.ArcRotateCamera("Camera", longitude, latitude, radius, position);
            camera.attachControl(canvas, true);
            
            const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(1, 1, 0));
            
            const box = BABYLON.MeshBuilder.CreateBox("box", {wrap: true});
            box.position.x = 0.5;
            box.position.y = 1;
            
            return scene;
        };
        
        var scene = createScene();
        engine.runRenderLoop(function(){
            scene.render();
        });
    </script>
</body>
</html>
```

## Add interaction

1. First, let's update our code that creates a cube, so that the cube faces are painted with distinct colors:

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

1. Now that the cube faces are painted with different colors, let's add an interaction to:

    * Change the face color when the cube is clicked
    * Move the cube after the color is changed

    ```javascript
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
    ```

1. The final code of the web page will look as follows:

    ```html
    <html>
    <head>
        <script src="https://preview.babylonjs.com/babylon.js"></script>
    </head>
    <body>
        <canvas id="renderCanvas"></canvas>
        <script>
            var canvas = document.getElementById("renderCanvas");
            var engine = new BABYLON.Engine(canvas, true);
            
            var createScene = function() {
                const scene = new BABYLON.Scene(engine);
                scene.clearColor = new BABYLON.Color3.Black;

                var longitude =  -Math.PI/2;
                var latitude = Math.PI/3;
                var radius = 10;
                var position = new BABYLON.Vector3(-0.5, 0, -0.5);
                const camera = new BABYLON.ArcRotateCamera("Camera", longitude, latitude, radius, position);
                camera.attachControl(canvas, true);
                
                const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(1, 1, 0));
                
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
                box.position.x = 0.5;
                box.position.y = 1;

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
                            
                return scene;
            };
            
            var scene = createScene();
            engine.runRenderLoop(function(){
                scene.render();
            });
        </script>
    </body>
    </html>
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

1. In this step we're going to introduce a [ground](https://doc.babylonjs.com/divingDeeper/mesh/creation/set/ground). The cube will be hanging in the air and we will see a floor at the bottom. Add the ground as follows:

    ```javascript
    var ground = BABYLON.MeshBuilder.CreateGround("ground", {width: 10, height: 10});
    ```

    This creates a simple 10×10-meter floor.

1. In order to add WebXR support, we need to call *createDefaultXRExperienceAsync*, which has a *Promise* result. For simplicity, we'll keep using the Promise. For real-world applications, you would convert this code to use the async/await pattern. Here is the updated version:

    ```javascript
    var xrPromise = scene.createDefaultXRExperienceAsync({
        floorMeshes: [ground]
    });
    xrPromise.then((xrExperience) => {
        console.log("Done, WebXR is enabled.");
    });
    ```

1. The final code of the web page will look as follows:

    ```html
    <html>
    <head>
        <script src="https://preview.babylonjs.com/babylon.js"></script>
        <style>
            body,#renderCanvas { width: 100%; height: 100%;}
        </style>
    </head>
    <body>
        <canvas id="renderCanvas"></canvas>
        <script>
            var canvas = document.getElementById("renderCanvas");
            var engine = new BABYLON.Engine(canvas, true);
            
            var createScene = function() {
                const scene = new BABYLON.Scene(engine);
                scene.clearColor = new BABYLON.Color3.Black;

                var longitude =  -Math.PI/2;
                var latitude = Math.PI/3;
                var radius = 10;
                var position = new BABYLON.Vector3(-0.5, 0, -0.5);
                const camera = new BABYLON.ArcRotateCamera("Camera", longitude, latitude, radius, position);
                camera.attachControl(canvas, true);
                
                const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(1, 1, 0));
                
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
                box.position.x = 0.5;
                box.position.y = 1;

                //upon clicking on the box, it will change the color and move upright
                box.actionManager = new BABYLON.ActionManager(scene);
                box.actionManager.registerAction(new BABYLON.ExecuteCodeAction(
                    BABYLON.ActionManager.OnPickTrigger, 
                    function (evt) {
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
                
                var ground = BABYLON.MeshBuilder.CreateGround("ground", {width: 10, height: 10});

                var xrPromise = scene.createDefaultXRExperienceAsync({
                    floorMeshes: [ground]
                });
                xrPromise.then((xrExperience) => {
                    console.log("Done, WebXR is enabled.");
                });
                            
                return scene;
            };
            
            var scene = createScene();
            engine.runRenderLoop(function(){
                scene.render();
            });
        </script>
    </body>
    </html>
    ```

1. The above code generates the following output in the browser window:
![WebXR scene](../images/hello-world-webxr-scene.png)

## Run on Mixed Reality Portal emulator

1. Select the Immersive-VR button on the bottom right corner:
![Immersive VR Button](../images/immersive-vr-button.png)

1. This action will launch the Mixed Reality Portal window as shown below:
![Mixed Reality Portal](../images/mixed-reality-portal.png)

<!-- TBD: HoloLens2 emulator does not work, investigate possible workaround -->

## Takeaways

The following are the most important takeaways from this tutorial:
* Babylon.js makes it easy to create immersive experiences using JavaScript
* To create virtual scenes you don't need to write low-level code or learn a new technology
* You can build Mixed Reality applications with Windows 10 and Chromium Edge without need to buy a headset

## Next steps

Congratulations! You've completed our series of babylon.js tutorials and learned how to:
> [!div class="checklist"]
> * Set up a development environment
> * Create a new web page to display results
> * The API to create and interact with basic 3D elements
> * Deploy and test the application in a HoloLens2 emulator

For more information on Mixed Reality javascript development see [JavaScript development overview](/javascript-development-overview.md).
