---
title: Building a piano model in the 3D space
description: Learn how to create a 3D piano model by coding using babylon.js
author: JING1201
ms.author: t-jinglow
ms.prod: mixed-reality
ms.topic: tutorial
ms.date: 05/31/2021
keywords: mixed reality, javascript, tutorial, BabylonJS, hololens, mixed reality, UWP, Windows 10, WebXR, immersive web
ms.localizationpriority: high
---

# Tutorial: Building a piano model in the 3D space

In the previous tutorial in the series, we have setup a web page containing a babylon.js scene with a camera and a light. In this tutorial, we will be building and adding a piano model into the scene.
< picture >

In this tutorial, you will learn how to:

> [!div class="checklist"]
> * Create, position, and merge meshes
> * Build a piano keyboard
> * Import a 3D model of a piano frame

## Before you begin

Make sure that you have gone through the [previous tutorial in the series](introduction-01.md) and are ready to continue adding to the code.

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
    const radius = 3.3;
    const target = new BABYLON.Vector3(0, 0, 0);
    
    const camera = new BABYLON.ArcRotateCamera("Camera", alpha, beta, radius, target, scene);
    camera.attachControl(canvas, true);
    
    const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(0, 1, 0), scene);
    light.intensity = 0.6;

    const xrHelper = await scene.createDefaultXRExperienceAsync();

    return scene;
}
```

## Getting started

Let's begin by making a simple piano keyboard which has this structure:

![Piano octave description](../images/piano-octave.jpg)

In this image, there are 7 white keys and 5 black keys, each labeled with the note's name. A full 88-key piano keyboard contains 7 full repetitions of this selection of keys (also called an register) and 4 extra keys. Every register has double the frequency of its previous register. For example, the pitch frequency of C5 (which means the C note in the fifth register) is double of C4's, D5's pitch frequency is double of D4's, and so on.

Visually, each register looks exactly the same as another, so we can start with investigating how to create this selection of keys and later find a way to expand the scope to an 88-key full piano keyboard.

## Build a piano keyboard

1. Before we begin to create meshes for building the keyboard, notice that each black key is not perfectly aligned at the middle of the two white keys around it and that not every key has the same width, so we must create and position the mesh for each key individually.

    ![Black Key Alignment](../images/black-key-position.png)

1. For white keys, we can make an observation that each white key is composed of two parts: (1) the part below the neighboring black key(s) and (2) the part next to the neighboring black key(s) and goes above part 1. The two parts have different dimensions but are stacked together to crete a full white key.

    ![White Key Shape](../images/white-key-shape-label.png)

1. This would be the code for creating a single white key for the note C (don't worry about adding this into *scene.js* yet):

    ```javascript
        var whiteKeyBottom = BABYLON.MeshBuilder.CreateBox("whiteKeyBottom", {width: 2.3, height: 1.5, depth: 4.5}, scene);
        var whiteKeyTop = BABYLON.MeshBuilder.CreateBox("whiteKeyTop", {width: 1.4, height: 1.5, depth: 5}, scene);
        whiteKeyTop.position.z += 4.75;
        whiteKeyTop.position.x -= 0.45;

        const whiteKeyV1 = BABYLON.Mesh.MergeMeshes([whiteKeyBottom, whiteKeyTop], true, false, null, false, false);
        whiteKeyV1.name = "C4";
    ```

    Here we created two [Box](https://doc.babylonjs.com/divingDeeper/mesh/creation/set/box#box-mesh) meshes, one for the bottom part and one for the top part of the white key. We then modify the position of the top part to make it stacked on top of the bottom part and to put it towards the left to leave space for the black key (C#). Finally, these two parts were merged using the [MergeMeshes](https://doc.babylonjs.com/divingDeeper/mesh/mergeMeshes) function to become one complete white key. This is the resulting mesh that this code would produce:

    ![White Key C](../images/white-key-c.png)

1. Creating a black key is simpler. Since all black keys are of the shape of a box, we can create a black key just by creating a box mesh, adding a black-colored [StandardMaterial](https://doc.babylonjs.com/divingDeeper/materials/using/materials_introduction#color) to it, and positioning it appropriately with the white keys. Here is the code to create the black key C# (don't worry about adding this to *scene.js* either):

    ```javascript
    const blackMat = new BABYLON.StandardMaterial("black");
    blackMat.diffuseColor = new BABYLON.Color3(0, 0, 0);

    var blackKey = BABYLON.MeshBuilder.CreateBox("C#4", {width: 1.4, height: 2, depth: 5}, scene);
    blackKey.position.z += 4.75;
    blackKey.position.y += 0.25;
    blackKey.position.x += 0.95;
    blackKey.material = blackMat;
    ```

    The resulting black key produced by this code (along with the previous white key) would look like this:

    ![Black Key C#](../images/black-key-csharp.png)

1. As you can see, creating each key is pretty tedious and can result in a lot of similar code since we have to specify each of their dimensions and position. Let's try to make the creation process more efficient in the next section.

## Build a piano keyboard efficiently

1. While each white key has a slightly different shape than each other, all of them can be created by combining a top part and a bottom part. Therefore, we can implement a generic function to create and position any white key. Add the code below to *scene.js*, outside of the `createScene()` function:

    ```javascript
    const WhiteKey = function (note, topWidth, bottomWidth, topPositionX, wholePositionX) {
        return {
            build(scene, octave, referencePositionX) {
                var bottom = BABYLON.MeshBuilder.CreateBox("whiteKeyBottom", {width: bottomWidth/scale, height: 1.5/scale, depth: 4.5/scale}, scene);
                var top = BABYLON.MeshBuilder.CreateBox("whiteKeyTop", {width: topWidth/scale, height: 1.5/scale, depth: 5/scale}, scene);
                top.position.z =  4.75/scale;
                top.position.x += topPositionX/scale;
    
                const key = BABYLON.Mesh.MergeMeshes([bottom, top], true, false, null, false, false);
                key.position.x = referencePositionX/scale + wholePositionX/scale;
                key.name = note+octave;
                
                key.position.y += keyHeight/scale;
    
                return key;
            }
        }
    }
    ```

    In this block of code, we create a function named `WhiteKey()` which returns an object with a `build()` function. 

    The parameters of `WhiteKey()` are the name of the note that the key represents, width of the top part, width of the bottom part, position of the top part relative to the bottom part, and position of the whole key relative to the end point of the octave (the right edge of key B).

    In the `build()` function, the parameters are the scene that the key is in, the octave that the key belongs to, and the x coordinate of the end point of the octave (used as a reference point).

    By having these two layers of abstraction, we are able to initialize a `WhiteKey` object with the parameters needed to create a specific type of key within an octave, and then call `build()` function on the object multiple times to create that key in different octaves.

1. Similarly, we can write a generic function to create a black key. Add the code below to *scene.js*, also outside of the `createScene()` function:

    ```javascript
    const BlackKey = function (note, positionX) {
        return {
            build(scene, octave, referencePositionX) {
                const blackMat = new BABYLON.StandardMaterial("black");
                blackMat.diffuseColor = new BABYLON.Color3(0, 0, 0);
    
                const key = BABYLON.MeshBuilder.CreateBox(note+octave, {width: 1.4/scale, height: 2/scale, depth: 5/scale}, scene);
                key.position.z += 4.75/scale;
                key.position.y += 0.25/scale;
                key.position.x = referencePositionX/scale + positionX/scale;
                key.material = blackMat;
                
                key.position.y += keyHeight/scale;
    
                return key;
            }
        }
    }
    ```

    The parameters for `BlackKey()` are a lot simpler because creating a black key only involves creating a box, and every black key's width and z-position is the same. Therefore in the parameters, we are only taking the note that the key represents and the key's relative position to the end point of the octave. 

    The `build()` function takes in the same parameters as the one in `WhiteKey()`, but notice that we have included the black material creation and assignment to the mesh within this function.

1. Now that we have a more efficient way of creating the keys, let's initialize an array that stores all of the `WhiteKey` and `BlackKey` objects and call the `build()` function on each of them. We will also store all of the key meshes created in a Set named `keys`. Append the following lines of code in the `createScene()` function:

    ```javascript
    const keyParams = [
        WhiteKey("C", 1.4, 2.3, -0.45, -2.4*6),
        BlackKey("C#", -2.4*6+0.95),
        WhiteKey("D", 1.4, 2.4, 0, -2.4*5),
        BlackKey("D#", -2.4*6+0.95+2.85),
        WhiteKey("E", 1.4, 2.3, 0.45, -2.4*4),
        WhiteKey("F", 1.3, 2.4, -0.55, -2.4*3),
        BlackKey("F#", -2.4*6+0.95+0.45 + 2.4 * 2 + 1.85),
        WhiteKey("G", 1.3, 2.3, -0.2, -2.4*2),
        BlackKey("G#", -2.4*6+0.95+0.45 + 2.4 * 2 + 1.85 + 2.75),
        WhiteKey("A", 1.3, 2.3, 0.2, -2.4*1),
        BlackKey("A#", -2.4*6+0.95+0.45 + 2.4 * 2 + 1.85 + 2.75 *2),
        WhiteKey("B", 1.3, 2.4, 0.55, 0)
    ]
    
    const keys = new Set();
    
    keyParams.forEach(key => {
        keys.add(key.build(scene, 4, 0))
    })
    ```

    As you have probably noticed, in this code block we are creating the keys for register number 4 and placing them relative to the origin of the space.

1. This is what the resulting keyboard looks like:

    ![Piano Keyboard with One Register](../images/piano-one-register.png)

## Expanding to an 88-key piano
In this section, let's expand the usage of the key-creation functions we wrote in the last section by using them to generate a full piano keyboard.

1. As mentioned earlier, an full (88-key) piano keyboard contains 7 repeated registers and 4 other notes. 3 of those extra notes are in register 0 (left end of the keyboard), and 1 is in register 8 (right end of the keyboard).

(show pic of 88-key layout highlighting the extra keys)

1. We will first work on building the 7 full repetitions by adding an additional loop around the `key.build()` function call we wrote earlier. Replace the previous loop for the `build()` function with the following code:

    ```javascript
    // Register 1 through 7
    var referencePositionX = -2.4*14;
    for (var octave=1; octave<=7; octave++) {
        keyParams.forEach(key => {
            keys.add(key.build(scene, octave, referencePositionX))
        })
        referencePositionX += 2.4*7;
    }
    ```

    In this loop, we build the keys for register 1 through 7 and increment the reference position every time we move on to the next register.

1. Next, let's create the rest of the keys. Add the following snippet to the `createScene()` function:

    ```javascript
    // Register 0
    keys.add(WhiteKey("A", 1.9, 2.3, -0.20, -2.4).build(scene, 0, -2.4*21))
    keyParams.slice(10, 12).forEach(key => {
        keys.add(key.build(scene, 0, -2.4*21))
    })
    
    // Register 8
    keys.add(WhiteKey("C", 2.3, 2.3, 0, -2.4*6).build(scene, 8, referencePositionX))
    ```

    Note that the left-most key and the right-most key of the piano keyboard don't fit into the dimensions defined in `keyParams` (because they are not next to a black key at the edge), so we need to create a new `WhiteKey` object for each of them to specify their special shape.

1. The keyboard produced should look like this after the changes are made:

    ![Full Piano Keyboard Mesh](../images/full-keyboard-mesh.png)

## Adding a piano frame

1. The scene looks a little odd with just a keyboard floating in the space. Let's add a piano frame around the keyboard to create the look of a standup piano.

1. Similar to how we created the keys, we can also create the frame by positioning and combining a group of box meshes. Add this function to *scene.js*:

    ```javascript
    const buildFrame = function(scene, leftPositionX, rightPositionX) {
        const frameLeft = BABYLON.MeshBuilder.CreateBox("frameLeft", {width: 2.4/scale, height: (keyHeight+2)/scale, depth: 15/scale}, scene);
        frameLeft.position = new BABYLON.Vector3(leftPositionX/scale, (keyHeight+2)/2/scale, 4/scale);
        const frameRight = BABYLON.MeshBuilder.CreateBox("frameRight", {width: 2.4/scale, height: (keyHeight+2)/scale, depth: 15/scale}, scene);
        frameRight.position = new BABYLON.Vector3(rightPositionX/scale, (keyHeight+2)/2/scale, 4/scale);
        const frameBack = BABYLON.MeshBuilder.CreateBox("frameBack", {width: (2.4*52)/scale, height: (keyHeight+10)/scale, depth: 5/scale}, scene);
        frameBack.position = new BABYLON.Vector3(2.4*3.5/scale, (keyHeight+10)/2/scale, 9/scale);
        const wingLeft = BABYLON.MeshBuilder.CreateBox("wingLeft", {width: 2.4/scale, height: 8/scale, depth: 5/scale}, scene);
        wingLeft.position =  new BABYLON.Vector3(leftPositionX/scale, (keyHeight+6)/scale, 9/scale);
        const wingRight = BABYLON.MeshBuilder.CreateBox("wingRight", {width: 2.4/scale, height: 8/scale, depth: 5/scale}, scene);
        wingRight.position =  new BABYLON.Vector3(rightPositionX/scale, (keyHeight+6)/scale, 9/scale);
        
        const frame = BABYLON.Mesh.MergeMeshes([frameLeft, frameRight, frameBack, wingLeft, wingRight], true, false, null, false, false);
        const frameMat = new BABYLON.StandardMaterial("frameMat");
        frameMat.diffuseColor = new BABYLON.Color3(0, 0, 0);
        frame.material = frameMat;
    
        return frame;
    }
    ```

    Here, we created a function which builds a black piano frame by taking in the scene, x-coordinate of the left end of the keyboard, and x-coordinate of the right end of the keyboard.

1. Let's call this function in `createScene()`:

    ```javascript
    const frame = buildFrame(scene, -2.4*23, referencePositionX-2.4*5);
    ```

1. Now we should have a standup piano which looks like this:
![Standup Piano Mesh](../images/standup-piano-mesh.png)

## Summary

Great job following through so far! Here's the final code you should have for *scene.js*:

```javascript
const scale = 65;
const keyHeight = 80;

const WhiteKey = function (note, topWidth, bottomWidth, topPositionX, wholePositionX) {
    return {
        build(scene, octave, referencePositionX) {
            var bottom = BABYLON.MeshBuilder.CreateBox("whiteKeyBottom", {width: bottomWidth/scale, height: 1.5/scale, depth: 4.5/scale}, scene);
            var top = BABYLON.MeshBuilder.CreateBox("whiteKeyTop", {width: topWidth/scale, height: 1.5/scale, depth: 5/scale}, scene);
            top.position.z =  4.75/scale;
            top.position.x += topPositionX/scale;

            const key = BABYLON.Mesh.MergeMeshes([bottom, top], true, false, null, false, false);
            key.position.x = referencePositionX/scale + wholePositionX/scale;
            key.name = note+octave;
            
            key.position.y += keyHeight/scale;

            return key;
        }
    }
}

const BlackKey = function (note, positionX) {
    return {
        build(scene, octave, referencePositionX) {
            const blackMat = new BABYLON.StandardMaterial("black");
            blackMat.diffuseColor = new BABYLON.Color3(0, 0, 0);

            const key = BABYLON.MeshBuilder.CreateBox(note+octave, {width: 1.4/scale, height: 2/scale, depth: 5/scale}, scene);
            key.position.z += 4.75/scale;
            key.position.y += 0.25/scale;
            key.position.x = referencePositionX/scale + positionX/scale;
            key.material = blackMat;
            
            key.position.y += keyHeight/scale;

            return key;
        }
    }
}

const buildFrame = function(scene, leftPositionX, rightPositionX) {
    const frameLeft = BABYLON.MeshBuilder.CreateBox("frameLeft", {width: 2.4/scale, height: (keyHeight+2)/scale, depth: 15/scale}, scene);
    frameLeft.position = new BABYLON.Vector3(leftPositionX/scale, (keyHeight+2)/2/scale, 4/scale);
    const frameRight = BABYLON.MeshBuilder.CreateBox("frameRight", {width: 2.4/scale, height: (keyHeight+2)/scale, depth: 15/scale}, scene);
    frameRight.position = new BABYLON.Vector3(rightPositionX/scale, (keyHeight+2)/2/scale, 4/scale);
    const frameBack = BABYLON.MeshBuilder.CreateBox("frameBack", {width: (2.4*52)/scale, height: (keyHeight+10)/scale, depth: 5/scale}, scene);
    frameBack.position = new BABYLON.Vector3(2.4*3.5/scale, (keyHeight+10)/2/scale, 9/scale);
    const wingLeft = BABYLON.MeshBuilder.CreateBox("wingLeft", {width: 2.4/scale, height: 8/scale, depth: 5/scale}, scene);
    wingLeft.position =  new BABYLON.Vector3(leftPositionX/scale, (keyHeight+6)/scale, 9/scale);
    const wingRight = BABYLON.MeshBuilder.CreateBox("wingRight", {width: 2.4/scale, height: 8/scale, depth: 5/scale}, scene);
    wingRight.position =  new BABYLON.Vector3(rightPositionX/scale, (keyHeight+6)/scale, 9/scale);
    
    const frame = BABYLON.Mesh.MergeMeshes([frameLeft, frameRight, frameBack, wingLeft, wingRight], true, false, null, false, false);
    const frameMat = new BABYLON.StandardMaterial("frameMat");
    frameMat.diffuseColor = new BABYLON.Color3(0, 0, 0);
    frame.material = frameMat;

    return frame;
}

const createScene = async function (engine) {
    const scene = new BABYLON.Scene(engine);

    const alpha =  3*Math.PI/2;
    const beta = Math.PI/50;
    const radius = 220/scale;
    const target = new BABYLON.Vector3(0, 0, 0);
    
    const camera = new BABYLON.ArcRotateCamera("Camera", alpha, beta, radius, target, scene);
    camera.attachControl(canvas, true);

    // This creates a light, aiming 0,1,0 - to the sky (non-mesh)
    const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(0, 1, 0), scene);

    // Default intensity is 1. Let's dim the light a small amount
    light.intensity = 0.6;

    const keyParams = [
        WhiteKey("C", 1.4, 2.3, -0.45, -2.4*6),
        BlackKey("C#", -2.4*6+0.95),
        WhiteKey("D", 1.4, 2.4, 0, -2.4*5),
        BlackKey("D#", -2.4*6+0.95+2.85),
        WhiteKey("E", 1.4, 2.3, 0.45, -2.4*4),
        WhiteKey("F", 1.3, 2.4, -0.55, -2.4*3),
        BlackKey("F#", -2.4*6+0.95+0.45 + 2.4 * 2 + 1.85),
        WhiteKey("G", 1.3, 2.3, -0.2, -2.4*2),
        BlackKey("G#", -2.4*6+0.95+0.45 + 2.4 * 2 + 1.85 + 2.75),
        WhiteKey("A", 1.3, 2.3, 0.2, -2.4*1),
        BlackKey("A#", -2.4*6+0.95+0.45 + 2.4 * 2 + 1.85 + 2.75 *2),
        WhiteKey("B", 1.3, 2.4, 0.55, 0)
    ]

    const keys = new Set();

    //Octave 0
    keys.add(WhiteKey("A", 1.9, 2.3, -0.20, -2.4).build(scene, 0, -2.4*21))
    keyParams.slice(10, 12).forEach(key => {
        keys.add(key.build(scene, 0, -2.4*21))
    })

    //Octave 1-7
    var referencePositionX = -2.4*14;
    for (var octave=1; octave<=7; octave++) {
        keyParams.forEach(key => {
            keys.add(key.build(scene, octave, referencePositionX))
        })
        referencePositionX += 2.4*7;
    }

    //Octave 8
    keys.add(WhiteKey("C", 2.3, 2.3, 0, -2.4*6).build(scene, 8, referencePositionX))

    const frame = buildFrame(scene, -2.4*23, referencePositionX-2.4*5)

    const xrHelper = await scene.createDefaultXRExperienceAsync();

    return scene;
};
```

## Next steps

Advance to the next article to learn how to create...
> [!div class="nextstepaction"]
> [Next steps: Interact with the piano keys](keyboard-interaction.md)

<!--
Remove all the comments in this template before you sign-off or merge to the 
main branch.
-->
