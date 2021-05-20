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

# Tutorial: Building a piano model in the 3d space

<!-- 2. Introductory paragraph 
Required. Lead with a light intro that describes, in customer-friendly language, 
what the customer will learn, or do, or accomplish. Answer the fundamental “why 
would I want to do this?” question. Keep it short.
-->

In the previous tutorial in the series, we have setup a web page containing a babylon.js scene with a camera and a light. In this tutorial, we will be building and adding a piano model into the scene.
< picture >

<!-- 3. Tutorial outline 
Required. Use the format provided in the list below.
-->

In this tutorial, you will learn how to:

> [!div class="checklist"]
> * Create, position, and merge meshes
> * Build a piano keyboard
> * Build a piano frame

<!-- 4. Prerequisites 
Required. First prerequisite is a link to a free trial account if one exists. If there 
are no prerequisites, state that no prerequisites are needed for this tutorial.
-->

## Before you begin

Make sure that you have gone through the previous tutorial in the series and have the final code from it ready to be edited.

## Making a simple piano keyboard
Let's begin by making a simple piano keyboard that looks like this:

![Piano octave description](../images/piano-octave.jpg)

In the image above, there are 7 white keys and 5 black keys, each labeled with the note's name. A full 88-key piano keyboard contains 7 full repetitions of this selection of keys (and 4 extra keys), and each section has double the frequency of the section to its left. For example, C5's pitch frequency is double of C4's, D5's pitch frequency is double of D4's, and so on. Without considering the pitch, visually each section looks exactly the same as each other, so we can start with investigating how to create this section of keys and later find a way to expand the scope to an 88-key full piano keyboard.

1. Before we begin to create meshes for building the keyboard, note that each black key is not perfectly aligned at the middle of the two white keys around it and that not every key has the same width, so we must create and position the mesh for each key individually.
1. For white keys, we can make an observation that each white key is composed of two parts: (1) the part below the neighboring black key(s) and (2) the part next to the neighboring black key(s) and goes above part 1. The two parts have different dimensions but are stacked together to crete a full white key. Here is the code for creating a single white key for the note C (don't worry about adding this into *scene.js* yet):

    ```javascript
        var whiteKeyBottom = BABYLON.MeshBuilder.CreateBox("whiteKeyBottom", {width: 2.3, height: 1.5, depth: 4.5}, scene);
        var whiteKeyTop = BABYLON.MeshBuilder.CreateBox("whiteKeyTop", {width: 1.4, height: 1.5, depth: 5}, scene);
        whiteKeyTop.position.z += 4.75;
        whiteKeyTop.position.x -= 0.45;
        const whiteKeyV1 = BABYLON.Mesh.MergeMeshes([whiteKeyBottom, whiteKeyTop], true, false, null, false, false);
        whiteKeyV1.name = "C4";
    ```
    Here we created two box meshes, one for the bottom part and one for the top part of the white key. We then modify the position of the top part to make it stacked on top of the bottom part and to put it towards the left to leave space for the black key (C#). This is the resulting mesh that this code would produce:
    ![White Key C](../images/white-key-c.png)

1. Creating a black key is simpler. Since all black keys are of the shape of a box, we can create a black key just by creating a box mesh, adding a black color material to it, and positioning it appropriately with the white keys. Here is the code to create the black key C#:
    ```javascript
    const blackMat = new BABYLON.StandardMaterial("black");
    blackMat.diffuseColor = new BABYLON.Color3(0, 0, 0);

    var blackKey = BABYLON.MeshBuilder.CreateBox("blackKey", {width: 1.4, height: 2, depth: 5}, scene);
    blackKey.position.z += 4.75;
    blackKey.position.y += 0.25;
    blackKey.position.x += 0.95;
    blackKey.material = blackMat;
    ```
    
1. While each white key has a slightly different shape than each other, all of them can be created by combining a top part and a bottom part. Therefore we can create a generic function to create any white key. Add the code below to *scene.js*, outside of the `createScene()` function: 
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

## [Section 2 heading]
A full 88-key piano contains repetitions of this structure
1. <!-- Step 1 -->
1. <!-- Step 2 -->
1. <!-- Step n -->

## [Section n heading]
<!-- Introduction paragraph -->
1. <!-- Step 1 -->
1. <!-- Step 2 -->
1. <!-- Step n -->

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
