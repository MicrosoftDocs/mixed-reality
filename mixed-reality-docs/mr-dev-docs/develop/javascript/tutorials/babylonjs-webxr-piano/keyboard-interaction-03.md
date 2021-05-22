---
title: #Required; page title is displayed in search results. Include the brand.
description: #Required; article description that is displayed in search results. 
author: #Required; your GitHub user alias, with correct capitalization.
ms.author: #Required; microsoft alias of author; optional team alias.
ms.service: #Required; service per approved list. slug assigned by ACOM.
ms.topic: tutorial #Required; leave this attribute/value as-is.
ms.date: #Required; mm/dd/yyyy format.
ms.custom: template-tutorial #Required; leave this attribute/value as-is.
---

<!--
Remove all the comments in this template before you sign-off or merge to the 
main branch.
-->

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

# Tutorial: Interact with the piano keyboard

<!-- 2. Introductory paragraph 
Required. Lead with a light intro that describes, in customer-friendly language, 
what the customer will learn, or do, or accomplish. Answer the fundamental “why 
would I want to do this?” question. Keep it short.
-->

In the previous tutorial, we have successfully created a model of a full 88-key piano keyboard. Now let's make it playable in the XR space.

<!-- 3. Tutorial outline 
Required. Use the format provided in the list below.
-->

In this tutorial, you will learn how to:

> [!div class="checklist"]
> * Add piano key functionalities on pointer events
> * Enable teleportation and multi-pointer support in XR
> * (Optional) Enable hand tracking in XR [only supported in Oculus Quest]

<!-- 4. Prerequisites 
Required. First prerequisite is a link to a free trial account if one exists. If there 
are no prerequisites, state that no prerequisites are needed for this tutorial.
-->

## Before you begin

Make sure that you have gone through the [previous tutorial in the series](keyboard-model-02.md) and have the final code from it ready to be edited.

<!-- 5. H2s
Required. Give each H2 a heading that sets expectations for the content that follows. 
Follow the H2 headings with a sentence about how the section contributes to the whole.
-->

## Making the piano keyboard playable
Right now, the piano keyboard we have created is a static model which does not respond to any user interactions. In this section, we will program the keys to move downward and play a sound when a user presses on them.

1. Babylon.js provides a variety of events, or observables, that we can interact with. In our case, we will be adding a function to the `onPointerObservable` since we want to program the keys to perform actions when someone press on them through a pointer, which can be a mouse click, touch, XR controller button click, etc. Here is the basic structure of how we can add any behavior to an `onPointerObservable`:

    ```javascript
    scene.onPointerObservable.add((pointerInfo) => {
        // do something
    });
    ```

1. While babylon.js provides [many different types of pointer events](https://doc.babylonjs.com/typedoc/classes/babylon.pointereventtypes), we will be using only the `POINTERDOWN` and `POINTERUP` events to program the behavior of the piano keys, using the structure below:

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

1. Let's first work on moving the keyboard's position in the y-axis at the two pointer events. For the pointer down event, we can do so by simply detecting the mesh being clicked, make sure that it is a piano key, and change the mesh's y-coordinate negatively by a small amount to make it look like the key moved downward as it is pressed. For the pointer up event, it is a little more complicated as the pointer which pressed on the key might not be released on the key, but we still want to release the key that was pressed instead of where the pointerUp event occurs. Let's look at how the following code resolves the issue:

    ```javascript
    const pointerToKey = new Map();
    scene.onPointerObservable.add((pointerInfo) => {
        switch (pointerInfo.type) {
            case BABYLON.PointerEventTypes.POINTERDOWN:
                if(pointerInfo.pickInfo.hit) {
                    const pickedMesh = pointerInfo.pickInfo.pickedMesh;
                    const pointerId = pointerInfo.event.pointerId;
                    if (keys.has(pickedMesh)) {
                        pickedMesh.position.y -= 0.5/scale;
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
                    pointerToKey.get(pointerId).mesh.position.y += 0.5/scale;
                    //stop the sound of the note of the key that is released
                    pointerToKey.delete(pointerId);
                }
                break;
        }
    });
    ```

    The `pointerId` is unique to every pointer and can help us identify a pointer when we have multiple controllers or is on a touch screen. Here we initialized a `Map` object named `pointerToKey` to store the relationship of which pointer pressed on which key, so that we know which key to release when the pointer is released, regardless of where the release happens. Once the key is released, we also delete the entry from the map since the pointer-key binding is not valid anymore.

1. Here's what the interaction would look like with the code above:

    (insert gif to show interaction)

1. Now let's work on playing and stopping a sound when a key is pressed and released. To achieve this, we will be utilizing a Javascript library named **soundfont-player**, which allows us to easily play MIDI sounds of an instrument we choose. [Download the minified code of the library](https://raw.githubusercontent.com/danigb/soundfont-player/master/dist/soundfont-player.min.js), save it in the same folder as *index.html*, and include it in the `<header>` tag in *index.html* by adding the following line of code:

    ```html
    <script src="soundfont-player.min.js"></script>
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
                    const pickedMesh = pointerInfo.pickInfo.pickedMesh;
                    const pointerId = pointerInfo.event.pointerId;
                    if (keys.has(pickedMesh)) {
                        pickedMesh.position.y -= 0.5/scale;
                        pointerToKey.set(pointerId, {
                            mesh: pickedMesh,
                            note: piano.play(pointerInfo.pickInfo.pickedMesh.name)
                        });
                    }
                }
                break;
            case BABYLON.PointerEventTypes.POINTERUP:
                const pointerId = pointerInfo.event.pointerId;
                if (pointerToKey.has(pointerId)) {
                    pointerToKey.get(pointerId).mesh.position.y += 0.5/scale;
                    pointerToKey.get(pointerId).note.stop();
                    pointerToKey.delete(pointerId);
                }
                break;
        }

    });
    ```

    Since we named each key's mesh by the note that it represents, we can easily indicate which note to play by passing in the mesh's name to the `piano.play` function. Also note that we are storing the sound into the `pointerToKey` map so that we know what sound to stop when a key is released.

1. Perfect! Now we have a playable piano:
(video/gif showing piano)

## Playing the piano in immersive VR mode
<!-- Introduction paragraph -->
By now, you have probably already played with the piano with your mouse (or even with a touch screen) as you added the interactive functionalities. In this section, we will be moving into the immersive VR space to play the piano.

1. In order to open the page in your immersive VR headset , you must first connect your headset to your laptop (where you are developing on) and make sure that it is [set up for use in the Windows Mixed Reality App](https://docs.microsoft.com/en-us/windows/mixed-reality/enthusiast-guide/set-up-windows-mixed-reality). If you're using the Windows Mixed Reality Simulator, [make sure that it is enabled](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-windows-mixed-reality-simulator).

1. You will now see a Immersive VR button at the bottom right of the web page. Click on it and you will be able to see the piano in the XR device you are connected to!

1. If you are playing the piano using your two immersive VR controllers, you might have noticed that you can only use one controller at a time. Let's enable the multi-pointer support in the XR space by using babylon.js's WebXR features manager. Add the following code into the `createScene()` function, after the `xrHelper` initialization line:

    ```javascript
    const featuresManager = xrHelper.baseExperience.featuresManager;
    const pointerSelection = featuresManager.enableFeature(BABYLON.WebXRFeatureName.POINTER_SELECTION, "stable" /* or latest */, {
        xrInput: xrHelper.input,
        enablePointerSelectionOnAllControllers: true        
    });
    ```

1. Additionally, depending on where your starting point is, you might find it a little difficult to position yourself in front of the piano. If you are already familiar with the immersive VR environment, you might already know about *teleportation*, which is a feature that allows you to move to another spot in the space instantly by pointing at it.

1. However, in order to use the teleportation feature, we first need to have a ground mesh where people can "stand on" in the VR space. Add the following code to the `createScene()` function to create a ground:

    ```javascript
    const ground = BABYLON.MeshBuilder.CreateGround("ground", {width: 400/scale, height: 400/scale});
    ```

1. The teleportation support also comes with a very useful feature called snap-to positions. In short, snap-to positions are specific positions that we want users to land at. For example, we can set a snap-to position in front of the piano so that users can easily teleport to the specific location when they point their pointers close to the piano. Append the follow snippet below to enable the teleportation feature while specifying a snap-to point:

    ```javascript
    
    const teleportation = featuresManager.enableFeature(BABYLON.WebXRFeatureName.TELEPORTATION, "stable", {
        xrInput: xrHelper.input,
        floorMeshes: [ground],
        snapPositions: [new BABYLON.Vector3(2.4*3.5/scale, 0, -10/scale)],
    });
    ```

1. Now, you should be able to easily position yourself in front of the piano by teleporting to the snap-to point in front of the piano, and you should be able to press on two keys at a time using both controllers.

## Playing on the piano with your hand (only supported on Oculus Quest)

Babylon.js's hand tracking support, which is currently only available on Oculus Quest 1 and 2, will allow you to play on the piano in the XR space using just your hands!

You can enable this feature by adding the following block of code to `createScene()`:

```javascript
const handTracking = featuresManager.enableFeature(BABYLON.WebXRFeatureName.HAND_TRACKING, "latest", {
    xrInput: xrHelper.input,
});
```


<!-- 7. Next steps
Required: A single link in the blue box format. Point to the next logical tutorial 
in a series, or, if there are no other tutorials, to some other cool thing the 
customer can do. 
-->

## Next steps

Congratulations! You've completed our series of babylon.js tutorials and learned how to:
> [!div class="checklist"]
> * Create, position, and merge meshes to build a model of a piano
> * Add pointer interactions to each piano key
> * Enable key WebXR features such as teleportation and multipointer support
> * (Optional) Enable hand tracking WebXR feature when viewing on Oculus Quest

For more information on Mixed Reality JavaScript development see [JavaScript development overview](/javascript-development-overview.md).
