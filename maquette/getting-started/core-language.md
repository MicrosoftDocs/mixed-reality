---
title: Core language
description: Learn how to setup and use controllers in Windows Mixed Reality.
author: hferrone
ms.author: v-hferrone
ms.date: 10/26/2020
ms.topic: article
keywords: Windows Mixed Reality, Maquette, prototyping, Mixed Reality, Virtual Reality, VR, MR, Feedback, Feedback Hub, bugs
---

# Core language

![Logo](/doc_staging/images/MaquetteIcon.png) MaquetteScript Core Language Details
============
Accessing `Maquette` Object and Namespace
----------
Maquette exposes internal objects and interfaces in JavaScript through the `Maquette` object and its children. This functionality is described in the [Maquette Object and Namespace](/doc_staging/objects/Maquette.html) documentation. 

The `Maquette` object has top-level functions to make it easier to interact with Maquette itself and make repetitive problems easier to solve. This is described in the documentation of [MaquetteScriptObject](/doc_staging/objects/Maquette.MaquetteScriptObject.html).

Maquette Startup and Loading
----------
Maquette will load and evaluate specific JavaScript files to enable config, setup and initiaization at the following times:

During Maquette startup:
<pre>
~/Documents/Maquette/Scripts/OnMaquetteStartup.mqjs
</pre>

Whenever any project is loaded:
<pre>
~/Documents/Maquette/Scripts/OnMaquetteProjectLoad.mqjs
</pre>

Projects load their respective project scripts:
<pre>
~/Documents/Maquette/Project/&lt;Your Project&gt;/Scripts/OnLoad.mqjs
</pre>

JavaScript Implementation
----------
The JavaScript interpreter used in Maquette is based on [Jint](https://github.com/sebastienros/jint). Jint is ECMAScript 5.1 compatible and supports additional [extensions from ECMAScript 6](https://github.com/sebastienros/jint/issues/343). 

The extension `.mqjs` is used to distinguish Maquette javascript files from normal JavaScript.