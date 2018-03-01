---
title: Saving and finding your files
description: 
author: 
ms.author: mazeller
ms.date: 2/28/2018
ms.topic: article
keywords: 
---



# Saving and finding your files

Files can be saved in one of three places: within an app, in a special known folder (such as the video or music library), or in a service (such as OneDrive).

## Files within an app

If an application saves files on your device, you can use that application to access them.

### Where are my photos/videos?

[Mixed reality capture](mixed-reality-capture.md) photos and videos are saved to the device's Camera Roll folder. These can be accessed via the [Photos app](see-your-photos.md#photos-app). You can use the Photos app to sync your photos and videos to OneDrive. You can also access your photos and videos via the Mixed Reality Capture page of the [Windows Device Portal](using-the-windows-device-portal.md#mixed-reality-capture).

### Requesting files from another app

An application can request to save a file or open a file from another app via [file pickers](app-model.md#file-pickers).

## Known Folders

HoloLens supports a number of [known folders](app-model.md#known-folders) that apps can request permission to access.

## Files in a Service

To save file to or access files from a service, the app associated with the service has to be installed. In order to save files to and access files from OneDrive, you will need to install the [OneDrive app](https://www.microsoft.com/en-us/store/apps/onedrive/9wzdncrfj1p3).

## Clarifications
* HoloLens does not support connecting to external hard drives or SD cards.
* Unlike Windows on a PC or phone, HoloLens does not have a File Explorer application.
* HoloLens does not support switching between file pickers. Only the first file picker installed will be available.