---
title: Authorizing project changes
description: Learn how to authorize project changes the MR Feature Tool for HoloLens and VR development.
author: sean-kerawala
ms.author: sekerawa
ms.date: 03/04/2021
ms.topic: article
ms.localizationpriority: high
keywords: up-to-date, tools, get started, basics, unity, visual studio, toolkit, mixed reality headset, windows mixed reality headset, virtual reality headset, installation, Windows, HoloLens, emulator, unreal, openxr
---

# Authorizing project changes

Before modifying the Unity project, changes to the manifest and project files need to be reviewed and approved:

![Requesting authorization](images/FeatureToolApprovalRequest.png)

## Manifest

The proposed manifest changes can be viewed in the **Manifest** column on the left. The contents are exactly what will be written to the project manifest (**Packages/manifest.json**):

![Manifest preview](images/ManifestPreview.png)

## Files to be copied into the project

The **Files to be copied into the project** section on the right lists the specific feature package files that will be copied into the Unity project:

![Manifest preview with files to be copied](images/FilesToCopy.png)

## Compare manifests

You can see a detailed side-by-side comparison of all proposed changes by selecting **Compare**:

![Compare manifests](images/FeatureToolCompareManifest.png)

> [!NOTE]
> Starting with version 1.0.2109.0, either scroll bar will scroll **both** manifests. This helps more easily spot the differences between the two files.

## Approving changes

When the proposed changes are approved, the listed files will be copied into the Unity project and the manifest will be updated with references to these files.

> [!NOTE]
> The feature package (*.tgz) files should be added to source control. They are referenced using a relative path to enable development teams to easily share features and manifest changes.

 As part of the modifications, the current **manifest.json** file will be backed up.

> [!IMPORTANT]
> When viewing the manifest backups, the oldest will be called **manifest.json.backup**. Newer backups will be annotated with a numeric value, beginning with zero (0).

## Going back to the previous step

If you need to make changes to your feature selections, use **Go Back** to return to the [import](importing-features.md) step.

## See also

- [Welcome to the Mixed Reality Feature Tool](welcome-to-mr-feature-tool.md)
- [Configuring the feature tool](configuring-feature-tool.md)
- [Discovery and acquisition](discovering-features.md)
- [Viewing feature package details](viewing-package-details.md)
- [Importing selected packages](importing-features.md)
