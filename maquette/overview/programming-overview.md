---
title: Programming overview
description: Learn how to access Maquette objects and interfaces with scripting.
author: hferrone
ms.author: v-hferrone
ms.date: 10/26/2020
ms.topic: article
keywords: Windows Mixed Reality, Maquette, prototyping, Mixed Reality, Virtual Reality, VR, MR, Feedback, Feedback Hub, bugs
---

# Programming overview

<!-- TODO(Harrison): Need consolidated logo with text -->

![Logo](../images/MaquetteIcon.png) Programming Overview

Microsoft Maquette uses JavaScript (ECMAScript 5.1 with extensions) based on the [Jint](https://github.com/sebastienros/jint) interpreter. The extension `.mqjs` is used to distinguish Maquette javascript files from normal JavaScript.

<!-- TODO(Stefan): Need more context and high-level explanation of Maquette objects, their accessible interfaces, and functionality. 
                   - What can they do and what problems can they solve?
                   - Is there a specific link to the Maquette object API that can be included here?  
-->
Maquette objects and interfaces are accessible and scriptable via the `Maquette` Object. Documentation on Maquette Objects and interfaces are provided in Maquette's API Reference.

<!-- TODO(Stefan): Link to roadmap information, which hasn't been documented yet. -->
MaquetteScript is a new addition and in flux so changes should be expected. More detailed documentation and updates available soon.

<!-- TODO(Stefan): Is Spotlights a component or added functionality of Maquette? -->
## Spotlights on Scripting

* TBD - Scripting Spotlights focused as Samples/Tutorials
  * 2x Images/Caption – link to spotlight page

<!-- TODO(Stefan): Each of these bullets need to be fleshed out. -->
## Getting started with MaquetteScript

* Mqjs vs. JS
* Programming Model
  * Editing vs. Running
* Link to Programming Workflow
* Link to Sharing Results

## Programming workflow

<!-- TODO(Stefan): Which of these bullets are no longer TBD? We only want to include documentation on existing content. -->
TBD
* REPL
* Scripting operation
* Debugger operation
* Debugging loop
* Copy/Paste of code?

## Running .mqjs scripts

<!-- TODO(Stefan): Need screenshot -->
To run a MaquetteScript .mqjs file, go to the companion windows of Maquette and open the scripting tab to locate scripts.

> [!NOTE] 
> Some options will not work yet because we have not ship the scripts.

## VSCode Editor Workflow

To evaluate script in Maquette from within VSCode, the user needs to know two commands:

   `CTRL-5` evaluates the selected text or the entire line where the cursor is located. 

   `CTRL-SHIFT-5` evaluates the entire file.

<!-- TODO(Stefan): This could use a nice simple infographic of the REPL loop. -->
Text is sent to Maquette, evaluated in the JavaScript environment, and the result is sent back to the output console of VSCode. This can be used as a REPL (read-eval-print-loop).

## Example First Step

<!-- TODO(Stefan): What kind of file, a C# or .mqjs file? -->
Copy the following code into a file in VSCode:

```csharp
var myCube = Maquette.CreateCube();
myCube.position = Maquette.User.GetPositionInFront(0.6);
myCube.color = Color(1.0, 0.5, 0.0);
```

<!-- TODO(Stefan): Need screenshot. -->
Select the code or just sections and hit `CTRL-5` to execute. This should create a cube, place it in front of you and change its color.

There are more examples to find through the extension.

## Sharing Results

<!-- TODO(Stefan): Need to fill in content/context for these bullets. If there's a lot of content, we might consider breaking this out into it's own doc. -->
How to share between users/teams
* Zip project in documents directory
* Copy project to file share
* Adding file location of team share
Submissions to Maquette Team

<!-- TODO(Stefan): Need to break these out into their own sections and fill in the missing content/context. 
                   - Which of these is accessible now and not TBD?
-->
TBD
* Includes, reference to code elsewhere with relative/absolute paths, modules
* Libraries?
* Runtime support
* Unresolved Externals - Behavior when entries missing/crashing
* Can we add/edit/observe script associated with specific objects?
  * Can we copy/paste this script elsewhere?
  * What about object properties?
  * Naming objects in my scene? (renaming script with it)
  * THIS or SELF keyword for script associated with an object
  * If I right click on an object, can I see code associated with it (and all it's hierarchy)
  * Can I select in UI and be brought up at the code in VSCode?
  * Keeping code associated with an object "together" in the script source file?
  * Bring property window up of an object when I click on it? In VR and in main tab?
* Security Issues
* Testing – might be TBD but we could suggest video or frame grab by script
* If we have a bug reporting mechanism, we might make that accessible via script for others (?) …later
* Deployment – how to “share” the result, package as EXE
* Running/controlling a demo or spectating/monitoring
* Player mode
* We might have a segment on how to make “components” for sharing? (might  be tbd)
  * Is there #include? This handles pure JS I suppose but may have namespace conflicts.
  * Is there anything we could do for a maquette to incorporate some other maquette with named objects to match JS code?
