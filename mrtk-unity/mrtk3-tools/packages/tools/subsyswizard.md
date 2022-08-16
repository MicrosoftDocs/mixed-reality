---
title: MRTK3 subsystem wizard
description: MRTK3 subsystem wizard
author: davidkline-ms
ms.author: davidkl
ms.date: 8/12/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, tools, subsystem wizard, extension
---

# Subsystem Wizard &#8212; MRTK3

Welcome to the Mixed Reality Toolkit Subsystem Wizard. This tool is used to extend the functionality of MRTK3 via a custom Unity XR Subsystem. This document describes the Subsystem Wizard, its UI and how to add your custom feature to MRTK3.

> [!NOTE]
> As a general rule, it is recommended to use subsystems to implement platform or provider abstractions.

To use the Subsystem Wizard, you must first import the MRTK3 Tools package using the [Mixed Reality Feature Tool](https://aka.ms/mrfeaturetool).

## Getting Started

To get started creating a new subsystem, please select the `Subsystem Wizard` item from the **MRTK3** > **Utilities** menu.

![Launching the Subsystem Wizard](images/menuItem.png)

Once started, the Subsystem Wizard will ask you for some information; namely the name of your organization, the base name for the subsystem as well as if the subsystem requires configuration data.

![Specifiying Subsystem Names](images/subsysWizardStart.png)

### Organization name

By default, the Subsystem Wizard will read the Unity Player settings and ensure the organization name matches the project's company name. This value can be overwritten to be any valid C# identifier.

![Organization name](images/organizationName.png)

### Base class name

All subsystems will be generated with a base class. This is required by the current architecture and makes it easy to implement platform or provider specific versions of a subsystem. It is recommended that the base class name be the generic name of the subsystem (ex: "ScentSubsystem").

![Organization name](images/baseClassName.png)

### Adding a subsystem configuration

If your subsystem is to be configurable, select the `Add subsystem configuration` box.

![Add configuration](images/addConfiguration.png)

### Gebnerated names

When generating the source code for your subsystem, the wizard automatically creates the names of specific elements. These can be overridden after the wizard completes, using your favorite text editor.

![Generated names](images/generatedNames.png)

## Preparing to generate

![Specifiying Subsystem Names](images/subsysWizardPreGenerate.png)

### Skipping file generation subsystem class

While it is most often not recommended to skip the generation of one or more subsystem files, there are some scenarios where it may be useful (ex: you wish to regenerate a single file).

> [!NOTE]
> The Subsystem Wizard will not overwrite existing files. To regenerate a file, it must first be deleted.

Use the `Skip` option next to the desired file(s) to instruct the wizard to suppress generation.

## Finishing your subsystem

![Generation complete](images/subsysWizardComplete.png)

Once complete, the Subsystem Wizard will list the set of steps required to complete your subsystem's implementation. The set of steps listed may vary based on the wizard settings.

![Next steps list](images/nextSteps.png)

### Add your code

The generated code contains indications of where required (and optional) code should be added. These indicators are in the form of a comment beginning with the word TODO and containing a description of the code to be added. For example:

```c#
// TODO: Apply the configuration to the provider.
```

### Enable the subsystem

Once your subsystem is ready, you can enable it in the MRTK3 profile by visiting **Edit** > **Project Settings** > **MRTK3**.

![Enabling new subsystem](images/enableNewSubsystem.png)
