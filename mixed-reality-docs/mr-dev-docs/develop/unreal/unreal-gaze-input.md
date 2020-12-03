---
title: Gaze Input in Unreal
description: Tutorial on setting up gaze input for HoloLens and Unreal Engine
author: hferrone
ms.author: jacksonf
ms.date: 06/10/2020
ms.topic: article
keywords: Windows Mixed Reality, holograms, HoloLens 2, eye tracking, gaze input, head mounted display, Unreal engine, mixed reality headset, windows mixed reality headset, virtual reality headset
---


# Gaze Input

Gaze is used to indicate what the user is looking at.  This uses the eye tracking cameras on the device to find a ray in Unreal world space matching what the user is currently looking at.

## Enabling eye tracking

- In **Project Settings > HoloLens**, enable the **Gaze Input** capability:

![Screenshot of HoloLens project setting capabilities with gaze input highlighted](images/unreal-gaze-img-01.png)

- Create a new actor and add it to your scene

> [!NOTE] 
> HoloLens eye tracking in Unreal only has a single gaze ray for both eyes instead of the two rays needed for stereoscopic tracking, which is not supported.

## Using eye tracking

First check that the device supports eye tracking with the IsEyeTrackerConnected function.  If this returns true, call GetGazeData to find where the user’s eyes are looking at during the current frame:

![Blueprint of the Is Eye Tracking Connected function](images/unreal-gaze-img-02.png)

> [!NOTE]
> The fixation point and the confidence value are not available on HoloLens.

To find what the user is looking at, use the gaze origin and direction in a line trace.  The start of this vector is the gaze origin and the end is the origin plus the gaze direction multiplied by the desired distance:

![Blueprint of the Get Gaze Data function](images/unreal-gaze-img-03.png)

## Getting head orientation

Alternatively, the HMD rotation can be used to represent the direction of the user’s head.  This does not require the Gaze Input capability but won't give you any eye tracking information.  A reference to the blueprint must be added as the world context to get the correct output data:

> [!NOTE]
> Getting HMD Data is only available in Unreal 4.26 and onwards.

![Blueprint of the Get HMDData function](images/unreal-gaze-img-04.png)

## Using C++ 

- In your game’s build.cs file, add “EyeTracker” to the PublicDependencyModuleNames list:

```cpp
PublicDependencyModuleNames.AddRange(
    new string[] {
        "Core",
        "CoreUObject",
        "Engine",
        "InputCore",
        "EyeTracker"
});
```

- In “File/ New C++ Class”, Create a new C++ actor called “EyeTracker”
    - A Visual Studio solution will open to the new EyeTracker class. Build and run to open the Unreal game with the new EyeTracker actor.  Search for “EyeTracker” in the “Place Actors” window.  Drag and drop this class into the game window to add it to the project:

![Screenshot of an actor with the place actor window open](images/unreal-gaze-img-06.png)

- In EyeTracker.cpp, add includes for EyeTrackerFunctionLibrary, and DrawDebugHelpers:

```cpp
#include "EyeTrackerFunctionLibrary.h"
#include "DrawDebugHelpers.h"
```

In Tick, check that the device supports eye tracking with UEyeTrackerFunctionLibrary::IsEyeTrackerConnected.  Then find the start and end of a ray for a line trace from UEyeTrackerFunctionLibrary::GetGazeData:

```cpp
void AEyeTracker::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);

    if(UEyeTrackerFunctionLibrary::IsEyeTrackerConnected())
    {
        FEyeTrackerGazeData GazeData;
        if(UEyeTrackerFunctionLibrary::GetGazeData(GazeData))
        {
            FVector Start = GazeData.GazeOrigin;
            FVector End = GazeData.GazeOrigin + GazeData.GazeDirection * 100;

            FHitResult Hit Result;
            if (GWorld->LineTraceSingleByChannel(HitResult, Start, End, ECollisionChannel::ECC_Visiblity))
            {
                DrawDebugCoordinateSystem(GWorld, HitResult.Location, FQuat::Identity.Rotator(), 10);
            }
        }
    }
}
```

## Next Development Checkpoint

If you're following the Unreal development checkpoint journey we've laid out, you're in the midst of exploring the MRTK core building blocks. From here, you can proceed to the next building block: 

> [!div class="nextstepaction"]
> [Hand tracking](unreal-hand-tracking.md)

Or jump to Mixed Reality platform capabilities and APIs:

> [!div class="nextstepaction"]
> [HoloLens camera](unreal-hololens-camera.md)

You can always go back to the [Unreal development checkpoints](unreal-development-overview.md#2-core-building-blocks) at any time.

## See also
* [Calibration](../../calibration.md)
* [Comfort](../../design/comfort.md)
* [Gaze and commit](../../design/gaze-and-commit.md)
* [Voice input](../../out-of-scope/voice-design.md)
