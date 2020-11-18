---
title: Porting overview
description: An overview of the various porting options for bringing existing applications to Mixed Reality.
author: hferrone
ms.author: v-hferrone
ms.date: 10/02/2020
ms.topic: article
keywords: porting, unity, middleware, engine, UWP, Win32
---


# Porting overview

[//TODO: Need header image]

### Unity

HL1
-> HL2
-> 2019 LTS with XR SDK or stay on Mirage APIs

**Changing devices                                    Changing & runtime/APIs/plugins**
HL1
HL2
WMR headsets

*Current state* 2019 LTS + Mirage + Legacy(Non-XRSDK) + ARF3.x (ASA works with this setup)
*Ideal* Unity 2019 LTS + Mirage + XRSDK + ARF2.x (ASA doesn't work with this current setup)

uninstall XRSDK and reinstall Legacy to move back 

### Unreal

4.25 -> 4.26 coming 12/1/2020
UXT 0.9 -> 0.10
Update for SteamVR

Updating your SteamVR app for Windows Mixed Reality

