---
title: Distributing your apps
description: An overview of the different distribution options for various supported platforms and publishing stores. 
author: vtieto
ms.author: vinnietieto
ms.date: 12/9/2020
ms.topic: article
keywords: HoloLens, Mixed Reality, immersive headsets, app, uwp, submit, submission, filters, metadata, system requirements, keywords, wack, certification, package, appx, merchandising
---

# Distributing your apps

![Floaty bird 3D app lancher in WMR home](images/distribute-hero-image.png)

Getting your apps into the hands of your users or out into the world is the most important, and sometimes painstaking, part of any development effort. We've simplified the process into a set of resources, which depend on the distribution and deployment scenario that's best suited for you or your team.

[!INCLUDE[](includes/before-submission.md)]

## Distribution options

> [!IMPORTANT]
> * If you're sharing your app with another party, you need to build and supply the appx file. 
>     * If you're using App Installer, you'll also need to share the certificate with the user.
> 
> * If you're sharing with an organization, you need a work or school account and access to the organizations [MDM (Mobile Device Management)](/hololens/hololens-enroll-mdm) infrastructure.  
>    * If you're the sharing party, you need to be an Admin in your tenant and use the [Microsoft Endpoint Manager admin center](/mem/intune/apps/apps-deploy) to make the app available. Another option is to share the appx file and the app dependencies with your end user.
>    * If you're the end user, the app will either automatically download or be available for download once you enroll with the sharing organization's tenant. 

<table>
<colgroup>
    <col width="33%" />
    <col width="22%" />
    <col width="22%" />
    <col width="22%" />
</colgroup>
<tr>
    <td><strong>Scenario</strong></td>
    <td><strong>Local device installs</strong></td>
    <td><strong>Share with anyone</strong></td>
    <td><strong>Share with an organization</strong></td>
</tr>
<tr>
    <td><a href="/hololens/app-deploy-app-installer"><strong>App Installer</strong></td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
</tr>
<tr>
    <td><a href="/hololens/app-deploy-app-installer"><strong>MDM - Company Portal</strong></a></td>
    <td>❌</td>
    <td>❌</td>
    <td>✔️</td>
</tr>
<tr>
    <td><a href="/hololens/app-deploy-intune"><strong>MDM - Required App Install</strong></a></td>
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
    <td><a href="/hololens/app-deploy-store-business"><strong>Microsoft Store for Business</strong></a></td>
    <td>❌</td>
    <td>❌</td>
    <td>✔️</td>
</tr>
<tr>
    <td><a href="/hololens/app-deploy-provisioning-package"><strong>Provisioning Package</strong></a></td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
</tr>
<tr>
    <td><a href="#other-scenarios"><strong>Custom Win32 deployment</strong></a> (Not available for HoloLens devices - see below)</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
</tr>
</table>

> [!IMPORTANT]
> App Installer isn't currently available for managed devices or HoloLens (1st Gen) devices.

## Other scenarios

* You can produce a Win32 .EXE file using the PC Standalone build target from Unity for Win32 application deployment, including Steam and Game Pass. Once you have the .EXE, you can submit your apps as normal to your chosen platform. 

* If you need to install a HoloLens 2 application while you're offline, refer to the [offline secure HoloLens 2](/hololens/hololens-common-scenarios-offline-secure) instructions or install the app through a Provisioning Package without enabling developer mode.

* You can also deploy builds to your device and share them with other developers who have Developer Mode enabled by [deploying and debugging with Visual Studio](../develop/advanced-concepts/using-visual-studio.md) or [installing an application package with the Device Portal](../develop/advanced-concepts/using-the-windows-device-portal.md#sideloading-applications).

## See also
* [Finding, installing, and uninstalling applications from the Microsoft Store](/hololens/holographic-store-apps)