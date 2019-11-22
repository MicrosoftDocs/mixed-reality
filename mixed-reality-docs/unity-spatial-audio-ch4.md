---
title: Spatial audio tutorials - 4. Enabling and disabling spatial audio at run time
description: Use a button to enable and disable spatialization of audio at run time.
author: kegodin
ms.author: kegodin
ms.date: 12/01/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens2, spatial audio
---

# Enabling and disabling spatial audio at run time

## Objectives
In this chapter, you'll:
* Add a new script to control spatialization on a game object
* Drive the spatialization control script from button actions

## Add a new script to control spatialization on a game object
Right-click in the **Project** pane and create a new C# script by choosing **Create -> C# Script**. Name your script "SpatializeOnOff".

![Create script](images/spatial-audio/create-script.png)

Double-click the script in the **Project** pane to open it in Visual Studio. Replace the default script contents with the following:

```c#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Audio;

public class SpatializeOnOff : MonoBehaviour
{
    public AudioSource SourceObject;
    public GameObject Button;
    //public AudioMixerGroup RoomEffectGroup;
    //public AudioMixerGroup MasterGroup;

    private bool m_IsSpatialized;
    private TMPro.TextMeshPro m_TextMeshPro;

    public void Start()
    {
        m_TextMeshPro = Button.GetComponent<TMPro.TextMeshPro>();
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
        SourceObject.spatialBlend = 1;
        m_TextMeshPro.SetText("Set Stereo");
        //SourceObject.outputAudioMixerGroup = RoomEffectGroup;
    }

    private void SetStereo()
    {
        m_IsSpatialized = false;
        SourceObject.spatialBlend = 0;
        m_TextMeshPro.SetText("Set Spatialized");
        //SourceObject.outputAudioMixerGroup = MasterGroup;
    }

}
```
> [!NOTE]
> Several lines of the script are commented out. These lines will be uncommented in [Chapter 5](unity-spatial-audio-ch5.md).

> [!NOTE]
> To enable or disable spatialization, the script only adjusts the **spatialBlend** property, leaving the **spatialization** property enabled. In this mode, Unity still applies the **Volume** curve. Otherwise, if the user were to disable spatialization when far from the source, they would hear the volume increase abruptly. <br>
> If you prefer to fully disable spatialization, modify the script to also adjust the **spatialization** boolean property of the **SourceObject** variable.

## Attach your script and drive it from the button
On the **Inspector** pane of the **Quad**, click **Add Component** and add the **Spatialize On Off** script:

![Add script to quad](images/spatial-audio/add-script-to-quad.png)

On the **Spatialize On Off** component of the **Quad**:
1. Set the **Source Object** property to the **Quad**
2. Find the **PressableButtonHoloLens2 -> IconAndText -> TextMeshPro** subobject in the **Hierarchy**, and drag it onto the **Button** field of the **Spatialize On Off** component

After these changes, the **Spatialize On Off** component of the **Quad** will look like this:

![Spatialize script ch3](images/spatial-audio/spatialize-script-ch3.png)

Set the button to call the **Spatialize On Off** script when the button is released. In the **Inspector** pane of the **PressableButtonHoloLens2** object, find the **Pressable Button Holo Lens 2** component, and:
1. Click the + icon under the **Button Released** section to add an action.
2. Drag the **Quad** from the **Hierarchy** into the target object slot.
3. Select **SpatializeOnOff.SwapSpatialization** from the action drop-down box.

After these changes, the **Pressable Button Holo Lens 2** component will look like this:

![Button action settings](images/spatial-audio/button-action-settings.png)

## Next steps
Try out your app on a HoloLens 2 or in the Unity editor. In the app, you can now touch the button to activate and deactivate spatialization on the video. If testing in the Unity editor, press the space bar and scroll with the scroll wheel to activate hand simulation. 

Continue on to [Chapter 5](unity-spatial-audio-ch5.md) to add perceived distance to sound sources using reverb.

