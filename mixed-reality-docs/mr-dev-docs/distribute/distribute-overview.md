---
title: Distributing your apps
description: An overview of the different distribution options for various supported platforms and publishing stores. 
author: hferrone
ms.author: v-hferrone
ms.date: 10/02/2020
ms.topic: article
keywords: HoloLens, Mixed Reality, immersive headsets, app, uwp, submit, submission, filters, metadata, system requirements, keywords, wack, certification, package, appx, merchandising
---


# Distributing your apps

![Floaty bird 3D app lancher in WMR home](images/20171016-151526-mixedreality1-1200px-1000px.jpg)

Getting your apps out to into the world and into the hands of your users is the most important, and sometimes painstaking, part of any development effort. However, we've simplified the process into a journey for you to follow - be sure to check the [before you submit section](#before-you-submit-your-apps), especially if you're developing for Windows Mixed Reality headsets. 

## Before you submit your apps

[!INCLUDE[](includes/before-submission.md)]

## Distribution options

### HoloLens

> [!IMPORTANT]
> * There are no restrictions for installing on a local device.
> 
> * If you're sharing your app with another party, you need to build and supply the appx file. No extra permissions are required.
> 
> * If you're sharing with an organization, you need a work or school account and access to the organizations MDM (Mobile Device Management) infrastructure. 

> [!NOTE]
> If you're app target is a Windows Mixed Reality headset, you can either build straight from Unity or Unreal and choose one of the options below, or create a .exe file and distribute however you like. 

<table>
<colgroup>
    <col width="33%" />
    <col width="22%" />
    <col width="22%" />
    <col width="22%" />
</colgroup>
<tr>
    <td><strong>Scenario</strong></td>
    <td><strong>Local device install</strong></td>
    <td><strong>Share with anyone</strong></td>
    <td><strong>Share with an organization</strong></td>
</tr>
<!-- <tr>
    <td><a href="https://docs.microsoft.com/hololens/app-deploy-app-installer"><strong>App Installer</strong></a></td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
</tr> -->
<!-- <tr>
    <td><a href="https://docs.microsoft.com/hololens/app-deploy-app-installer"><strong>Company Portal</strong></a></td>
    <td>❌</td>
    <td>❌</td>
    <td>✔️</td>
</tr> -->
<tr>
    <td><a href="https://docs.microsoft.com/hololens/holographic-custom-apps#installing-an-application-package-with-the-device-portal"><strong>Device Portal</strong></a></td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
</tr>
<tr>
    <td><a href="https://docs.microsoft.com/hololens/app-deploy-intune"><strong>MDM - Required App Install</strong></a></td>
    <td>❌</td>
    <td>❌</td>
    <td>✔️</td>
</tr>
<tr>
    <td><a href="submitting-an-app-to-the-microsoft-store.md"><strong>Microsoft Store</strong></a></td>
    <td>❌</td>
    <td>✔️</td>
    <td>✔️</td>
</tr>
<tr>
    <td><a href="https://docs.microsoft.com/hololens/app-deploy-store-business"><strong>Microsoft Store for Business</strong></a></td>
    <td>❌</td>
    <td>❌</td>
    <td>✔️</td>
</tr>
<tr>
    <td><a href="https://docs.microsoft.com/hololens/app-deploy-provisioning-package"><strong>Provisioning Package</strong></a></td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
</tr>
<tr>
    <td><a href="https://docs.microsoft.com/hololens/holographic-custom-apps#deploying-from-microsoft-visual-studio-2015"><strong>Visual Studio</strong></a></td>
    <td>✔️</td>
    <td>❌</td>
    <td>❌</td>
</tr>
</table>

## Integrating In-app purchases

If you're looking to monetize your Mixed Reality experiences, check out our [In-app purchases](in-app-purchases.md) article.

## Submitting to the Microsoft Store

You've finally made it to the last step on your distribution journey, actually getting your app into the Microsoft Store! Our [submission guidelines](submitting-an-app-to-the-microsoft-store.md) article will take you through: 

* Partner Center registration 
* Asset preparation
* App packaging
* Testing
* Final submission process

You can even give out free trials to get future consumers excited about your new immersive experience. Once your app is listed on the Microsoft Store you can sit back, engage with your expanding user community, and think about all the new features you want to add!