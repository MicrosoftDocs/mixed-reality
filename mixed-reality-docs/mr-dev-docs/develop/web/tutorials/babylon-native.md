---
title: Introduction to the Babylon Native tutorials
description: Complete this course to learn how to use javascript in a mixed reality application.
author: bogenera
ms.author: bogenera
ms.date: 10/02/2021
ms.topic: article
keywords: mixed reality, javascript, tutorial, BabylonNative, hololens, mixed reality, UWP, Windows 10
ms.localizationpriority: high
---

# 1. Introduction to the Babylon Native tutorials

In this tutorial you will learn how to setup the environment for BabylonNative and deploy your project to HoloLens.

## Requirements

* A Windows 10 operating system
* [Visual Studio 2019](https://visualstudio.microsoft.com/downloads/) with C++ development tools
* [Git](https://git-scm.com/)
* [CMake](https://cmake.org/download)
* [Python v3 or higher](https://www.python.org/)
* HoloLens 2 device or emulator

> [!CAUTION]
> Make sure that you have installed MSVC v142 - VS2019 C++. In VisualStudio, go to menu Tools -> Get Tools and Features and ensure that the feature is checked as shown below
![VS2019-Features-MSVC](images/msvc-vs2019.png)

## Getting started

Clone the [BabylonNative](https://github.com/BabylonJS/BabylonNative) project from GitHub

```cmd
git clone https://github.com/BabylonJS/BabylonNative.git

cd BabylonNative
git submodule update --init --recursive
```

Create Build folder and run the cmake to perform the build

```cmd
mkdir Build
cd Build

cmake -A x64 ..
```

CMake will generate a new BabylonNative.sln file in your working directory. Now you will build again targeting Windows Universal Platform that is supported by HoloLens 2 (HL2)

```cmd
cmake -D CMAKE_SYSTEM_NAME=WindowsStore -D CMAKE_SYSTEM_VERSION=10.0 -A x64 ..
```

> [!CAUTION]
> For the demo purposes we've build x64 whereas HL2 demands arm64. Simply clean the content of Build directory and repeat the same steps running Cmake for arm64 instead of x64. Note that you will not be able to run the generated executable anymore

Navigate to build folder and open BabylonNative.sln in Visual Studio, click 'Build Solution' menu item or press Ctrl+Shift+B

Once ready, navigate to Playground folder

```cmd
cd  Apps\Playground
```

Locate an executable file (depending on your solution's build configuration, e.g. \Debug\Playground.exe) and a sample demo file experience.js under \Scripts folder. Drag & drop the experience.js on top of Playground.exe. This will launch sample demo
