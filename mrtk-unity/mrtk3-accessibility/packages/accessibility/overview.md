---
title: Mixed Reality Toolkit 3 Developer Documentation - Accessibility overview
description: Mixed Reality Toolkit 3 for developers - Accessibility overview.
author: davidkline-ms
ms.author: davidkl
ms.date: 6/6/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, accessibility
---

# MRTK3 Accessibility

The accessibility package contains features and components to enable developers to create mixed reality experiences for everyone.

>![NOTE]
>The accessibility package is currently in early preview. Early preview packages may not contain all planned features and may undergo major architectural changes prior to release.

## Features

### Describable Object

To enable assitive technologies to describe, or read, objects in the mixed reality world, MRTK3 provides the `DescribableObject` script. By adding this script to visual components, a future reader component will be able to recognize
the objcet and read to the user the information needed to understand the object and its place in the world.

>![NOTE]
> MRTK3 does not currently integrate with assitive readers. The DescribableObject is in the early stages of development and is included to allow advanced review and to gather developer feedback.

To enable a scene element to be described, attach the `DescribableObject` script and fill out the fields.

![Describable Object](images/DescribableObjectScript.png)

#### Contents

The contents field should contain the text within the object. For example, a button label or the text within a slate.

#### Content Summary

An optional, short version, or abstract, of the text within the object. With a large slate of text, it can be helpful to provide a brief summarization of the comment to allow the user to rapidly understand the information and determine if they wish to hear the full contents.

#### Description

The description places the object in the world. In the example shown, the description connects the button with a carousel model that it will animate.

#### Flags

The flags field indicates to the assistive technologies key information about the object, such as if it is salient to the current state of the experience.

#### Instructions

The instructions field gives the user information on how to interact with the object. For example, click the button to animate a carousel.

#### Role

The role is based on the W3C Accessible Rich Internet Application (ARIA) roles. In a future update to MRTK3, additional non-user interface focused roles are planned to be addd.

#### Semantic

The semantic provides a brief, description of the object. For example, typical semantics include:

- User name field
- Password field
- Login button

### Text Accessibility

#### Invert Text Color

![Invert Text Color](images/InvertText.png)

To help text objects stand out from the background, it is common to use highly contrasting colors. Depending on the scenario, it may not always be possible to design text colors that are readable in all situations.

In virtual reality experiences, it may be desirable to have free-floating text that can be viewed from any angle. To make this as easy as possible, MRTK3 provides the `TextAccessibility` script.

![Text Accessibility Script](images/TextAccessibiliyScript.png)

This script can be attached to any TextMesh Pro object and, provided that the font material uses the TextMesh Pro shader from the Mixed Reality Graphics Tools (all font assets in the Standard Assets package do so), the text will invert based on the configuration of the Accessibility subsystem.

![Accessibility Subsystem](images/AccessibilitySubsystem.png)