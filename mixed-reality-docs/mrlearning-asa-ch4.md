---
title: Azure Spatial Anchors tutorials - 4. Getting started with Azure Spatial Anchors
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
ms.localizationpriority: high
---

# 4. Azure spatial anchors for android and iOS 

In this tutorial, you will learn how to build the existing HoloLens UWP azure spatial anchors application to android and iOS devices using AR Foundation.

## Objectives

* Learn how to build existing HoloLens UWP application using Unity's AR Foundation and ARCore XR Plugin to android devices.
* Learn how to build existing HoloLens UWP application using Unity's AR Foundation and ARKit XR Plugin to iOS devices.

## Adding inbuilt Unity packages

In this section, you will install Unity's inbuilt AR Foundation and ARCore XR plugin packages of specific versions that is required to support Android device .

Make sure you install right version of unity packages as listed below:

a. **AR Foundation 2.1.4**

b. **ARCore XR plugin 2.2.0 preview 2**

In the Unity menu, select **Window** > **Package Manager**:

![image-20200422075550526](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422075550526.png)

It might take a few seconds before the AR Foundation package appears in the list.

In the Package Manager window, select **AR Foundation** , here we see many version  and need to  select version 2.1.4 and install the package by clicking the **Install** button:

![image-20200422075910777](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422075910777.png)

Similarly follow the same process of step 1 to import ARCore XR plugin 2.2.0 preview 2. 

Installing version 2.0.2 first is suggested if you are not able to find the given version of ARCore XR plugin.

![image-20200422080455672](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422080455672.png)

After installation we can  update specific version 2.2.0 preview 2

![image-20200422080652614](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422080652614.png)

## Customize MRTK to support AR Foundation camera

Here we see to customize MRTK to support ARFoundation. Select MixedRealitytToolKit in Hierarchy section and select clone button on Mixed Reality ToolKit in inspector window.

![image-20200422083043653](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422083043653.png).

In this step we are taking the copy of MRTK settings to make it in editable format.

After you select clone button, this opens a new Clone Profile window, now you can rename this profile as "UnityARConfigurationProfile" and click Clone button.

Similarly, clone the camera settings in the inspector window and Rename Profile name with “UnityARConfigurationProfile ” and click on Clone button

![image-20200422085303818](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422085303818.png)

While Selecting MixedRealitytToolKit in Hierarchy expand the camera setting providers in inspector window and  click on **+Add Camera Setting Provider** > expand **New data provider 1**> select Type **None** >select **Microsoft .MixedReality.Toolkit.Experimental.UnityAR**  > Select **UnityARCameraSettings**

![image-20200422092357030](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422092357030.png)

While Selecting MixedRealityToolKit in Hierarchy, attach supporting scripts by clicking on Add component button and type in AR reference Point manager and select the script. 

Adding "AR Reference Point Manager" script will automatically adds "AR session origin" along with it in the the inspector window.

![image-20200422093717471](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422093717471.png)

After adding the supporting scripts, the inspector window should look like this,

![image-20200422093845833](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422093845833.png)

## Build Application to Android Device

To build this application to android device ,click on File at the top of window and select Build setting

![image-20200422100920036](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422100920036.png)

A new window will be appear on screen, select Android and then click on switch platform

![image-20200422105815525](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422105815525.png)

This will take few minutes to switch ,after switching to Android platform, click on **Add open scenes** and make sure your current scene is added for building. 

![image-20200422103018560](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422103018560.png)

To make changes for Android platform build settings ,click on Player settings

In player settings expand XR setting and select **Virtual Reality Support**  and click "+" Symbol to add **None** under the default SDK section.

![image-20200422103744879](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422103744879.png)

In player settings, expand other setting and select **Vulkan**  and remove it by selecting "-" Symbol

![image-20200422104317725](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422104317725.png)

Close player settings, click on Build button to build and  save the apk file in 

## Build Application to iOS Device

To support iOS devices, we import **ARKit XR plugin 2.1.1**  unity package from the package manager. 

![image-20200422113237530](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422113237530.png)Click on  File at top of window and select Build setting

![image-20200422100920036](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422100920036.png)

A new window will be appear on screen,then select iOS and click on switch platform and keep the same player settings as Android.

## Congratulations

In this tutorial you learned how to build existing HoloLens UWP application to android and iOS devices. You also learned how to use AR Foundation, ARCore XR plugin and ARKit XR plugin in the existing project to make it work on the android and iOS devices.