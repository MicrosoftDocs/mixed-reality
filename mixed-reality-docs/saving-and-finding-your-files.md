---
title: Saving and finding your files
description: How to find, save, and share files on HoloLens.
author: mattzmsft
ms.author: mazeller
ms.date: 09/27/2018
ms.topic: article
keywords: how-to, file picker, files, photos, videos, pictures, OneDrive, storage, file explorer
---



# Saving and finding your files

Files can be saved and managed in a similar manner to other Windows 10 Desktop and Mobile devices:
* Using the File Explorer app to access local folders
* Within an app's own storage
* In a special known folder (such as the video or music library)
* Using a storage service that includes an app and file picker (such as OneDrive)
* Using a desktop PC connected to your HoloLens via USB, via MTP (Media Transfer Protocol) support

## File Explorer

You can use the File Explorer app to move and delete files from within HoloLens.

>[!NOTE]
>If you don’t see any files in File Explorer, the "Recent" filter may be active (clock icon is highlighted in left pane). To fix this, select the **This Device** document icon in the left pane (beneath the clock icon), or open the menu and select **This Device**.

## Files within an app

If an application saves files on your device, you can use that application to access them.

### Where are my photos/videos?

[Mixed reality capture](mixed-reality-capture.md) photos and videos are saved to the device's Camera Roll folder. These can be accessed via the [Photos app](see-your-photos.md#photos-app). You can use the Photos app to sync your photos and videos to OneDrive. You can also access your photos and videos via the Mixed Reality Capture page of the [Windows Device Portal](using-the-windows-device-portal.md#mixed-reality-capture).

### Requesting files from another app

An application can request to save a file or open a file from another app via [file pickers](app-model.md#file-pickers).

## Known folders

HoloLens supports a number of [known folders](app-model.md#known-folders) that apps can request permission to access.

## Files in a service

To save a file to (or access files from) a service, the app associated with the service has to be installed. In order to save files to and access files from OneDrive, you will need to install the [OneDrive app](https://www.microsoft.com/en-us/store/apps/onedrive/9wzdncrfj1p3).

## MTP (Media Transfer Protocol)

Similar to other mobile devices, connect HoloLens to your desktop PC and open File Explorer on the PC to access your HoloLens libraries (photos, videos, documents) for easy transfer.

## Clarifications

* HoloLens does not support connecting to external hard drives or SD cards.
* As of the [Windows 10 April 2018 Update (RS4) for HoloLens](release-notes.md), HoloLens includes File Explorer for saving and managing files on-device. The addition of File Explorer also gives you the ability to choose your file picker (for example, saving a file to your device or to OneDrive).
