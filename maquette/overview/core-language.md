---
title: Core language
description: Learn about Maquette's core language details.
author: hferrone
ms.author: v-hferrone
ms.date: 10/26/2020
ms.topic: article
keywords: Windows Mixed Reality, Maquette, prototyping, Mixed Reality, Virtual Reality, VR, MR, Feedback, Feedback Hub, bugs
---

# MaquetteScript core language details

<!-- TODO(Harrison): Need consolidated logo with text -->
![Maquette logo](../images/MaquetteIcon.png) MaquetteScript Core Language Details

## Accessing `Maquette` Object and Namespace

<!-- TODO(Stefan): Need high-level summary of this functionality before we send people to an outside docs link. -->
Maquette exposes internal objects and interfaces in JavaScript through the `Maquette` object and its children. This functionality is described in the [Maquette Object and Namespace](https://www.maquette.ms/doc_staging/objects/Maquette.html) documentation. 

<!-- TODO(Stefan): Need high-level summary of this functionality before we send people to an outside docs link. -->
The `Maquette` object has top-level functions to make it easier to interact with Maquette itself and make repetitive problems easier to solve. This is described in the documentation of [MaquetteScriptObject](https://www.maquette.ms/doc_staging/objects/Maquette.MaquetteScriptObject.html).

## Maquette Startup and Loading

<!-- TODO(Stefan): Need context on why this is important for users and how they will take advantage of this in production? -->
Maquette will load and evaluate specific JavaScript files to enable config, setup and initialization at the following times:

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

## JavaScript Implementation

<!-- TODO(Stefan): Is there anything else we can tell users about the JS interpreter as applied to Maquette? -->
The JavaScript interpreter used in Maquette is based on [Jint](https://github.com/sebastienros/jint). Jint is ECMAScript 5.1 compatible and supports additional [extensions from ECMAScript 6](https://github.com/sebastienros/jint/issues/343). 

The extension `.mqjs` is used to distinguish Maquette javascript files from normal JavaScript.

## See also 
<!-- TODO(Stefan): Add any additional JS related links that may help with troubleshooting or issues? -->