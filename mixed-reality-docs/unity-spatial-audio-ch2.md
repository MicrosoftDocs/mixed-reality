---
title: Spatial audio tutorials - 2. Spatializing button interaction sounds
description: Add a button to your project, and spatialize the button interaction sounds.
author: kegodin
ms.author: kegodin
ms.date: 12/01/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens2, spatial audio
---

# Spatializing button interaction sounds

## Objectives
In this chapter of the spatial audio module of the HoloLens 2 tutorials, you'll:
* Add a button
* Spatialize the button click sounds

## Add a button
In the **Project** pane, select **Assets** and type "PressableButtonHoloLens2" in the search bar:

![Button prefab in Assets](images/spatial-audio/button-prefab-in-assets.png)

The button prefab is the entry represented by a blue icon, rather than a white icon. Drag the prefab named **PressableButtonHoloLens2** into your hierarchy. In the **Inspector** pane for your new button, set the **Position** property to (0,-0.4,2) so that it will appear in front of the user when the application starts. The **Transform** component of the button will look like this:

![Button transform](images/spatial-audio/button-transform.png)

## Enable and spatialize audio feedback for button interactions
In this step, you'll spatialize the audio feedback for the button. For related design suggestions, see https://docs.microsoft.com/en-us/windows/mixed-reality/spatial-sound-design. 

The **Audio Mixer** pane is where you'll define destinations, called **Mixer Groups**, for audio playback from **Audio Source** components. 
* Open the **Audio Mixer** pane from the menu bar using **Window -> Audio -> Audio Mixer**
* Create a **Mixer** by clicking the '+' next to **Mixers**. The new mixer will include a default **Group** called **Master**.

Your **Mixer** pane will now look like this:

![Mixer panel with first mixer](images/spatial-audio/mixer-panel-with-first-mixer.png)

Click the **PressableButtonHoloLens2** in your **Hierarchy**. In the **Inspector** pane:
1. Find the **Audio Source** component
2. For the **Output** property, click the selector and choose your mixer
3. Check the **Spatialize** checkbox
4. Move the **Spatial Blend** slider to 3D (1).

After these changes, the **Audio Source** component of your **PressableButtonHoloLens2** will look like this:

![Button audio source](images/spatial-audio/button-audio-source.png)

Unity includes a **Volume** curve under the **3D Sound Settings** section of the **Audio Source** properties on the **Inspector** pane. This is used to make sounds quieter when the source is farther from the listener. We recommend disabling this for UI interaction sounds such as button clicks; see [spatial sound design](spatial-sound-design.md) for more details.

Adjust these settings on the **Audio Source** of the **PressableButtonHoloLens2**:
1. Set the **Volume Rolloff** property to Linear
2. Drag the endpoint on the **Volume** curve (the red curve) from '0' on the y axis up to '1'
3. Adjust the shape of the **Volume** curve to be flat across the entire X axis

After these changes, the **3D Sound Settings** section of the **Audio Source** properties of the **PressableButtonHoloLens2** will look like this:

![Button 3D sound settings](images/spatial-audio/button-3d-sound-settings.png)

## Next steps

Try out your app on a HoloLens 2 or in the Unity editor. In the app, you can touch the button and hear the spatialized button interaction sounds. If testing in the Unity editor, press the space bar and scroll with the scroll wheel to activate hand simulation.

Continue to [Chapter 3](unity-spatial-audio-ch3.md) to add a video and spatialize the audio from the video.

