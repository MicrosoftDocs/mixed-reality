---
title: Welcome to the Mixed Reality Feature Tool
description: Learn the basics of the MR Feature Tool for HoloLens and VR development.
author: davidkline-ms
ms.author: v-hferrone
ms.date: 03/04/2021
ms.topic: article
ms.localizationpriority: high
keywords: up-to-date, tools, get started, basics, unity, visual studio, toolkit, mixed reality headset, windows mixed reality headset, virtual reality headset, installation, Windows, HoloLens, emulator, unreal, openxr
---

# Welcome to the Mixed Reality Feature Tool

![Mixed Reality Feature Tool banner image](images/feature-tool-banner.png)

> [!IMPORTANT]
> The Mixed Reality Feature Tool is only available for Unity at the moment. If you're developing in Unreal, refer to the [tools installation](../install-the-tools.md) documentation.

The Mixed Reality Feature Tool is a new way for developers to discover, update, and add Mixed Reality feature packages into Unity projects. You can search packages by name or category, see their dependencies, and even view proposed changes to your projects manifest file before importing. If you've never worked with a manifest file before, it's a JSON file containing all your projects packages. Once you've validated the packages you want, the Mixed Reality Feature tool will download them into the project of your choice.

## System requirements

Before you can run the Mixed Reality Feature Tool, you'll need:

* [.NET 5.0 runtime](https://dotnet.microsoft.com/download/dotnet/5.0)
* [Windows 10](https://www.microsoft.com/software-download/windows10ISO)

> [!NOTE]
> The Mixed Reality Feature Tool currently only runs on Windows, but MacOS support is coming soon!

## Download

Once you have your environment set up:

* [Download the latest version of the Mixed Reality Feature Tool](https://aka.ms/MRFeatureTool) from the Microsoft Download Center.
* When the download completes, unzip the file and save it to your desktop
    * We recommend creating a shortcut to the executable file for faster access

> [!NOTE]
> If you're new to using the Unity Package Manager, follow our [UPM instructions](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/configuration/usingupm#managing-mixed-reality-features-with-the-unity-package-manager).

## Changes in this release

Version 1.0.2103 Beta includes the following fixes:

* Improvements to download error detection.
* Updates on how manifests are written to avoid failure to update correctly.
* Escpaing has been removed from file paths in the project manifest.

The following features have been added in this release:

* The feature catalog is now cached. To check for new features and updates, please use the refresh button in Discovery.
* Move project selection from the Import step to before Discovery.
* Available packages are filtered by the project's specified Unity version.
* The discovery view now displays currently installed packages.

## 1. Getting started

Launch the Mixed Reality Feature Tool from the executable file, which displays the start page on first launch:

![Getting started](images/FeatureToolStart.png)

From the start page, you can:

* [Configure](configuring-feature-tool.md) tool settings using the **gear icon** button
* Use the **question mark** button to launch the default web browser and display our documentation
* Select **Start** to begin discovering feature packages

## 2. Selecting your Unity project

To ensure that all discovered features are supported on your project's version of Unity, the fist step is to point the Mixed Reality Feature Tool to your project using the **ellipsis** button (to the left of the project path field).

![Select the Unity project](images/FeatureToolSelectUnityProject.png)

> [!NOTE]
> The dialog that's displayed when browsing for the Unity project folder contains '_' as the file name. There must be a value for the file name to enable the folder to be selected.

When you have located your project's folder, click the Open button to return to the Mixed Reality Feature Tool.

> [!IMPORTANT]
> The Mixed Reality Feature Tool performs validation to ensure that it has been directed to a Unity project folder. The folder must contain `Assets`, `Packages` and `Project Settings` folders.

## 3. Discovering and acquiring feature packages

> [!NOTE]
> Version 1.0.2103 Beta now caches the feature catalog contents whenever the server is accessed. This change enables fast access to available features, at the expense of displaying the absolute latest data. To update the catalog, please use the **Refresh** button.

Features are grouped by category to make things easier to find. For example, the **Mixed Reality Toolkit** category has several features for you to choose from:

![Discovery and acquisition](images/FeatureToolDiscovery.png)

When the Mixed Reality Feature Tool recognizes previously imported feature(s), it displays a notification message by each.

![Notification of imported feature](images/feature-tool-imported-note.png)


Once you've made your choices, select **Get features** to fetch all the required packages from the catalog. For more information, please see [discovering and acquiring features](discovering-features.md).

## 4. Importing feature packages

Following acquisition, the complete set of packages is presented, along with a list of required dependencies. If you need to change any feature or package selections, this is the time:

![Importing packages](images/FeatureToolImport.png)

We highly recommend using the **Validate** button to ensure the Unity project can successfully import the selected features. After validation, you'll see a pop-up dialog with a success message or a list of identified issues.

Select **Import** to continue.

> [!NOTE]
> After clicking the **Import** button, if any issues remain a simple message will be displayed. The recommendation is to click No and to use the **Validate** button to view and resolve the issues.

For more information, please see [importing features](importing-features.md).

## 5. Reviewing and approving project changes

The final step is reviewing and approving the proposed changes to the manifest and project files:

* The proposed changes to the manifest are displayed on the left
* The files to be added to the project are listed to the right
* The **Compare** button allows for side by side viewing of the current manifest and the proposed changes

![Authorization](images/FeatureToolApprovalRequest.png)

For more information, see [reviewing and approving project modifications](reviewing-changes.md).

## 6. Project updated

When the proposed changes are approved, your target Unity project is updated to reference the selected Mixed Reality features.

![Project updated](images/FeatureToolProjectUpdated.png)

The Unity project's **Packages** folder now has a **MixedReality** subfolder with the feature package file(s) and the manifest will contain the appropriate reference(s).

Return to Unity, wait for the new selected features to load, and start building!

## See also

- [Configuring the feature tool](configuring-feature-tool.md)
- [Discovery and acquisition](discovering-features.md)
- [Viewing feature package details](viewing-package-details.md)
- [Importing selected packages](importing-features.md)
- [Reviewing and approving project modifications](reviewing-changes.md)
