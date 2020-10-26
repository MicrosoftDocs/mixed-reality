---
title: Programming overview
description: Learn how to setup and use controllers in Windows Mixed Reality.
author: hferrone
ms.author: v-hferrone
ms.date: 10/26/2020
ms.topic: article
keywords: Windows Mixed Reality, Maquette, prototyping, Mixed Reality, Virtual Reality, VR, MR, Feedback, Feedback Hub, bugs
---

# Programming overview

![Logo](/doc_staging/images/MaquetteIcon.png) Programming Overview
============
Microsoft Maquette uses JavaScript (ECMAScript 5.1 with extensions) based on the [Jint](https://github.com/sebastienros/jint) interpreter. The extension `.mqjs` is used to distinguish Maquette javascript files from normal JavaScript.

Maquette objects and interfaces are accessible and scriptable via the `Maquette` Object. Documentation on Maquette Objects and interfaces are provided in Maquette's API Reference.

MaquetteScript is a new addition and in flux so changes should be expected. More detailed documentation and updates available soon.

Spotlights on Scripting
-----------------
* TBD - Scripting Spotlights focused as Samples/Tutorials
  * 2x Images/Caption – link to spotlight page

Overview
-----------------
* Mqjs vs. JS
* Programming Model
  * Editing vs. Running
* Link to Programming Workflow
* Link to Sharing Results

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
