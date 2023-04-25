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


You can use `See-it, Say-it labels` to communicate the voice command keyword for a button to the user. Note that for the keyword to work, you will have to set up [speech input](/windows/mixed-reality/mrtk-unity/mrtk3-input/packages/input/speech).

<br/>

The implementation of See-it, Say-it labels has changed from MRTK2 to MRTK3. Mainly, in MRTK3 there are separate See-it, Say-it label prefabs, both canvas and non-canvas, and a component, `SeeItSayItLabelEnabler`, which is used to enable the labels. The canvas and non-canvas button prefabs include the `SeeItSayItLabel-Canvas` and `SeeItSayItLabel-NonCanvas` prefabs, respectively. These are disabled by default. When the scene is created, the SeeItSayItLabelEnabler is responsible for enabling the label if the [input](/windows/mixed-reality/mrtk-unity/mrtk3-input/packages/input/overview) and [speech](/windows/mixed-reality/mrtk-unity/mrtk3-windowsspeech/packages/windowsspeech/overview) packages are installed in the project. The purpose of this is to prevent labels from appearing when voice commands aren't actually functional. 

<br/>

### Label Text 

The SeeItSayItLabelEnabler also sets the text of the label to reflect the button's speech recognition keyword. This keyword can be modified through the `SpeechRecognitionKeyword` property under `Advanced StatefulInteractable Settings` in the `PressableButton` component. 

<br/>

### Position
You may also choose to reposition the label relative to a chosen transform by setting `PositionControl` on the SeeItSayItLabelEnabler. Note that if you are repositioning a canvas label, PositionControl should be a RectTransform. 

<br/>

### Animation Effect
When the labels are enabled, they will appear when a button is actively hovered. This is accomplished using a `StateVisualizer`, which plays an animation effect when the button Interactable is actively hovered.