---
title: Hand Physics Extension Service
description: description Hand Physics extension services.
author: CDiaz-MS
ms.author: cadia
ms.date: 01/12/2021
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK,
---

# Hand physics extension services

The hand physics service enables rigid body collision events and interactions with articulated hands.

## Getting started with hand physics extension service

Add the hand physics service to the list of extension services and use the default profile.

Once enabled, use any collider's IsTrigger property to receive collision events from all 10 digits (and palms if they're enabled).

### Prerequisites

- Enabled the extension service
- Assign an appropriate prefab to the finger/palm joint.

## Recommendations

While the service defaults to the "default" layer, it is recommended to use a separate layer for HandPhysics objects. Otherwise there may be unwanted collisions and/or inaccurate raycasts.
