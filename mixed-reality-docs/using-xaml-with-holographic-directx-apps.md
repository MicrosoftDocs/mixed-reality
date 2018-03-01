---
title: Using XAML with holographic DirectX apps
description: 
author: 
ms.author: mriches
ms.date: 2/28/2018
ms.topic: article
keywords: 
---



# Using XAML with holographic DirectX apps

This topic explains the impact of switching between [2D XAML views and immersive views](app-views.md) in your DirectX app, and how to make efficient use of both a XAML view and immersive view.

## XAML view switching overview

On HoloLens, a generally immersive app that may later display a 2D XAML view must initialize that XAML view first and immediately switch to an immersive view from there. This means XAML will load before your app can do anything. As a result, there will be a small increase in your startup time, and XAML will continue to occupy memory space in your app process while it resides in the background; the amount of startup delay and memory usage depends on what your app does with XAML before switching to the native view. If you do nothing in your XAML start up code at first except start your immersive view, the impact should be minor. Also, because your holographic rendering is done directly to the immersive view, you will avoid any XAML-related restrictions on that rendering.

Note that the memory usage counts for both CPU and GPU. Direct3D 11 is able to swap virtual graphics memory, but it might not be able to swap out some or all of the XAML GPU resources, and there might be a noticeable performance hit. Either way, not loading any XAML features you don't need will leave more room for your app and provide a better experience.

## XAML view switching workflow

The workflow for an app that goes directly from XAML to immersive mode is like so:
* The app starts up in the 2D XAML view.
* The app’s XAML startup sequence detects if the current system supports holographic rendering:
* If so, the app creates the immersive view and brings it to the foreground right away. XAML loading is skipped for anything not necessary on Windows Mixed Reality devices, including any rendering classes and asset loading in the XAML view. If the app is using XAML for keyboard input, that input page should still be created.
* If not, the XAML view can proceed with business as usual.

## Tip for rendering graphics across both views

If your app needs to implement some amount of rendering in DirectX for the XAML view in Windows Mixed Reality, your best bet is to create one renderer that can work with both views. The renderer should be one instance that can be accessed from both views, and it should be able to switch between 2D and holographic rendering. That way GPU assets are only loaded once - this reduces load times, memory impact, and the amount of resources to be swapped when switching views.