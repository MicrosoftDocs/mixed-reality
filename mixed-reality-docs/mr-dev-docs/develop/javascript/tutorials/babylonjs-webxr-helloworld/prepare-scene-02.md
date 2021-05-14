---
title: Babylon.js tutorial to prepare a scene with basic 3D objects
description: Learn how to use babylon.js and add basic 3D objects to a scene.
author: bogenera
ms.author: ayyonet
ms.date: 03/05/2021
ms.topic: article
keywords: mixed reality, javascript, tutorial, BabylonJS, hololens, mixed reality, UWP, Windows 10, WebXR, immersive web
ms.localizationpriority: high
---

# Tutorial: Prepare a scene

Learn how to prepare a scene, and add some basic 3D elements to it.

In this tutorial, learn how to:

> [!div class="checklist"]
> * Create a scene
> * Add a camera
> * Add light
> * Add basic 3D elements

## Before you begin

In previous tutorial step a basic web page was created. Have the web page open for editing.

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

## Create a scene

A scene is where all the contents will be displayed. There might be multiple scenes and it is possible to switch between scenes. Read more about [babylon.js Scene](https://doc.babylonjs.com/divingDeeper/scene).

1. Add the script tag after the canvas html element and add the following code to create a scene filled in black color:

    ```html
    <script type="text/javascript">
        const canvas = document.getElementById("renderCanvas");
        const engine = new BABYLON.Engine(canvas, true);
        
        const createScene = function() {
            const scene = new BABYLON.Scene(engine);
            scene.clearColor = new BABYLON.Color3.Black;
            return scene;
        }

        const sceneToRender = createScene();
    </script>
    ```

    In the code above we have to create an instance of babylon.js web rendering engine that renders a scene and hooks events on the canvas. For more information about the engine, check the documentation page [babylon.engine](https://doc.babylonjs.com/typedoc/classes/babylon.engine)

1. The scene is not rendered by default. Remember, there might be multiple scenes and you control which scene is displayed. To render the scene repeatedly on every frame, execute the following code after the call to *createScene* function:

    ```javascript
    engine.runRenderLoop(function () {
        sceneToRender.render();
    });
    ```

## Add basic 3D element

1. Let's add our first 3D shape. In the 3D virtual world shapes are built from *meshes*, lots of triangular facets joined together, each facet made from three vertices. You can either use a predefined mesh or create your own custom mesh. Here we will be using a predefined box mesh, i.e. a cube. To create the box use [BABYLON.MeshBuilder.CreateBox](https://doc.babylonjs.com/divingDeeper/mesh/creation/set/box). The parameters are name, and options (options are different according to the type of mesh). Append the following code to the function *createScene*:

    ```javascript
    const box = BABYLON.MeshBuilder.CreateBox("box", {});
    box.position.x = 0.5;
    box.position.y = 1;
    ```

1. Open the web page in the Microsoft Edge browser and check the output. The browser window shows a blank page. Open DevTools by using the keyboard and select F12 or Control+Shift+I (Windows, Linux) or Command+Option+I (macOS). After opening the *Console* tab, you can start looking for errors. There will be an error displayed: 'Uncaught Error: No camera defined'. Now we have to add a camera to the scene.

## Add a camera

1. To allow user input, a camera must be attached to the canvas. Let's add the camera of type [BABYLON.ArcRotateCamera](https://doc.babylonjs.com/divingDeeper/cameras/camera_introduction#arc-rotate-camera), which can be rotated around a certain target. The parameters required to create an instance of the camera are:
    1. **name**: name of the camera
    1. **alpha**: angular position along the longitudinal axis (in radians)
    1. **beta**: angular position along the latitudinal axis (in radians)
    1. **radius**: distance from the target
    1. **target**: the point that the camera would always face towards (defined by x-y-z coordinates)
    1. **scene**: the scene that the camera is in

    Add the following code to the *createScene* function:

    ```javascript
    const alpha =  Math.PI/4;
    const beta = Math.PI/3;
    const radius = 8;
    const target = new BABYLON.Vector3(0, 0, 0);
    
    const camera = new BABYLON.ArcRotateCamera("Camera", alpha, beta, radius, target, scene);
    camera.attachControl(canvas, true);
    ```

1. If you check the output in the browser, you will see a black canvas. We are missing the light.

## Add light

1. There are four types of lights that can be used with a range of lighting properties: Point, Directional, Spot and Hemispheric Light. Let's add the ambient light [HemisphericLight](https://doc.babylonjs.com/typedoc/classes/babylon.hemisphericlight), as follows:

    ```javascript
    const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(1, 1, 0));
    ```

1. The final code of the web page will look as follows:

    ```html
    <html>
    <head>
        <script src="https://cdn.babylonjs.com/babylon.js"></script>
        <style>
            body,#renderCanvas { width: 100%; height: 100%;}
        </style>
    </head>
    <body>
        <canvas id="renderCanvas"></canvas>
        <script>
            const canvas = document.getElementById("renderCanvas");
            const engine = new BABYLON.Engine(canvas, true);
            
            const createScene = function() {
                const scene = new BABYLON.Scene(engine);
                scene.clearColor = new BABYLON.Color3.Black;
                
                const alpha =  Math.PI/4;
                const beta = Math.PI/3;
                const radius = 8;
                const target = new BABYLON.Vector3(0, 0, 0);
                
                const camera = new BABYLON.ArcRotateCamera("Camera", alpha, beta, radius, target, scene);
                camera.attachControl(canvas, true);
                
                const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(1, 1, 0));
                
                const box = BABYLON.MeshBuilder.CreateBox("box", {});
                box.position.x = 0.5;
                box.position.y = 1;
                
                return scene;
            };
            
            const sceneToRender = createScene();
            engine.runRenderLoop(function(){
                sceneToRender.render();
            });
        </script>
    </body>
    </html>
    ```

1. Check the output in the browser. You should see the cube and using the mouse you can rotate the camera around the cube and see the different faces of the cube:

![Basic scene with cube](../images/hello-world-basic-scene.png)

## Next steps

> [!div class="nextstepaction"]
> [Next Tutorial: 3. Interact with 3D object](interact-03.md)
