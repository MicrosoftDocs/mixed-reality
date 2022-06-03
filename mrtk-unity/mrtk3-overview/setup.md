---
title: Mixed Reality Toolkit 3 Developer Documentation - initial setup
description: Mixed Reality Toolkit 3 for developers - initial setup.
author: MaxWang-MS
ms.author: wangmax
ms.date: 6/3/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, initial setup
---

# Initial Setup for MRTK3

Welcome to the MRTK3 preview! As MRTK3 is a collection of loosely coupled packages, consuming MRTK3 is different from that of MRTK 2.x. We don't ship MRTK as a Unity project, so you're expected to either use our example template project, which is pre-configured to consume all MRTK packages, or start fresh with a new project (recommended).

You're not expected to consume every MRTK package. See [which features are useful to you](/Packaging-information) and add only the dependencies that matter.

## 0. Install the tools
Make sure you have all the tools in this link before starting:
> [Install the tools](https://docs.microsoft.com/windows/mixed-reality/develop/install-the-tools?tabs=unity)

## 1. Clone the repository

Portions of the MRTK3 preview are being distributed via a Git repository. This includes documentation, a sample project and some tooling that simplifies Unity configuration.

To acquire these key elements of the preview, please clone the repository at <https://mixedrealitycloud.visualstudio.com/MRTK/_git/MRTK>.

## 2. Authenticating with the feed

Before acquiring the packages, it is recommended that you set Unity up to access the MRTK Private Preview feed. This will enable use of a temporary scoped registry which will simplify acquiring package updates during the private preview period.

1. Go to the [Mixed Reality Cloud Personal Access Tokens](https://mixedrealitycloud.visualstudio.com/_usersSettings/tokens) page

1. Click on **New Token**

   ![npm new token](.images/new-token.png)

1. Create a new Personal Access Token with the `Packaging: Read` scope:

   ![Create a new personal access token](.images/create-personal-access-token.png)

1. In the `Tools` folder of the repository, please run `Edit-UpmConfigPreview.ps1` using the following syntax. This will enable Unity to access the distribution feed.

   `.\Edit-UpmConfigPreview.ps1 -PAT [your PAT here]`

## 3. Trying out the sample project

Now that the repository has been cloned and Unity has been updated to authenticate with the feed, you can try out MRTK3 using the example scenes provided in the `Samples` folder of the repository.

This project has been pre-configured with the private preview's scoped registry and references to all of the current MRTK3 packages. You can simply launch Unity (2020.3.33f1 or newer) on the `Samples` folder after finishing the authentication steps above and start playing with the sample scenes in Editor, via remoting or deployed to devices.

For information on the sample scenes included in the preview, please see [Example scenes](Example-scenes).

## 4. Adding MRTK3 to a new Unity project

### 4.1 Importing required dependencies

There are a handful of packages that MRTK3 uses which are not part of this preview. To obtain these, please use the `Mixed Reality Feature Tool` and import the latest versions of the following:

- **Platform Support → Mixed Reality OpenXR Plugin**
- [Optional] **Spatial Audio → Microsoft Spatializer**

### 4.2 Unity Package Manager (option 1 - recommended)

During the private preview period, it is recommended to use a scoped registry and the Unity Package Manager to acquire and update the MRTK3 packages.

>**Note**
>Following the conclusion of the MRTK3 Private Preview, the feed being used will be decommissioned.

1. Create a new Unity project

1. Open **Edit → Project Settings** and select **Package Manager**.

1. Add a new scoped registry:

   1. Give the registry an easily identifiable **Name**, for example `MRTK3 Private Preview`.

   1. Set the **URL** to `https://mixedrealitycloud.pkgs.visualstudio.com/MRTK/_packaging/MRTK/npm/registry`.

   1. Set **Scope(s)** to `com.microsoft.mrtk`.

   1. Click **Save**

   ![Scoped registry](.images/scoped-registry.png)

1. Add the desired package(s) to the manifest:

   1. Open `Packages/manifest.json` from the root of your project.

   1. Add a line to the `dependencies` section of the file (it is recommended to add to the top of the collection) for each desired package. The following **sample** table lists the available packages and their versions. For the latest versions we are shipping in the preview, please refer to <https://mixedrealitycloud.visualstudio.com/MRTK/_artifacts/feed/MRTK>.

      ![Manifest sample](.images/sample-manifest.png)

1. Unity will import the selected packages.

For more information on the MRTK3 packages, including their dependencies, please refer to [Using MRTK3 packages](/Packaging-information.md).

### 4.3 Local .tgz files (option 2)

1. Download the desired packages from <https://mixedrealitycloud.visualstudio.com/MRTK/_artifacts/feed/MRTK>.

1. Create a new Unity project

1. Open **Window → Package Manager**

1. For each desired package:

   >**Note**
   >When importing .tgz files manually, it is important to add them in the correct order (dependencies first). Please refer to [Using MRTK3 packages](/Packaging-information.md) for more information.

   1. In the upper-left of the Package Manager window, click the **+** button and select **Add from tarball...**.

   ![Add from tarball](.images/add-from-tarball.png)

1. Unity will import the selected packages.

## 5. Configuring MRTK3 after import

Once imported, MRTK3 requires some configuration.

1. Navigate to **Edit > Project Settings**

1. Under **Project Settings**, navigate to **XR Plug-in Management** and enable **OpenXR** under both the Standalone and UWP tabs. Under each tab, ensure that **Initialize XR on Startup** is selected and that the **Windows Mixed Reality feature group under Standalone** and the **Microsoft HoloLens feature group under UWP** are enabled.

    >**Note**
    >A yellow warning icon may appear after checking the **OpenXR** option. Click on that icon to open the **OpenXR Project Validation** tool. Click fix all and ignore the interaction profile issue that cannot be auto fixed. The profiles will be added in the step below.

    For standalone:

    ![Standalone XR Plug-in Management window](.images/standalone-xr-plug-in-management.png)

    For UWP:

    ![UWP XR Plug-in Management window](.images/uwp-xr-plug-in-management.png)

1. Under **Project Settings**, navigate to **XR Plug-in Management > OpenXR > Interaction Profiles** and add the following three profiles for UWP and Standalone:
    * **Eye Gaze Interaction Profile**
    * **Microsoft Hand Interaction Profile**
    * **Microsoft Motion Controller Profile**

    >**Note**
    >You may need to use the **OpenXR Project Validation** tool to eliminate the yellow triangle.

    For standalone:

    ![Standalone OpenXR](.images/standalone-openxr.png)

    For UWP:

    ![UWP OpenXR](.images/uwp-openxr.png)

1. For HoloLens 2, we recommend using 16-bit depth submission in the settings above. For immersive headsets, you can use 24-bit depth submission. See the [Microsoft development docs for Unity](https://docs.microsoft.com/windows/mixed-reality/develop/unity/recommended-settings-for-unity#enable-depth-buffer-sharing) for more info.
1. Under **Project Settings**, navigate to **Mixed Reality Toolkit > Profile** and change from **None** to **MRTK Profile** for both UWP and Standalone.

    >**Note**
    > Not all of the MRTK subsystems are shown in these photos. The MRTK subsystems that you see may be different, depending on the MRTK3 packages you have added to your project.

    For standalone:

    ![Standalone Mixed Reality Toolkit](.images/standalone-mr-toolkit.jpg)

    For UWP:

    ![UWP Mixed Reality Toolkit](.images/uwp-mr-toolkit.jpg)

## Next steps

* [Using MRTK packages](/Packaging-information.md)
