---
title: Hologram stability
description: The HoloLens automatically stabilize holograms, but there are steps developers can take to improve hologram stability further.
author: thetuvix
ms.author: alexturn
ms.date: 07/08/2020
ms.topic: article
keywords: holograms, stability, hololens, mixed reality headset, windows mixed reality headset, virtual reality headset, frame rate, rendering, reprojection, color separation
appliesto:
    - HoloLens
---

# Hologram stability

To achieve stable holograms, HoloLens has a built-in image stabilization pipeline. The stabilization pipeline works automatically in the background, so you don't need to take any extra steps to enable it. However, you should exercise techniques that improve hologram stability and avoid scenarios that reduce stability.

## Hologram quality terminology

The quality of holograms is a result of good environment and good app development. Apps running at a constant 60 frames-per-second in an environment where HoloLens can track the surroundings ensures the hologram and the matching coordinate system are in sync. From a user's perspective, holograms that are meant to be stationary won't move relative to the environment.

The following terminology can help you when you're identifying problems with the environment, inconsistent or low rendering rates, or anything else.
* **Accuracy.** Once the hologram is world-locked and placed in the real world, it should stay where it's placed relative to the surrounding environment and independent of user motion or small and sparse environment changes. If a hologram later appears in an unexpected location, it's an *accuracy* problem. Such scenarios can happen if two distinct rooms look identical.
* **Jitter.** Users observe jitter as high frequency shaking of a hologram, which can happen when tracking of the environment degrades. For users, the solution is running [sensor tuning](/hololens/hololens-updates).
* **Judder.** Low rendering frequencies result in uneven motion and double images of holograms. Judder is especially noticeable in holograms with motion. Developers need to maintain a [constant 60 FPS](hologram-stability.md#frame-rate).
* **Drift.** Users see drift as a hologram appears to move away from where it was originally placed. Drift happens when you place holograms far away from [spatial anchors](../../design/spatial-anchors.md), particularly in unmapped parts of the environment. Creating holograms close to spatial anchors lowers the likelihood of drift.
* **Jumpiness.** When a hologram "pops" or "jumps" away from its location occasionally. Jumpiness can occur as tracking adjusts holograms to match updated understanding of your environment.
* **Swim.** When a hologram appears to sway corresponding to the motion of the user's head. Swim occurs when the application hasn't fully implemented [reprojection](hologram-stability.md#reprojection), and if the HoloLens isn't [calibrated](/hololens/hololens-calibration) for the current user. The user can rerun the [calibration](/hololens/hololens-calibration) application to fix the issue. Developers can update the stabilization plane to further enhance stability.
* **Color separation.** The displays in HoloLens are color sequential displays, which flash color channels of red-green-blue-green at 60 Hz (individual color fields are shown at 240 Hz). Whenever a user tracks a moving hologram with their eyes, that hologram's leading and trailing edges separate in their constituent colors, producing a rainbow effect. The degree of separation is dependent upon the speed of the hologram. In some rarer cases, moving ones head rapidly while looking at a stationary hologram can also result in a rainbow effect, which is called *[color separation](hologram-stability.md#color-separation)*.

## Frame rate

Frame rate is the first pillar of hologram stability. For holograms to appear stable in the world, each image presented to the user must have the holograms drawn in the correct spot. The displays on HoloLens refresh 240 times a second, showing four separate color fields for each newly rendered image, resulting in a user experience of 60 FPS (frames per second). To provide the best experience possible, application developers must maintain 60 FPS, which translates to consistently providing a new image to the operating system every 16 milliseconds.

**60 FPS**
 To draw holograms to look like they're sitting in the real world, HoloLens needs to render images from the user's position. Since image rendering takes time, HoloLens predicts where a user's head will be when the images are shown in the displays. However, this prediction algorithm is an approximation. HoloLens has hardware that adjusts the rendered image to account for the discrepancy between the predicted head position and the actual head position. The adjustment makes the image the user sees appear as if it's rendered from the correct location, and holograms feel stable. The image updates work best with small changes, and it can't completely fix certain things in the rendered image like motion-parallax.

By rendering at 60 FPS, you're doing three things to help make stable holograms:
1. Minimizing the overall latency between rendering an image and that image being seen by the user. In an engine with a game and a render thread running in lockstep, running at 30FPS can add 33.3 ms of extra latency. Reducing latency decreases prediction error and increases hologram stability.
2. Making it so every image reaching the user's eyes have a consistent amount of latency. If you render at 30 fps, the display still displays images at 60 FPS, meaning the same image will be displayed twice in a row. The second frame will have 16.6-ms more latency than the first frame and will have to correct a more pronounced amount of error. This inconsistency in error magnitude can cause unwanted 60 Hz judder.
3. Reducing the appearance of judder, which is characterized by uneven motion and double images. Faster hologram motion and lower render rates are associated with more pronounced judder. Striving to maintain 60 FPS at all times will help avoid judder for a given moving hologram.

**Frame-rate consistency**
 Frame rate consistency is as important as a high frames-per-second. Occasionally dropped frames are inevitable for any content-rich application, and the HoloLens implements some sophisticated algorithms to recover from occasional glitches. However, a constantly fluctuating framerate is a lot more noticeable to a user than running consistently at lower frame rates. For example, an application that renders smoothly for five frames (60 FPS for the duration of these five frames) and then drops every other frame for the next 10 frames (30 FPS for the duration of these 10 frames) will appear more unstable than an application that consistently renders at 30 FPS.

On a related note, the operating system throttles down applications to 30 FPS when [mixed reality capture](/hololens/holographic-photos-and-videos) is running.

**Performance analysis**
 There are different kinds of tools that can be used to benchmark your application frame rate, such as:
* GPUView
* Visual Studio Graphics Debugger
* Profilers built into 3D engines such as Unity

## Hologram render distances

>[!VIDEO https://www.youtube.com/embed/-606oZKLa_s]

The human visual system integrates multiple distance-dependent signals when it fixates and focuses on an object.
* [Accommodation](https://en.wikipedia.org/wiki/Accommodation_%28eye%29) - The focus of an individual eye.
* [Convergence](https://en.wikipedia.org/wiki/Convergence_(eye)) - Two eyes moving inward or outward to center on an object.
* [Binocular vision](https://en.wikipedia.org/wiki/Stereopsis) - Disparities between the left- and right-eye images that are dependent on an object's distance away from your fixation point.
* Shading, relative angular size, and other monocular (single eye) cues.

Convergence and accommodation are unique because their extra-retinal cues related to how the eyes change to perceive objects at different distances. In natural viewing, convergence and accommodation are linked. When the eyes view something near (for example, your nose), the eyes cross and accommodate to a near point. When the eyes view something at infinity, the eyes become parallel and the eye accommodates to infinity. 

Users wearing HoloLens will always accommodate to 2.0 m to maintain a clear image because the HoloLens displays are fixed at an optical distance approximately 2.0 m away from the user. App developers control where users' eyes converge by placing content and holograms at various depths. When users accommodate and converge to different distances, the natural link between the two cues is broken, which can lead to visual discomfort or fatigue, especially when the magnitude of the conflict is large. 

Discomfort from the vergence-accommodation conflict can be avoided or minimized by keeping converged content as close to 2.0 m as possible (that is, in a scene with lots of depth place the areas of interest near 2.0 m, when possible). When content can't be placed near 2.0 m, discomfort from the vergence-accommodation conflict is greatest when user’s gaze back and forth between different distances. In other words, it's much more comfortable to look at a stationary hologram that stays 50 cm away than to look at a hologram 50 cm away that moves toward and away from you over time.

Placing content at 2.0 m is also advantageous because the two displays are designed to fully overlap at this distance. For images placed off this plane, as they move off the side of the holographic frame they'll appear from one display while still being visible on the other. This binocular rivalry can be disruptive to the depth perception of the hologram.

**Optimal distance for placing holograms from the user**

![Optimal distance for placing holograms from the user](images/distanceguiderendering-750px.png)

**Clip Planes**
 For maximum comfort, we recommend clipping render distance at 85 cm with fade out of content starting at 1 m. In applications where holograms and users are both stationary, holograms can be viewed comfortably as near as 50 cm. In those cases, applications should place a clip plane no closer than 30 cm and fade out should start at least 10 cm away from the clip plane. Whenever content is closer than 85 cm, it's important to ensure that users don't frequently move closer or farther from holograms or that holograms don't frequently move closer to or farther from the user as these situations are most likely to cause discomfort from the vergence-accommodation conflict. Content should be designed to minimize the need for interaction closer than 85 cm from the user, but when content must be rendered closer than 85 cm, a good rule of thumb for developers is to design scenarios where users and/or holograms don't move in depth more than 25% of the time.

**Best practices**
 When holograms can't be placed at 2 m and conflicts between convergence and accommodation can't be avoided, the optimal zone for hologram placement is between 1.25 m and 5 m. In every case, designers should structure content to encourage users to interact 1+ m away (for example, adjust content size and default placement parameters).

## Reprojection
HoloLens has a sophisticated hardware-assisted holographic stabilization technique known as reprojection. Reprojection takes into account motion and change of the point of view (CameraPose) as the scene animates and the user moves their head.  Applications need to take specific actions to best use reprojection.


There are four main types of reprojection
* **Depth Reprojection:**  Produces the best results with the least amount of effort from the application.  All parts of the rendered scene are independently stabilized based on their distance from the user.  Some rendering artifacts may be visible where there are sharp changes in depth.  This option is only available on HoloLens 2 and Immersive Headsets.
* **Planar Reprojection:**  Allows the application precise control over stabilization.  A plane is set by the application and everything on that plane will be the most stable part of the scene.  The further a hologram is away from the plane, the less stable it will be.  This option is available on all Windows MR platforms.
* **Automatic Planar Reprojection:**  The system sets a stabilization plane using information in the depth buffer.  This option is available on HoloLens generation 1 and HoloLens 2.
* **None:** If the application does nothing, Planar Reprojection is used with the stabilization plane fixed at 2 meters in the direction of the user's head gaze, usually producing substandard results.

Applications need to take specific actions to enable the different types of reprojection
* **Depth Reprojection:** The application submits their depth buffer to the system for every rendered frame.  On Unity, Depth Reprojection is done with the **Shared Depth Buffer** option in the **Windows Mixed Reality Settings** pane under **XR Plugin Management**.  DirectX apps call CommitDirect3D11DepthBuffer.  The application shouldn't call SetFocusPoint.
* **Planar Reprojection:** On every frame, applications tell the system the location of a plane to stabilize.  Unity applications call SetFocusPointForFrame and should have **Shared Depth Buffer** disabled.  DirectX apps call SetFocusPoint and shouldn't call CommitDirect3D11DepthBuffer.
* **Automatic Planar Reprojection:** To enable, the application needs to submit their depth buffer to the system as they would for Depth Reprojection. Apps using the Mixed Reality Toolkit (MRTK) can configure the [camera settings provider](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/CameraSystem/WindowsMixedRealityCameraSettings.html#hololens-2-reprojection-method) to use AutoPlanar Reprojection. Native apps should set the `DepthReprojectionMode` in the [HolographicCameraRenderingParameters](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters) to `AutoPlanar` each frame. For HoloLens generation 1, the application should not call SetFocusPoint.

### Choosing Reprojection Technique

Stabilization Type |	Immersive Headsets |	HoloLens generation 1 |	HoloLens 2
--- | --- | --- | ---
Depth Reprojection |	Recommended |	N/A |	Recommended<br/><br/>Unity applications must use Unity 2018.4.12 or later or Unity 2019.3 or later. Otherwise use Automatic Planar Reprojection.
Automatic Planar Reprojection |	N/A |	Recommended default |	Recommended if Depth Reprojection isn't giving the best results<br/><br/>Unity applications are recommended to use Unity 2018.4.12 or later or Unity 2019.3 or later.  Previous Unity versions will work with slightly degraded reprojection results.
Planar Reprojection |	Not Recommended |	Recommended if Automatic Planar isn't giving the best results |	Use if neither of the depth options give desired results	

### Verifying Depth is Set Correctly
			
When a reprojection method uses the depth buffer, it's important to verify the contents of the depth buffer represent the application's rendered scene.  A number of factors can cause problems. If there's a second camera used to render user interface overlays, for example, it's likely to overwrite all the depth information from the actual view.  Transparent objects often don't set depth.  Some text rendering won't set depth by default.  There will be visible glitches in the rendering when depth doesn't match the rendered holograms.
			
HoloLens 2 has a visualizer to show where depth is and isn't being set, which can be enabled from Device Portal.  On the **Views** > **Hologram Stability** tab, select the **Display depth visualization in headset** checkbox.  Areas that have depth set properly will be blue.  Rendered items that don't have depth set are marked in red and need to be fixed.  

> [!NOTE]
> The visualization of the depth will not show up in Mixed Reality Capture.  It is only visible through the device.
			
Some GPU viewing tools will allow visualization of the depth buffer.  Application developers can use these tools to make sure depth is being set properly.  Consult the documentation for the application's tools.

### Using Planar Reprojection
> [!NOTE]
> For desktop immersive headsets, setting a stabilization plane is usually counter-productive, as it offers less visual quality than providing your app's depth buffer to the system to enable per-pixel depth-based reprojection. Unless running on a HoloLens, you should generally avoid setting the stabilization plane.

![Stabilization plane for 3D objects](images/stab-plane-500px.jpg)

The device will automatically attempt to choose this plane, but the application should assist by selecting the focus point in the scene. Unity apps running on a HoloLens should choose the best focus point based on your scene and pass it into [SetFocusPoint()](../unity/focus-point-in-unity.md). An example of setting the focus point in DirectX is included in the default spinning cube template.

Unity will submit your depth buffer to Windows to enable per-pixel reprojection when you run your app on an immersive headset connected to a desktop PC, which provides even better image quality without explicit work by the app. You should only provide a Focus Point when your app is running on a HoloLens, or the per-pixel reprojection will be overridden.


```cs
// SetFocusPoint informs the system about a specific point in your scene to
// prioritize for image stabilization. The focus point is set independently
// for each holographic camera.
// You should set the focus point near the content that the user is looking at.
// In this example, we put the focus point at the center of the sample hologram,
// since that is the only hologram available for the user to focus on.
// You can also set the relative velocity and facing of that content; the sample
// hologram is at a fixed point so we only need to indicate its position.
renderingParameters.SetFocusPoint(
    currentCoordinateSystem,
    spinningCubeRenderer.Position
    );
```

Placement of the focus point largely depends on what the hologram is looking at. The app has the gaze vector for reference and the app designer knows what content they want the user to observe.

The single most important thing a developer can do to stabilize holograms is to render at 60 FPS. Dropping below 60 FPS will dramatically reduce hologram stability, whatever the stabilization plane optimization.

**Best practices**
 There's no universal way to set up the stabilization plane and it's app-specific. Our main recommendation is to experiment and see what works best for your scenario. However, try to align the stabilization plane with as much content as possible because all the content on this plane is perfectly stabilized.

For example:
* If you have only planar content (reading app, video playback app), align the stabilization plane with the plane that has your content.
* If there are three small spheres that are world-locked, make the stabilization plane "cut" though the centers of all the spheres that are currently in the user's view.
* If your scene has content at substantially different depths, favor further objects.
* Make sure to adjust the stabilization point every frame to coincide with the hologram the user is looking at

**Things to Avoid**
 The stabilization plane is a great tool to achieve stable holograms, but if misused it can result in severe image instability.
* Don't "fire and forget". You can end up with the stabilization plane behind the user or attached to an object that is no longer in the user's view. Ensure the stabilization plane normal is set opposite camera-forward (for example, -camera.forward)
* Don't rapidly change the stabilization plane back and forth between extremes
* Don't leave the stabilization plane set to a fixed distance/orientation
* Don't let the stabilization plane cut through the user
* Don't set the focus point when running on a desktop PC rather than a HoloLens, and instead rely on per-pixel depth-based reprojection.

## Color separation 

Because of the nature of HoloLens displays, an artifact called "color-separation" can sometimes be perceived. It manifests as the image separating into individual base colors - red, green, and blue. The artifact can be especially visible when displaying white objects, since they have large amounts of red, green, and blue. It's most pronounced when a user visually tracks a hologram that is moving across the holographic frame at high speed. Another way the artifact can manifest is warping/deformation of objects. If an object has high contrast and/or pure colors such as red, green, blue, color-separation will be perceived as warping of different parts of the object.

**Example of what the color separation of a head-locked white round cursor could look like as a user rotates their head to the side:**

![Example of what the color separation of a head-locked white round cursor could look like as a user rotates their head to the side.](images/colorseparationofroundwhitecursor-300px.png)

Though it's difficult to completely avoid color separation, there are several techniques available to mitigate it.

**Color-separation can be seen on:**
* Objects that are moving quickly, including head-locked objects such as the [cursor](../../design/cursors.md).
* Objects that are substantially far from the [stabilization plane](hologram-stability.md#reprojection).

**To attenuate the effects of color-separation:**
* Make the object lag the user's gaze. It should appear as if it has some inertia and is attached to the gaze "on springs". This approach slows the cursor (reducing separation distance) and puts it behind the user's likely gaze point. So long as it quickly catches up when the user stops shifting their gaze it feels natural.
* If you do want to move a hologram, try to keep its movement speed below 5 degrees/second if you expect the user to follow it with their eyes.
* Use *light* instead of *geometry* for the cursor. A source of virtual illumination attached to the gaze will be perceived as an interactive pointer but won't cause color-separation.
* Adjust the stabilization plane to match the holograms the user is gazing at.
* Make the object red, green, or blue.
* Switch to a blurred version of the content. For example, a round white cursor could be changed to a slightly blurred line oriented in the direction of motion.

As before, rendering at 60 FPS and setting the stabilization plane are the most important techniques for hologram stability. If facing noticeable color separation, first make sure the frame rate meets expectations.

## See also
* [Understanding Performance for Mixed Reality](understanding-performance-for-mixed-reality.md)
* [Color, light, and materials](../../design/color-light-and-materials.md)
* [Instinctual interactions](../../design/interaction-fundamentals.md)
* [MRTK Hologram Stabilization](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/hologram-stabilization.html)