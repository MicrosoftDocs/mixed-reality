---
title: See-it, Say-it Label
description: Documentation for the See-it, Say-it label in MRTK3
author: marlenaklein-msft
ms.author: marlenaklein
ms.date: 4/26/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, UX, UXCore, UX Core, packaging
---

# See-it, Say-it Label

![Image showing a button with a see-it, say-it label](images/seeitsayitlabel.png)

You can use See-it, Say-it labels to communicate the voice command keyword for a button to the user. For the keyword to work, you have to set up [speech input](/windows/mixed-reality/mrtk-unity/mrtk3-input/packages/input/speech).

<br/>

The implementation of See-it, Say-it labels has changed from MRTK2 to MRTK3. Mainly, in MRTK3 there are separate `SeeItSayItLabel-Canvas` and `SeeItSayItLabel-NonCanvas` prefabs, and a component, `See It Say It Label`, which is used to enable the labels. In the canvas and non-canvas button prefabs, these labels are disabled by default. When the scene is created, the See It Say It Label component is responsible for enabling the label if the [input](/windows/mixed-reality/mrtk-unity/mrtk3-input/packages/input/overview) and [speech](/windows/mixed-reality/mrtk-unity/mrtk3-windowsspeech/packages/windowsspeech/overview) packages are installed in the project. The purpose of this check is to prevent labels from appearing when voice commands aren't functional.

<br/>

### Label Text 

The See It Say It Label component also sets the text of the label to reflect the button's speech recognition keyword. This keyword can be modified through the `SpeechRecognitionKeyword` property under `Advanced StatefulInteractable Settings` in the `Pressable Button` component. 

<br/>

### Position
You may also choose to reposition the label relative to a chosen transform by setting `PositionControl` on the See It Say It Label component. If you are repositioning a canvas label, PositionControl should be a RectTransform. 

<br/>

### Animation Effect
If the labels are enabled, they appear when a button is actively hovered. This is accomplished using a `State Visualizer`, which plays an animation effect when the button Interactable is actively hovered.