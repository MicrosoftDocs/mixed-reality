---
title: Interact with piano in the 3D space
description: Learn how to add interactions to a virtual piano using babylon.js
author: JING1201
ms.author: t-jinglow
ms.prod: mixed-reality
ms.topic: tutorial
ms.date: 05/31/2021
keywords: mixed reality, javascript, tutorial, BabylonJS, hololens, mixed reality, UWP, Windows 10, WebXR, immersive web
ms.localizationpriority: high
---

# Tutorial: Interact with piano keyboard in the 3D space

In the previous tutorial, we have successfully created a model of a full 88-key piano keyboard. Now let's make it playable in the XR space.

In this tutorial, you will learn how to:

> [!div class="checklist"]
> * Add interactive piano features using pointer events
> * Scale meshes to a different size
> * Enable teleportation and multi-pointer support in XR
> * (Optional) Enable hand tracking in XR

## Before you begin

Make sure that you have gone through the [previous tutorial in the series](keyboard-model-02.md) are ready to continue adding to the code.

*index.html*

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

*scene.js*

```javascript
const WhiteKey = function (note, topWidth, bottomWidth, topPositionX, wholePositionX) {
    return {
        build(scene, register, referencePositionX) {
            // Create bottom part
            const bottom = BABYLON.MeshBuilder.CreateBox("whiteKeyBottom", {width: bottomWidth, height: 1.5, depth: 4.5}, scene);

            // Create top part
            const top = BABYLON.MeshBuilder.CreateBox("whiteKeyTop", {width: topWidth, height: 1.5, depth: 5}, scene);
            top.position.z =  4.75;
            top.position.x += topPositionX;

            // Merge bottom and top parts
            const key = BABYLON.Mesh.MergeMeshes([bottom, top], true, false, null, false, false);
            key.position.x = referencePositionX + wholePositionX;
            key.name = note + register;

            return key;
        }
    }
}

const BlackKey = function (note, wholePositionX) {
    return {
        build(scene, register, referencePositionX) {
            // Create black color material
            const blackMat = new BABYLON.StandardMaterial("black");
            blackMat.diffuseColor = new BABYLON.Color3(0, 0, 0);
            
            // Create black key
            const key = BABYLON.MeshBuilder.CreateBox(note + register, {width: 1.4, height: 2, depth: 5}, scene);
            key.position.z += 4.75;
            key.position.y += 0.25;
            key.position.x = referencePositionX + wholePositionX;
            key.material = blackMat;

            return key;
        }
    }
}

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

    const keyParams = [
        WhiteKey("C", 1.4, 2.3, -0.45, -14.4),
        BlackKey("C#", -13.45),
        WhiteKey("D", 1.4, 2.4, 0, -12),
        BlackKey("D#", -10.6),
        WhiteKey("E", 1.4, 2.3, 0.45, -9.6),
        WhiteKey("F", 1.3, 2.4, -0.55, -7.2),
        BlackKey("F#", -6.35),
        WhiteKey("G", 1.3, 2.3, -0.2, -4.8),
        BlackKey("G#", -3.6),
        WhiteKey("A", 1.3, 2.3, 0.2, -2.4),
        BlackKey("A#", -0.85),
        WhiteKey("B", 1.3, 2.4, 0.55, 0)
    ]
    
    const keys = new Set();

    // Register 1 through 7
    var referencePositionX = -2.4*14;
    for (let octave = 1; octave <= 7; octave++) {
        keyParams.forEach(key => {
            keys.add(key.build(scene, octave, referencePositionX))
        })
        referencePositionX += 2.4*7;
    }

    // Register 0
    keys.add(WhiteKey("A", 1.9, 2.3, -0.20, -2.4).build(scene, 0, -2.4*21))
    keyParams.slice(10, 12).forEach(key => {
        keys.add(key.build(scene, 0, -2.4*21))
    })
    
    // Register 8
    keys.add(WhiteKey("C", 2.3, 2.3, 0, -2.4*6).build(scene, 8, 84))

    // Import piano frame
    BABYLON.SceneLoader.ImportMesh("frame", "https://raw.githubusercontent.com/JING1201/babylonjs-exploration/main/piano-keys/", "pianoFrame.babylon", scene);

    // Lift piano keys
    keys.forEach(key => {
        key.position.y += 80;
    })

    const xrHelper = await scene.createDefaultXRExperienceAsync();

    return scene;
}
```

## Making the piano keyboard playable

Right now, the piano keyboard we have created is a static model that does not respond to any user interactions. In this section, we will program the keys to move downward and play a sound when someone presses on them.

1. Babylon.js provides different kinds of events, or [observables](https://doc.babylonjs.com/divingDeeper/events/observables), that we can interact with. In our case, we will be dealing with the `onPointerObservable` since we want to program the keys to perform actions when someone press on them through a pointer, which can be a mouse click, touch, XR controller button click, etc.

    Here is the basic structure of how we can add any behavior to an `onPointerObservable`:

    ```javascript
    scene.onPointerObservable.add((pointerInfo) => {
        // do something
    });
    ```

1. While babylon.js provides [many different types of pointer events](https://doc.babylonjs.com/typedoc/classes/babylon.pointereventtypes), we will only be using the `POINTERDOWN` and `POINTERUP` events to program the behavior of the piano keys, using the structure below:

    ```javascript
    scene.onPointerObservable.add((pointerInfo) => {
        switch (pointerInfo.type) {
            case BABYLON.PointerEventTypes.POINTERDOWN:
                // When the pointer is down on a piano key,
                // move the piano key downward (to show that it is pressed)
                // and play the sound of the note
                break;
            case BABYLON.PointerEventTypes.POINTERUP:
                // When the pointer is released,
                // move the piano key upward to its original position
                // and stop the sound of the note of the key that is released
                break;
        }
    });
    ```

1. Let's first work on moving the piano key downward and upward when we press and release the key.

    At the pointer down event, we need to detect the mesh that is being clicked, make sure that it is a piano key, and change the mesh's y-coordinate negatively by a small amount to make it look like the key was pressed down.

    For the pointer up event, it is a little more complicated because the pointer which pressed on the key might not be released on the key. For example, someone might click down on key C4, drag their mouse to E4, and then release their click. In this case, we still want to release the key that was pressed (C4) instead of where the `pointerUp` event occurs (E4).

    Let's look at how the following code achieves what we want:

    ```javascript
    const pointerToKey = new Map();
    scene.onPointerObservable.add((pointerInfo) => {
        switch (pointerInfo.type) {
            case BABYLON.PointerEventTypes.POINTERDOWN:
                if(pointerInfo.pickInfo.hit) {
                    const pickedMesh = pointerInfo.pickInfo.pickedMesh;
                    const pointerId = pointerInfo.event.pointerId;
                    if (keys.has(pickedMesh)) {
                        pickedMesh.position.y -= 0.5;
                        // play the sound of the note
                        pointerToKey.set(pointerId, {
                            mesh: pickedMesh
                        });
                    }
                }
                break;
            case BABYLON.PointerEventTypes.POINTERUP:
                const pointerId = pointerInfo.event.pointerId;
                if (pointerToKey.has(pointerId)) {
                    pointerToKey.get(pointerId).mesh.position.y += 0.5;
                    // stop the sound of the note of the key that is released
                    pointerToKey.delete(pointerId);
                }
                break;
        }
    });
    ```

    The `pointerId` is unique to every pointer and can help us identify a pointer when we have multiple controllers or if we are using a touch screen. Here we initialized a `Map` object named `pointerToKey` to store the relationship of which pointer pressed on which key, so that we know which key to release when the pointer is released, regardless of where the release happens.

1. Here's what the interaction would look like with the code above:

    ![Interactive Piano Keys](./images/interactive-piano-keys.gif)

1. Now let's work on playing and stopping a sound when a key is pressed and released. To achieve this, we will be utilizing a Javascript library named **soundfont-player**, which allows us to easily play MIDI sounds of an instrument we choose. 

    [Download the minified code of the library](https://github.com/JING1201/babylonjs-exploration/blob/89f60cf8fbc3a3d64afce70026cde0513ed59075/piano-keys/soundfont-player.min.js), save it in the same folder as *index.html*, and include it in the `<header>` tag in *index.html*:

    ```html
    <head>
        <title>Babylon Template</title>
        <script src="https://cdn.babylonjs.com/babylon.js"></script>
        <script src="scene.js"></script>
        // Add the script here
        <script src="soundfont-player.min.js"></script>
        <style>
            html, body, #renderCanvas {
                width: 100%;
                height: 100%;
            }
        </style>
    </head>
    ```

    Additionally, here is how we can initialize an instrument and play/stop MIDI sounds using the library:

    ```javascript
    const piano = await Soundfont.instrument(new AudioContext(), 'acoustic_grand_piano');
    const sound = piano.play("C4"); // Play note C4
    sound.stop(); // Stop note C4
    ```

1. Now let's incorporate this into the pointer events and finalize the code for this section:

    ```javascript
    const pointerToKey = new Map()
    const piano = await Soundfont.instrument(new AudioContext(), 'acoustic_grand_piano');

    scene.onPointerObservable.add((pointerInfo) => {
        switch (pointerInfo.type) {
            case BABYLON.PointerEventTypes.POINTERDOWN:
                if(pointerInfo.pickInfo.hit) {
                    let pickedMesh = pointerInfo.pickInfo.pickedMesh;
                    let pointerId = pointerInfo.event.pointerId;
                    if (keys.has(pickedMesh)) {
                        pickedMesh.position.y -= 0.5; // Move the key downward
                        pointerToKey.set(pointerId, {
                            mesh: pickedMesh,
                            note: piano.play(pointerInfo.pickInfo.pickedMesh.name) // Play the sound of the note
                        });
                    }
                }
                break;
            case BABYLON.PointerEventTypes.POINTERUP:
                let pointerId = pointerInfo.event.pointerId;
                if (pointerToKey.has(pointerId)) {
                    pointerToKey.get(pointerId).mesh.position.y += 0.5; // Move the key upward
                    pointerToKey.get(pointerId).note.stop(); // Stop the sound of the note
                    pointerToKey.delete(pointerId);
                }
                break;
        }
    });
    ```

    Since we named each key's mesh by the note that it represents, we can easily indicate which note to play by passing in the mesh's name to the `piano.play()` function. Also note that we are storing the sound into the `pointerToKey` map so that we know what sound to stop when a key is released.

## Scaling the piano for immersive VR mode

By now, you have probably already played with the piano with your mouse (or even with a touch screen) as you added the interactive functionalities. In this section, we will be moving into the immersive VR space.

1. In order to open the page in your immersive VR headset , you must first connect your headset to your laptop (where you are developing on) and make sure that it is [set up for use in the Windows Mixed Reality App](https://docs.microsoft.com/en-us/windows/mixed-reality/enthusiast-guide/set-up-windows-mixed-reality). If you're using the Windows Mixed Reality Simulator, [make sure that it is enabled](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-windows-mixed-reality-simulator).

1. You will now see a Immersive VR button at the bottom right of the web page. Click on it and you will be able to see the piano in the XR device you are connected to.

    ![Immersive VR Button](../images/immersive-vr-button.png)

1. Once you are in the virtual space, you might notice that the piano we have built is extremely huge. In the VR world, we can only standing at the bottom of it and play it by pointing the pointer to the keys in the distance.

    ![Huge piano](./images/huge-piano.jpg)

1. Let's scale down the piano so that it's size is more like a normal standup piano in real life. To do so, we will need to use [a utility function that allows us to scale a mesh relative to a point in the space](https://doc.babylonjs.com/toolsAndResources/utilities/Pivot#enlargement). Add this function to *scene.js* (outside of `createScene()`):

    ```javascript
    BABYLON.Mesh.prototype.scaleFromPivot = function(pivotPoint, sx, sy, sz) {
        var _sx = sx / this.scaling.x;
        var _sy = sy / this.scaling.y;
        var _sz = sz / this.scaling.z;
        this.scaling = new BABYLON.Vector3(sx, sy, sz); 
        this.position = new BABYLON.Vector3(pivotPoint.x + _sx * (this.position.x - pivotPoint.x), pivotPoint.y + _sy * (this.position.y - pivotPoint.y), pivotPoint.z + _sz * (this.position.z - pivotPoint.z));
    }
    ```

1. We will use this function to scale the piano frame and keys by a factor of 0.015, with a pivot point at the origin. Edit the part where each key is lifted and where the piano frame is imported:

    ```javascript
    // Put this line at the beginning of createScene()
    const scale = 0.015;

    /* other code */

    keys.forEach(key => {
        key.position.y += 80;
        key.scaleFromPivot(new BABYLON.Vector3(0, 0, 0), scale, scale, scale);
    })
    
    BABYLON.SceneLoader.ImportMesh("frame", "https://raw.githubusercontent.com/JING1201/babylonjs-exploration/main/piano-keys/", "pianoFrame.babylon", scene, function(meshes) {
        const frame = meshes[0];
        frame.scaleFromPivot(new BABYLON.Vector3(0, 0, 0), scale, scale, scale);
    });
    ```

1. Let's not forget to scale the piano key movements and the camera positions as well:

    ```javascript
    const alpha =  3*Math.PI/2;
    const beta = Math.PI/50;
    const radius = 220*scale;
    const target = new BABYLON.Vector3(0, 0, 0);
    
    const camera = new BABYLON.ArcRotateCamera("Camera", alpha, beta, radius, target, scene);
    camera.attachControl(canvas, true);

    /*other code*/

    scene.onPointerObservable.add((pointerInfo) => {
        switch (pointerInfo.type) {
            case BABYLON.PointerEventTypes.POINTERDOWN:
                if(pointerInfo.pickInfo.hit) {
                    let pickedMesh = pointerInfo.pickInfo.pickedMesh;
                    let pointerId = pointerInfo.event.pointerId;
                    if (keys.has(pickedMesh)) {
                        pickedMesh.position.y -= 0.5*scale; // Move the key downward
                        pointerToKey.set(pointerId, {
                            mesh: pickedMesh,
                            note: piano.play(pointerInfo.pickInfo.pickedMesh.name) // Play the sound of the note
                        });
                    }
                }
                break;
            case BABYLON.PointerEventTypes.POINTERUP:
                let pointerId = pointerInfo.event.pointerId;
                if (pointerToKey.has(pointerId)) {
                    pointerToKey.get(pointerId).mesh.position.y += 0.5*scale; // Move the key upward
                    pointerToKey.get(pointerId).note.stop(); // Stop the sound of the note
                    pointerToKey.delete(pointerId);
                }
                break;
        }
    });
    ```

1. Now when we enter the VR space again, the piano would be of the size of an ordinary standup piano.

    ![Normal standup piano in VR](./images/normal-standup-piano.jpg)

## Enabling WebXR features

Now that we have scaled the piano to the right size in the VR space, let's enable some cool WebXR features to improve our piano-playing experience in the space.

1. If you have been playing the piano using your immersive VR controllers, you might have noticed that you can only use one controller at a time. Let's enable the [multi-pointer support](https://doc.babylonjs.com/typedoc/interfaces/babylon.iwebxrcontrollerpointerselectionoptions) in the XR space by using babylon.js's [WebXR features manager](https://doc.babylonjs.com/divingDeeper/webXR/webXRFeaturesManager).

    Add the following code into the `createScene()` function, after the `xrHelper` initialization line:

    ```javascript
    const featuresManager = xrHelper.baseExperience.featuresManager;

    const pointerSelection = featuresManager.enableFeature(BABYLON.WebXRFeatureName.POINTER_SELECTION, "stable", {
        xrInput: xrHelper.input,
        enablePointerSelectionOnAllControllers: true        
    });
    ```

1. Additionally, depending on where your starting point is, you might find it a little difficult to position yourself in front of the piano. If you are familiar with the immersive VR environment, you might already know about **teleportation**, which is a feature that allows you to move to another spot in the space instantly by pointing at it.

1. In order to use babylon.js's [teleportation feature](https://doc.babylonjs.com/divingDeeper/webXR/WebXRSelectedFeatures#teleportation-module), we first need to have a ground mesh that we can "stand on" in the VR space. Add the following code to the `createScene()` function to create a ground:

    ```javascript
    const ground = BABYLON.MeshBuilder.CreateGround("ground", {width: 400, height: 400});
    ```

1. The teleportation support also comes with a very useful feature called [snap-to positions](https://doc.babylonjs.com/divingDeeper/webXR/WebXRSelectedFeatures#snap-to-hotspots). In short, snap-to positions are specific positions that we want users to land at.

    For example, we can set a snap-to position in front of the piano so that users can easily teleport to that location when they point their pointers close to the piano.

    Append the code below to enable the teleportation feature and specify a snap-to point:

    ```javascript
    const teleportation = featuresManager.enableFeature(BABYLON.WebXRFeatureName.TELEPORTATION, "stable", {
        xrInput: xrHelper.input,
        floorMeshes: [ground],
        snapPositions: [new BABYLON.Vector3(2.4*3.5*scale, 0, -10*scale)],
    });
    ```

1. Now, you should be able to easily position yourself in front of the piano by teleporting to the snap-to point in front of the piano, and you should be able to play two keys at a time using both controllers.

    ![Teleportation to piano](./images/teleportation-piano.png)

## (Optional) Enabling hand-tracking

If your mixed reality device supports hand-tracking, you will be able to play on the piano in the VR space using just your hands!

You can enable babylon.js's [hand-tracking feature](https://doc.babylonjs.com/divingDeeper/webXR/WebXRSelectedFeatures#hand-tracking) by adding the following block of code to `createScene()`:

```javascript
const handTracking = featuresManager.enableFeature(BABYLON.WebXRFeatureName.HAND_TRACKING, "latest", {
    xrInput: xrHelper.input,
});
```

## Summary

Great job following through the tutorial series. Here is the final code for *scene.js* and *index.html*:

*scene.js*

```javascript
const WhiteKey = function (note, topWidth, bottomWidth, topPositionX, wholePositionX) {
    return {
        build(scene, register, referencePositionX) {
            // Create bottom part
            const bottom = BABYLON.MeshBuilder.CreateBox("whiteKeyBottom", {width: bottomWidth, height: 1.5, depth: 4.5}, scene);

            // Create top part
            const top = BABYLON.MeshBuilder.CreateBox("whiteKeyTop", {width: topWidth, height: 1.5, depth: 5}, scene);
            top.position.z =  4.75;
            top.position.x += topPositionX;

            // Merge bottom and top parts
            const key = BABYLON.Mesh.MergeMeshes([bottom, top], true, false, null, false, false);
            key.position.x = referencePositionX + wholePositionX;
            key.name = note + register;

            return key;
        }
    }
}

const BlackKey = function (note, wholePositionX) {
    return {
        build(scene, register, referencePositionX) {
            // Create black color material
            const blackMat = new BABYLON.StandardMaterial("black");
            blackMat.diffuseColor = new BABYLON.Color3(0, 0, 0);
            
            // Create black key
            const key = BABYLON.MeshBuilder.CreateBox(note + register, {width: 1.4, height: 2, depth: 5}, scene);
            key.position.z += 4.75;
            key.position.y += 0.25;
            key.position.x = referencePositionX + wholePositionX;
            key.material = blackMat;

            return key;
        }
    }
}

BABYLON.Mesh.prototype.scaleFromPivot = function(pivotPoint, sx, sy, sz) {
    var _sx = sx / this.scaling.x;
    var _sy = sy / this.scaling.y;
    var _sz = sz / this.scaling.z;
    this.scaling = new BABYLON.Vector3(sx, sy, sz); 
    this.position = new BABYLON.Vector3(pivotPoint.x + _sx * (this.position.x - pivotPoint.x), pivotPoint.y + _sy * (this.position.y - pivotPoint.y), pivotPoint.z + _sz * (this.position.z - pivotPoint.z));
}

const createScene = async function(engine) {
    const scene = new BABYLON.Scene(engine);
    const scale = 0.015;

    const alpha =  3*Math.PI/2;
    const beta = Math.PI/50;
    const radius = 220*scale;
    const target = new BABYLON.Vector3(0, 0, 0);
    
    const camera = new BABYLON.ArcRotateCamera("Camera", alpha, beta, radius, target, scene);
    camera.attachControl(canvas, true);
    
    const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(0, 1, 0), scene);
    light.intensity = 0.6;

    const keyParams = [
        WhiteKey("C", 1.4, 2.3, -0.45, -14.4),
        BlackKey("C#", -13.45),
        WhiteKey("D", 1.4, 2.4, 0, -12),
        BlackKey("D#", -10.6),
        WhiteKey("E", 1.4, 2.3, 0.45, -9.6),
        WhiteKey("F", 1.3, 2.4, -0.55, -7.2),
        BlackKey("F#", -6.35),
        WhiteKey("G", 1.3, 2.3, -0.2, -4.8),
        BlackKey("G#", -3.6),
        WhiteKey("A", 1.3, 2.3, 0.2, -2.4),
        BlackKey("A#", -0.85),
        WhiteKey("B", 1.3, 2.4, 0.55, 0)
    ]
    
    const keys = new Set();

    // Register 1 through 7
    var referencePositionX = -2.4*14;
    for (let octave = 1; octave <= 7; octave++) {
        keyParams.forEach(key => {
            keys.add(key.build(scene, octave, referencePositionX))
        })
        referencePositionX += 2.4*7;
    }

    // Register 0
    keys.add(WhiteKey("A", 1.9, 2.3, -0.20, -2.4).build(scene, 0, -2.4*21))
    keyParams.slice(10, 12).forEach(key => {
        keys.add(key.build(scene, 0, -2.4*21))
    })
    
    // Register 8
    keys.add(WhiteKey("C", 2.3, 2.3, 0, -2.4*6).build(scene, 8, 84))

    keys.forEach(key => {
        key.position.y += 80;
        key.scaleFromPivot(new BABYLON.Vector3(0, 0, 0), scale, scale, scale);
    })
    
    BABYLON.SceneLoader.ImportMesh("frame", "https://raw.githubusercontent.com/JING1201/babylonjs-exploration/main/piano-keys/", "pianoFrame.babylon", scene, function(meshes) {
        const frame = meshes[0];
        frame.scaleFromPivot(new BABYLON.Vector3(0, 0, 0), scale, scale, scale);
    });

    const pointerToKey = new Map()
    const piano = await Soundfont.instrument(new AudioContext(), 'acoustic_grand_piano');

    scene.onPointerObservable.add((pointerInfo) => {
        switch (pointerInfo.type) {
            case BABYLON.PointerEventTypes.POINTERDOWN:
                if(pointerInfo.pickInfo.hit) {
                    let pickedMesh = pointerInfo.pickInfo.pickedMesh;
                    let pointerId = pointerInfo.event.pointerId;
                    if (keys.has(pickedMesh)) {
                        pickedMesh.position.y -= 0.5*scale; // Move the key downward
                        pointerToKey.set(pointerId, {
                            mesh: pickedMesh,
                            note: piano.play(pointerInfo.pickInfo.pickedMesh.name) // Play the sound of the note
                        });
                    }
                }
                break;
            case BABYLON.PointerEventTypes.POINTERUP:
                let pointerId = pointerInfo.event.pointerId;
                if (pointerToKey.has(pointerId)) {
                    pointerToKey.get(pointerId).mesh.position.y += 0.5*scale; // Move the key upward
                    pointerToKey.get(pointerId).note.stop(); // Stop the sound of the note
                    pointerToKey.delete(pointerId);
                }
                break;
        }
    });

    const xrHelper = await scene.createDefaultXRExperienceAsync();

    const featuresManager = xrHelper.baseExperience.featuresManager;

    const pointerSelection = featuresManager.enableFeature(BABYLON.WebXRFeatureName.POINTER_SELECTION, "stable", {
        xrInput: xrHelper.input,
        enablePointerSelectionOnAllControllers: true        
    });

    const ground = BABYLON.MeshBuilder.CreateGround("ground", {width: 400, height: 400});

    const teleportation = featuresManager.enableFeature(BABYLON.WebXRFeatureName.TELEPORTATION, "stable", {
        xrInput: xrHelper.input,
        floorMeshes: [ground],
        snapPositions: [new BABYLON.Vector3(2.4*3.5*scale, 0, -10*scale)],
    });

    const handTracking = featuresManager.enableFeature(BABYLON.WebXRFeatureName.HAND_TRACKING, "latest", {
        xrInput: xrHelper.input,
    });

    return scene;
}
```

*index.html*

```html
<html>
    <head>
        <title>Babylon Template</title>
        <script src="https://cdn.babylonjs.com/babylon.js"></script>
        <script src="soundfont-player.min.js"></script>
        <script src="piano-keys/piano_keys.js"></script>
        <style>
            html, body, #renderCanvas {
                width: 100%;
                height: 100%;
            }
        </style>

        
    </head>
   <body>
    <canvas id="renderCanvas"></canvas>
    <script>
        const canvas = document.getElementById("renderCanvas"); // Get the canvas element
        const engine = new BABYLON.Engine(canvas, true); // Generate the BABYLON 3D engine

        // Register a render loop to repeatedly render the scene
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

## Next steps

Congratulations! You've completed our series of the babylon.js piano-building tutorial and learned how to:

> [!div class="checklist"]
> * Create, position, and merge meshes to build a model of a piano keyboard
> * Import a babylon.js model of a standup piano frame
> * Add pointer interactions to each piano key
> * Scale the size of meshes based on a pivot point
> * Enable key WebXR features such as teleportation and multipointer support
> * (Optional) Enable hand tracking WebXR feature

For more information on Mixed Reality JavaScript development see [JavaScript development overview](/javascript-development-overview.md).
