---
title: Spatial audio tutorials - 4. Enabling and disabling spatial audio at run time
description: Use a button to enable and disable spatialization of audio at run time.
author: kegodin
ms.author: v-hferrone
ms.date: 02/05/2021
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens2, spatial audio, MRTK, mixed reality toolkit, UWP, Windows 10, HRTF, head-related transfer function, reverb, Microsoft Spatializer
---

# 4. Enabling and disabling spatialization at run time

## Overview

In this tutorial, you will learn how to Enable and disable spatialization at run time and test this in the unity editor and HoloLens 2.

## Objectives

* Add a new script to control spatialization on a game object
* Drive the spatialization control script from button actions

## Add spatialization control script

 Right-click in the Project window and choose **Create** > **C# Script** to create a new C# script, enter a suitable name for the script, for example, _SpatializeOnOff_:

![Create script](images/spatial-audio/spatial-audio-04-section1-step1-1.png)

Double-click the script in the Project window to open it in Visual Studio. Replace the default script contents with the following:

> [!NOTE]
> Several lines of the script are commented out. These lines will be uncommented in [Next Chapter: Using reverb to add distance to spatial audio](unity-spatial-audio-ch5.md).

```c#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Audio;

[RequireComponent(typeof(AudioSource))]
public class SpatializeOnOff : MonoBehaviour
{
    public GameObject ButtonTextObject;
    //public AudioMixerGroup RoomEffectGroup;
    //public AudioMixerGroup MasterGroup;

    private AudioSource m_SourceObject;
    private bool m_IsSpatialized;
    private TMPro.TextMeshPro m_TextMeshPro;

    public void Start()
    {
        m_SourceObject = gameObject.GetComponent<AudioSource>();
        m_TextMeshPro = ButtonTextObject.GetComponent<TMPro.TextMeshPro>();
        SetSpatialized();
    }

    public void SwapSpatialization()
    {
        if (m_IsSpatialized)
        {
            SetStereo();
        }
        else
        {
            SetSpatialized();
        }
    }

    private void SetSpatialized()
    {
        m_IsSpatialized = true;
        m_SourceObject.spatialBlend = 1;
        m_TextMeshPro.SetText("Set Stereo");
        //m_SourceObject.outputAudioMixerGroup = RoomEffectGroup;
    }

    private void SetStereo()
    {
        m_IsSpatialized = false;
        m_SourceObject.spatialBlend = 0;
        m_TextMeshPro.SetText("Set Spatialized");
        //m_SourceObject.outputAudioMixerGroup = MasterGroup;
    }

}
```

> [!NOTE]
> To enable or disable the spatialization, the script only adjusts the **spatialBlend** property, leaving the **spatialization** property enabled. In this mode, Unity still applies the **Volume** curve. Otherwise, if the user were to disable spatialization when far from the source, they would hear the volume increase abruptly.
> If you prefer to fully disable spatialization, modify the script to also adjust the **spatialization** boolean property of the **SourceObject** variable.

## Attach your script and drive it from the button

Select **Quad** in the Hierarchy and in the Inspector window, use the Add Component button to add **SpatializeOnOff(Script)**

![Add script to quad](images/spatial-audio/spatial-audio-04-section2-step1-1.png)

In the Hierarchy locate **PressableButtonHoloLens2** > **IconAndText** > **TextMeshPro**.

With the **Quad** object still selected in the Hierarchy, in the Inspector window, locate the **Spatialize On Off (Script)** component and Drag and drop **TextMeshPro** Component of the PressableButtonHoloLens2.

![Find the PressableButtonHoloLens2 object in the hierarchy](images/spatial-audio/spatial-audio-04-section2-step1-2.png)

To set the button to call the **SpatializeOnOff** script when the button is released You need to configure interactable script.

In the Hierarchy window, select the **PressableButtonHoloLens2**. In the Inspector window, locate the **Interactable (Script)** component and click on + icon under OnClick () event.

* With the **PressableButtonHoloLens2** object still selected in the Hierarchy window, click-and-drag the **Quad** object from the Hierarchy window into the empty **None (Object)** field of the event you just added to make the ButtonParent object listen for button click event from this button:

* Click the **No Function** dropdown of the same event. Then select **SpatializeOnOff** > **SwapSpatialization ()** to turn on and off the Spatial audio

![Button action settings](images/spatial-audio/spatial-audio-04-section2-step1-3.png)

## Congratulations

In this tutorial, you have learned how to enable and disable spatialization at run time, test out the app on a HoloLens 2 or in the Unity editor. In the app, you can now click the button to activate and deactivate spatialization of the audio.

In the next tutorial you'll add a reverb effect to give sounds a sense of distance.

> [!TIP]
> For a reminder on how to build and deploy your Unity project to HoloLens 2, you can refer to the [Building your app to your HoloLens 2](mr-learning-base-02.md#building-your-application-to-your-hololens-2) instructions.

> [!div class="nextstepaction"]
> [Next Tutorial: 5. Using reverb to add distance to spatial audio](unity-spatial-audio-ch5.md)
