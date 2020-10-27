---
title: Programming workflow
description: Learn how to run Maquette scripts and work with the VSCode editor workflow.
author: hferrone
ms.author: v-hferrone
ms.date: 10/26/2020
ms.topic: article
keywords: Windows Mixed Reality, Maquette, prototyping, Mixed Reality, Virtual Reality, VR, MR, Feedback, Feedback Hub, bugs
---

# Programming workflow

![Logo](/doc_staging/images/MaquetteIcon.png) Programming Workflow

TBD
* REPL
* Scripting operation
* Debugger operation
* Debugging loop
* Copy/Paste of code?

## Running .mqjs scripts

Go to the companion windows of Maquette and open the scripting tab to locate scripts.

Note: Some options will not work yet because we have not ship the scripts.

## VSCode Editor Workflow

To evaluate script in Maquette from within VSCode, the user needs to know two commands:

   `CTRL-5` evaluates the selected text or the entire line where the cursor is located. 

   `CTRL-SHIFT-5` evaluates the entire file.

Text is sent to Maquette, evaluated in the JavaScript environment, and the result is sent back to the output console of VSCode. This can be used as a REPL (read-eval-print-loop).

## Example First Step

Copy the following code into a file in VSCode:

```csharp
var myCube = Maquette.CreateCube();
myCube.position = Maquette.User.GetPositionInFront(0.6);
myCube.color = Color(1.0, 0.5, 0.0);
```

Select the code or just sections and hit `CTRL-5` to execute. This should create a cube, place it in front of you and change its color.

There are more examples to find through the extension.

## Sharing Results

Overview
How to share between users/teams
* Zip project in documents directory
* Copy project to file share
* Adding file location of team share
Submissions to Maquette Team