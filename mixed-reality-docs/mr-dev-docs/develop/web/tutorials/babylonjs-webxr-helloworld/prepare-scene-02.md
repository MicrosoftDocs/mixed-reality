---
title: BabylonJs tutorial to create a scene with basic 3D objects
description: Learn how to use BabylonJS and add basic 3D objects to a scene.
author: bogenera
ms.author: ayyonet
ms.date: 03/05/2021
ms.topic: article
keywords: mixed reality, javascript, tutorial, BabylonJS, hololens, mixed reality, UWP, Windows 10
ms.localizationpriority: high
---

# Tutorial: Prepare a scene

Learn how to create a scene, and add some basic 3D elements to it.

In this tutorial, learn how to:

> [!div class="checklist"]
> * Create a scene
> * Add a camera
> * Set lights
> * Add basic 3D elements

## Create a scene

A scene is where all the contents will be displayed. There might be multiple scenes, the scenes can overlay and it is possible to switch between scenes. Have the hosting web page open.

1. Add the script tag after the canvas html element and add the following code to create a scene filled in black color:

    ```html
    <canvas id="renderCanvas"></canvas>
        <script type="text/javascript">
            var engine = null; // will be added later

            const createScene = function() {
                const scene = new BABYLON.Scene(engine);
                scene.clearColor = new BABYLON.Color3.Black;
            }
            var scene = createScene();
        </script>
    ```

1. Note that the *engine* variable is set to null. We have to create an instance of BabylonJS web rendering engine that renders a scene and hooks events on the canvas. To create an instance of the engine, add the following code before the function *createScene*:

    ```javascript
    var canvas = document.getElementById("renderCanvas");
    var  engine = new BABYLON.Engine(canvas, true);
    ```

1. The scene is not rendered by default (remember there might be multiple scenes and you control which scene is displayed at the moment). To render the scene add a call to the method *render* from within the *runRenderLoop*, so that the final script will look as follows:

    ```javascript
        var canvas = document.getElementById("renderCanvas");
        var  engine = new BABYLON.Engine(canvas, true);

        const createScene = function() {
            const scene = new BABYLON.Scene(engine);
            scene.clearColor = new BABYLON.Color3.Black;

            return scene;
        }
        var scene = createScene();

        engine.runRenderLoop(function () {
            scene.render();
        });
    ```

## Add basic 3D element

1. To add a cube, add the following code to the function *createScene*:


    ```javascript
        const createScene = function() {
            const scene = new BABYLON.Scene(engine);
            scene.clearColor = new BABYLON.Color3.Black;
            
            const box = BABYLON.MeshBuilder.CreateBox("box", {wrap: true});
            
            return scene;
        }
    ```

1. Check the output in the browser. The browser window shows a blank page with javascript error in development console
'Uncaught Error: No camera defined'. Now we have to add camera to scene.

## Add camera

1. For allow user input, a camera must be attached to the canvas. Let's add a camera that allows us to look around, i.e. can be rotated around object that we will add to the scene later. Add the following code to the *createScene* function:

    ```javascript
        const createScene = function() {
            const scene = new BABYLON.Scene(engine);
            ...

            var longitude =  -Math.PI / 2;
            var latitude = Math.PI / 3;
            var radius = 4;
            var position = BABYLON.Vector3.Zero();
            const camera = new BABYLON.ArcRotateCamera("Camera", longitude, latitude, radius, position);
            camera.attachControl(canvas, true);
            
            return scene;
        }
    ```

1. Now if you check the output in the browser, you will see a black canvas. We are missing the light

## Set light

1. There are four types of lights that can be used with a range of lighting properties: Point, Directional, Spot and Hemispheric Light. Let's add the ambient light (Hemispheric), as follows:

    ```javascript
        const createScene = function() {
            const scene = new BABYLON.Scene(engine);
            ...
            const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(1, 1, 0));
            
            return scene;
        }
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

                var longitude =  -Math.PI / 2;
                var latitude = Math.PI / 2;
                var radius = 4;
                var position = BABYLON.Vector3.Zero();
                const camera = new BABYLON.ArcRotateCamera("Camera", longitude, latitude, radius, position);
                camera.attachControl(canvas, true);
                const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(1, 1, 0));
                
                const box = BABYLON.MeshBuilder.CreateBox("box", {wrap: true});
                
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

1. Check the output in the browser. You should see the cube and using the mouse you can rotate the camera around the cube and see the different faces of the cube:

![Basic scene with cube](../images/hello-world-basic-scene.png)


> [!div class="nextstepaction"]
> [Next Tutorial: 4. Interact with object](interact-03.md)