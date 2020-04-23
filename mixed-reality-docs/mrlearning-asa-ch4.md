---
title: Azure Spatial Anchors tutorials - 1. Getting started with Azure Spatial Anchors
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
ms.localizationpriority: high
---

# 4. Build your Azure spatial anchors application for android/iOS device using AR Foundation

## **Section 1.0**

## Adding inbuilt Unity packages

Here we install Unity's inbuilt AR Foundation package of specific versions that is required to  support Android device .

The unity packages that we import are

a. **ARFoundation 2.1.4**

b.  **ARCore XR plugin 2.2.0 preview 2**

**Step 1:**

In the Unity menu, select **Window** > **Package Manager**:

![image-20200422075550526](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422075550526.png)

It might take a few seconds before the AR Foundation package appears in the list.

In the Package Manager window, select **AR Foundation** , here we see many version  and need to  select version 2.1.4 and install the package by clicking the **Install** button:

![image-20200422075910777](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422075910777.png)

**Step 2:**

Similarly follow the same process of step 1 to import ARCore XR plugin 2.2.0 preview 2. 

Installing version 2.0.2 first is suggested if you are not able to find the given version of ARCore XR plugin 

![image-20200422080455672](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422080455672.png)

After installation we can  update specific version 2.2.0 preview 2

![image-20200422080652614](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422080652614.png)



## Section 1.1

## Customize MRTK to support ARFoundation (ARCore / ARkit) Camera

**Step 1:**

Here we see to customize MRTK to support ARFoundation. Select MixedRealitytToolKit in Hierarchy section and select clone button on Mixed Reality ToolKit (Script) at inspector section (Right side of Window)

![image-20200422083043653](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422083043653.png) In this step we are taking the copy of setting to make it in editable format.

After you select clone button,this opens a new Clone Profile window, now we rename this Profile with 

"UnityARConfigurationProfile" and then click Clone button.

**Step 2:**

Similar to Step 1 clone the Camera settings at inspector window (Right bottom of window) 

![image-20200422085303818](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422085303818.png)

And Rename Profile name with “UnityARConfigurationProfile ”  2 and click on Clone button

**Step 3:**

While Selecting MixedRealitytToolKit in Hierarchy expand the camera setting providers in inspector window and  click on **+Add Camera Setting Provider** > expand **New data provider 1**> select Type **None** >select **Microsoft .MixedReality.Toolkit.Experimental.UnityAR**  > Select **UnityARCameraSettings**

![image-20200422092357030](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422092357030.png)

**Step 4:**

**Adding supporting scripts**

While Selecting MixedRealityToolKit in Hierarchy ,to attach supporting scripts ,click on Add component button and type in AR reference Point manager and select the script. By this it  automatically  adds AR session origin along with AR reference Point manager to the inspector window.



![image-20200422093717471](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422093717471.png)

 inspector window will look  like below 

![image-20200422093845833](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422093845833.png)



## Section 2.0

## Build Application to Android Device

To build this application to android device ,click on File at the top of window and select Build setting

![image-20200422100920036](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422100920036.png)

A new window will be appear on screen, select Android and then click on switch platform

![image-20200422105815525](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422105815525.png)

This takes few minutes to switch ,after switching to Android platform  click on **Add open scenes** and make sure your scene is added correctly

![image-20200422103018560](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422103018560.png)

To make changes for Android ,click on Player settings

In player settings expand XR setting and select **Virtual Reality Support**  and **None** by selecting "+" Symbol

![image-20200422103744879](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422103744879.png)

In player settings expand Other setting and select **Vulkan**  and remove it by selecting "-" Symbol

![image-20200422104317725](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422104317725.png)

Close player setting and click on Build button and save the Apk file 

**TO DO: Need one more screenshot** 



## Section 3.0

## Build Application to ios Device

To support ios device we  import one more unity packages with specific versions 

**ARKit XR plugin 2.1.1**

To do this repeat the same procedure of  **Section 1.0** > **step 1** and install the package

![image-20200422113237530](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422113237530.png)Click on  File at top of window and select Build setting

![image-20200422100920036](C:\Users\Veeruby Technology\AppData\Roaming\Typora\typora-user-images\image-20200422100920036.png)

A new window will be appear on screen,then select iOS and click on switch platform and keep the same player settings as Android.