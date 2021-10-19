---
title: App quality criteria
description: This document describes the top factors impacting the quality of mixed reality apps.
author: cjdgit
ms.author: crderr
ms.date: 03/21/2018
ms.topic: article
keywords: app quality criteria, mixed reality, mixed reality app, mixed reality headset, windows mixed reality headset, virtual reality headset
---


# App quality criteria overview

This document describes the top factors impacting the quality of mixed reality apps. For each factor, the following information is provided
* Overview – a brief description of the quality factor and why it's important.
* Device impact - which type of Window Mixed Reality device is affected.
* Quality criteria – how to evaluate the quality factor.
* How to measure – methods to measure (or experience) the issue.
* Recommendations – summary of approaches to provide a better user experience.
* Resources – relevant developer and design resources that are useful to create better app experiences.

## Frame rate

Frame rate is the first pillar of hologram stability and user comfort. Frame rate below the recommended targets can cause holograms to appear jittery, negatively impacting the believability of the experience and potentially causing eye fatigue. The target frame rate for your experience on Windows Mixed Reality immersive headsets is either 60 Hz or 90 Hz depending on which Windows Mixed Reality Compatible PCs you're supporting. For HoloLens, the target frame rate is 60 Hz.

### Device impact

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
        <td></td>
    </tr>
     <tr>
        <td>✔️</td>
        <td>✔️</td>
        <td></td>
    </tr>
</table>

### Quality criteria

|  Best  |  Meets |  Fail |
--- | --- | ---
| The app consistently meets frames per second (FPS) goal for target device: 60 fps on HoloLens; 90 fps on Ultra PCs; and 60 fps on mainstream PCs. | The app has intermittent frame drops not impeding the core experience, or FPS is consistently lower than desired goal but doesn’t impede the app experience. | The app is experiencing a drop in frame rate on average every 10 seconds or less. |

### How to measure

* A real-time frame rate graph is provided through by the [Windows Device Portal](using-the-windows-device-portal.md#system-performance) under "System Performance".
* For development debugging, add a frame rate diagnostic counter into the app. See Resources for a sample counter.
* Frame rate drops can be experienced in device while the app is running by moving your head from side to side. If the hologram shows unexpected jittery movement, then low frame rate or the stability plane is likely the cause.

### Recommendations

* Add a frame rate counter at the beginning of the development work.
* Changes that incur a drop in frame rate should be evaluated and appropriately resolved as a performance bug.

### Resources

#### Documentation

* [Understanding Performance for Mixed Reality](understanding-performance-for-mixed-reality.md)
* [Hologram stability and framerate](hologram-stability.md#frame-rate)
* [Asset performance budget](../../design/asset-creation-process.md)
* [Performance recommendations for Unity](../unity/performance-recommendations-for-unity.md)

#### Tools and tutorials

* [Mixed Reality Toolkit, FPS counter display](https://github.com/Microsoft/MixedRealityToolkit-Unity/blob/htk_release/Assets/HoloToolkit/Utilities/README.md)
* [Mixed Reality Toolkit, Shaders](https://github.com/Microsoft/MixedRealityToolkit-Unity/tree/htk_release/Assets/HoloToolkit/Utilities/Shaders)

#### External references

* [Unity, Optimizing mobile applications](https://www.youtube.com/watch?v=j4YAY36xjwE)

## Hologram stability

Stable holograms will increase the usability and believability of your app, and create a more comfortable viewing experience for the user. The quality of hologram stability is a result of good app development and the device's ability to understand (track) its environment. While frame rate is the first pillar of stability, other factors can impact stability including:

* Use of the stabilization plane
* Distance to spatial anchors
* Tracking

### Device impact

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
        <td></td>
    </tr>
     <tr>
        <td>✔️</td>
        <td>❌</td>
        <td></td>
    </tr>
</table>

### Quality criteria

|  Best  |  Meets |  Fail |
--- | --- | ---
|  Holograms consistently appear stable. | Secondary content shows unexpected movement; or unexpected movement doesn't impede overall app experience. | Primary content in frame shows unexpected movement. |

### How to measure

While wearing the device and viewing the experience:

* Move your head from side to side. If the holograms show unexpected movement then low frame rate or improper alignment of the stability plane to the focal plane is the likely cause.
* Move around the holograms and environment, look for behaviors such as swim and jumpiness. This type of motion is likely caused by the device not tracking the environment, or the distance to the spatial anchor.
* If large or multiple holograms are in the frame, observe hologram behavior at various depths while moving your head position from side to side, if shakiness appears this is likely caused by the stabilization plane.

### Recommendations

* Add a frame rate counter at the beginning of the development work.
* Use the stabilization plane.
* Always render anchored holograms within 3 meters of their anchor.
* Make sure your environment is set up for proper tracking.
* Design your experience to avoid holograms at various focal depth levels within the frame.

### Resources

#### Documentation

* [Hologram stability and framerate](hologram-stability.md#frame-rate)
* [Understanding Performance for Mixed Reality](understanding-performance-for-mixed-reality.md)
* [Performance recommendations for Unity](../unity/performance-recommendations-for-unity.md)
* [Spatial anchors](../../design/spatial-anchors.md)
* [Handling tracking errors](../../design/coordinate-systems.md#handling-tracking-errors)
* [Stationary frame of reference](../../design/coordinate-systems.md#stationary-frame-of-reference)

#### Tools and tutorials

* [MR Companion Kit, Kinect IPD](https://github.com/Microsoft/MixedRealityCompanionKit/tree/master/KinectIPD)

## Holograms position on real surfaces

Misalignments of holograms with physical objects (if intended to be placed in relation to one another) are a clear indication of the non-union of holograms and real-world. Accuracy of the placement should be relative to the needs of the scenario; for example, general surface placement can use the spatial map, but more accurate placement will require some use of markers and calibration.

### Device impact

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
        <td></td>
    </tr>
     <tr>
        <td>✔️</td>
        <td>❌</td>
        <td></td>
    </tr>
</table>

### Quality criteria

|  Best  |  Meets |  Fail |
--- | --- | ---
| Holograms align to the surface typically in the centimeters to inches range. If you need more accuracy, the app should provide an efficient means for collaboration within the app spec. | NA | The holograms appear unaligned with the physical target object by either breaking the surface plane or appearing to float away from the surface. If accuracy is required, Holograms should meet the proximity spec of the scenario. | 

### How to measure

* Holograms that are placed on spatial map shouldn't appear to dramatically float above or below the surface.
* Holograms that require accurate placement should have some form of marker and calibration system that is accurate to the scenario's requirement.

### Recommendations

* Spatial map is useful for placing objects on surfaces when precision isn’t required.
* For the best precision, use markers or posters to set the holograms and an Xbox controller (or some manual alignment mechanism) for final calibration.
* Consider breaking extra-large holograms into logical parts and aligning each part to the surface.
* Improperly set interpupillary distance (IPD) can also effect hologram alignment. Always configure HoloLens to the user's IPD.

### Resources

#### Documentation

* [Spatial mapping placement](../../design/spatial-mapping.md#placement)
* [Room scanning process](../../out-of-scope/case-study-expanding-the-spatial-mapping-capabilities-of-hololens.md)
* [Spatial anchors best practices](../../design/spatial-anchors.md#best-practices)
* [Handling tracking errors](../../design/coordinate-systems.md#handling-tracking-errors)
* [Spatial mapping in Unity](../unity/spatial-mapping-in-unity.md)
* [Vuforia development overview](../unity/vuforia-development-overview.md)

#### Tools and tutorials

* [MR Toolkit, Spatial Mapping Libraries](https://github.com/Microsoft/MixedRealityToolkit-Unity/blob/htk_release/Assets/HoloToolkit/SpatialMapping/README.md)
* [MR Companion Kit, Poster Calibration Sample](https://github.com/Microsoft/MixedRealityCompanionKit/tree/master/PosterCalibrationSample)
* [MR Companion Kit, Kinect IPD](https://github.com/Microsoft/MixedRealityCompanionKit/tree/master/KinectIPD)

#### External references

* [Lowes Case Study, Precision alignment](https://www.youtube.com/watch?v=LceMdyKZ4PI)

## Viewing zone of comfort

App developers control where users' eyes converge by placing content and holograms at various depths. Users wearing HoloLens will always accommodate to 2.0 m to maintain a clear image because HoloLens displays are fixed at an optical distance approximately 2.0 m away from the user. Improper content depth can lead to visual discomfort or fatigue.

### Device impact

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
        <td></td>
    </tr>
     <tr>
        <td>✔️</td>
        <td>❌</td>
        <td></td>
    </tr>
</table>

### Quality criteria

<table>
<tr>
<td> Best </td><td><ul>
<li>Place content at 2 m.</li><li>When holograms cannot be placed at 2 m and conflicts between convergence and accommodation cannot be avoided, the optimal zone for hologram placement is between 1.25 m and 5 m.</li><li>In every case, designers should structure content to encourage users to interact 1+ m away (e.g. adjust content size and default placement parameters).</li><li>Unless not required by the scenario, a clipping plane should be implement with fade out starting at 1 m.</li><li>In cases where closer observation of a motionless hologram is required, the content shouldn't be closer than 50 cm.</li>
</ul></td>
</tr><tr>
<td> Meets</td><td> Content is within the viewing and motion guidance, but improper use or no use of the clipping plane.</td>
</tr><tr>
<td> Fail </td><td> Content is presented too close (typically &lt;1.25 m, or &lt;50 cm for stationary holograms requiring closer observation.)</td>
</tr>
</table>

### How to measure

* Content should typically be 2 m away, but no closer than 1.25 or further than 5 m.
* With few exceptions, the HoloLens clipping render distance should be set to 85CM with fade out of content starting at 1 m. Approach the content and note the clipping plane effect.
* Stationary content should not be closer than 50 cm away.

### Recommendations

* Design content for the optimal viewing distance of 2 m.
* Set the clipping render distance to 85 cm with fade out of content starting at 1 m.
* For stationary holograms that need closer viewing, the clipping plane should be no closer than 30 cm and fade out should start at least 10 cm away from the clipping plane.

### Resources

* [Render distance](hologram-stability.md#hologram-render-distances)
* [Focus point in Unity](../unity/focus-point-in-unity.md)
* [Experimenting with scale](../../design/scale.md#experimenting-with-scale)
* [Text, Recommended font size](../../design/typography.md#recommended-font-size)

## Depth switching

Regardless of viewing zone of comfort issues, demands for the user to switch frequently or quickly between near and far focal objects (including holograms and real-world content) can lead to oculomotor fatigue, and general discomfort.

### Device impact

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
        <td></td>
    </tr>
     <tr>
        <td>✔️</td>
        <td>✔️</td>
        <td></td>
    </tr>
</table>

### Quality criteria

|  Best  |  Meets |  Fail |
--- | --- | ---
|  Limited or natural depth switching that doesn’t cause the user to unnaturally refocus. | Abrupt depth switch this is core and designed into the app experience, or abrupt depth switch that is caused by unexpected real-world content. | Consistent depth switch, or abrupt depth switching that isn’t necessary or core to the app experience. | 

### How to measure

* If the app requires the user to consistently and/or abruptly change depth focus, there is depth switching problem.

### Recommendations

* Keep primary content at a consistent focal plane and make sure the stabilization plane matches the focal plane. This will alleviate oculomotor fatigue and unexpected hologram movement.

### Resources

* [Render distance](hologram-stability.md#hologram-render-distances)
* [Focus point in Unity](../unity/focus-point-in-unity.md)

## Use of spatial sound

In Windows Mixed Reality, the audio engine provides the aural component of the mixed reality experience by simulating 3D sound using direction, distance, and environmental simulations. Using spatial sound in an application allows developers to convincingly place sounds in a 3-dimensional space (sphere) all around the user. Those sounds will then seem as if they were coming from real physical objects or the mixed reality holograms in the user's surroundings. Spatial sound is a powerful tool for immersion, accessibility, and UX design in mixed reality applications.

### Device impact

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
        <td></td>
    </tr>
     <tr>
        <td>✔️</td>
        <td>✔️</td>
        <td></td>
    </tr>
</table>

### Quality criteria

|  Best  |  Meets |  Fail |
--- | --- | ---
|  Sound is logically spatialized, and the UX appropriately uses sound to assist with object discovery and user feedback. Sound is natural and relevant to objects and normalized across the scenario. | Spatial audio is used appropriately for believability but missing as means to help with user feedback and discoverability. | Sound is not spatialized as expected, and/or lack of sound to assist user within the UX. Or spatial audio was not considered or used in the design of the scenario. | 

### How to measure

* In general, relevant sounds should emit from target holograms (eg., bark sound coming from holographic dog.)
* Sound cues should be used throughout the UX to assist the user with feedback or awareness of actions outside the holographic frame.

### Recommendations

* Use spatial audio to assist with object discovery and user interfaces.
* Real sounds work better than synthesize or unnatural sound.
* Most sounds should be spatialized.
* Avoid invisible emitters.
* Avoid spatial masking.
* Normalize all sounds.

### Resources

#### Documentation

* [Spatial sound](../../design/spatial-sound.md)
* [Spatial sound design](../../design/spatial-sound-design.md)
* [Spatial sound in Unity](../unity/spatial-sound-in-unity.md)
* [Case study, Spatial sound for HoloTour](../../design/case-study-spatial-sound-design-for-holotour.md)
* [Case study, Using spatial sound in RoboRaid](../../design/case-study-using-spatial-sound-in-roboraid.md)

#### Tools and tutorials

* [Mixed Reality Toolkit - Spatial Audio](https://github.com/Microsoft/MixedRealityToolkit-Unity/blob/htk_release/Assets/HoloToolkit/SpatialSound/README.md)

## Focus on holographic frame (FOV) boundaries

Well-designed user experiences can create and maintain useful context of the virtual environment that extends around the users. Mitigating the effect of the FOV boundaries involves a thoughtful design of content scale and context, use of spatial audio, guidance systems, and the user's position. If done right, the user will feel less impaired by the FOV boundaries while having a comfortable app experience.

### Device impact

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
        <td></td>
    </tr>
     <tr>
        <td>✔️</td>
        <td>❌</td>
        <td></td>
    </tr>
</table>

### Quality criteria

|  Best  |  Meets |  Fail |
--- | --- | ---
|  User never loses context and viewing is comfortable. Context assistance is provided for large objects. Discoverability and viewing guidance is provided for objects outside the frame. In general, motion design and scale of the holograms are appropriate for a comfortable viewing experience. | User never loses context, but extra neck motion may be required in limited situations. In limited situations scale causes holograms to break either the vertical or horizontal frame causing some neck motion to view holograms. | User likely to lose context and/or consistent neck motion is required to view holograms. No context guidance for large holographic objects, moving objects easy to lose outside the frame with no discoverability guidance, or tall holograms requires regular neck motion to view. | 

### How to measure

* Context for a (large) hologram is lost or not understood due to being clipped at the boundaries.
* Locations of holograms are hard to find due to the lack of attention directors or content that rapidly moves in and out of the holographic frame.
* Scenario requires regular and repetitive up and down head motion to fully see a hologram resulting in neck fatigue.

### Recommendations

* Start the experience with small objects that fit the FOV, then transition with visual cues to larger versions.
* Use spatial audio and attention directors to help the user find content that is outside the FOV.
* As much as possible, avoid holograms that vertically clip the FOV.
* Provide the user with in-app guidance for best viewing location.

### Resources

#### Documentation

* [Holographic frame](../../design/holographic-frame.md)
* [Case Study, HoloStudio UI and interaction design learnings](../../out-of-scope/case-study-3-holostudio-ui-and-interaction-design-learnings.md?#problem-2-modal-dialogs-are-sometimes-out-of-the-holographic-frame)
* [Scale of objects and environments](../../design/scale.md)
* [Cursors, Visual cues](../../design/cursors.md#visual-cues)

#### External references

* [Much ado about the FOV](https://www.linkedin.com/pulse/hololens-much-ado-field-of-view-michael-hoffman?lipi=urn%3Ali%3Apage%3Ad_flagship3_feed%3B6iQ%2FbTevLDU93w3I2ewLJw%3D%3D)

## Content reacts to user position

Holograms should react to the user position in roughly the same ways that "real" objects do. A notable design consideration is UI elements that can't necessarily assume a user's position is stationary and adapt to the user's motion. Designing an app that correctly adapts to user position will create a more believable experience and make it easier to use.

### Device impact

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
        <td></td>
    </tr>
     <tr>
        <td>✔️</td>
        <td>✔️</td>
        <td></td>
    </tr>
</table>

### Quality criteria

<table>
<tr>
<td> Best </td><td> Content and UI adapt to user positions allowing user to naturally interact with content within the scope of expected user movement.</td>
</tr><tr>
<td> Meets </td><td> UI adapts to the user position, but may impede the view of key content requiring the user to adjust their position.</td>
</tr><tr>
<td> Fail </td><td><ol>
<li>UI elements are lost or locked during movement causing user to unnaturally return to (or find) controls.</li><li>UI elements limit the view of primary content.</li><li>UI movement isn't optimized for viewing distance and momentum particularly with <a href="../../design/billboarding-and-tag-along.md">tag-along</a> UI elements.</li>
</ol></td>
</tr>
</table>

### How to measure

* All measurements should be done within a reasonable scope of the scenario. While user movement will vary, don’t try to trick the app with extreme user movement.
* For UI elements, relevant controls should be available regardless of user movement. For example, if the user is viewing and walking around a 3D map with zoom, the zoom control should be readily available to the user regardless of location.

### Recommendations

* The user is the camera and they control the movement. Let them drive.
* Consider billboarding for text and menuing systems that would otherwise be world-locked or obscured if a user were to move around.
* Use tag-along for content that needs to follow the user while still allowing the user to see what is in front of them.

### Resources

#### Documentation

* [Interaction design](../../discover/hologram.md)
* [Color, light, and material](../../design/color-light-and-materials.md)
* [Billboarding and tag-along](../../design/billboarding-and-tag-along.md)
* [Instinctual interactions](../../design/interaction-fundamentals.md)
* [Self-motion and user locomotion](../../design/comfort.md#self-motion-and-user-locomotion)

## Input interaction clarity

Input interaction clarity is critical to an app's usability and includes input consistency, approachability, discoverability of interaction methods. User can use platform-wide common interactions without relearning. If the app has custom input, it should be clearly communicated and demonstrated.

### Device impact

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
        <td></td>
    </tr>
     <tr>
        <td>✔️</td>
        <td>✔️</td>
        <td></td>
    </tr>
</table>

### Quality criteria

|  Best  |  Meets |  Fail |
--- | --- | ---
|  Input interaction methods are consistent with Windows Mixed Reality provided [guidance](../../design/interaction-fundamentals.md). Any custom input shouldn't be redundant with standard input (rather use standard interaction) and must be clearly communicated and demonstrated to the user. | Similar to best, but custom inputs are redundant with standard input methods. User can still achieve the goal and progress through the app experience. | Difficult to understand input method or button mapping. Input is heavily customized, doesn't support standard input, no instructions, or likely to cause fatigue and comfort issues. | 

### How to measure

* The app uses consistent [standard input methods.](../../design/interaction-fundamentals.md)
* If the app has custom input, it's clearly communicated through:
* First-run experience
* Introductory screens
* Tooltips
* Hand coach
* Help section
* Voice over

### Recommendations

* Use standard input methods whenever possible.
* Provide demonstrations, tutorials, and tooltips for non-standard input methods.
* Use a consistent interaction model throughout the app.

### Resources

#### Documentation

* [Instinctual interactions](../../design/interaction-fundamentals.md)
* [Interactable objects](../../design/interactable-object.md)
* [Head-gaze and dwell](../../design/gaze-and-dwell.md)
* [Cursors](../../design/cursors.md)
* [Comfort and gaze](../../design/comfort.md#gaze-direction)
* [Voice input](../../design/voice-input.md)
* [Motion controllers](../../design/motion-controllers.md)
* [Input porting guide for Unity](../porting-apps/input-porting-guide-for-unity.md)
* [Keyboard input in Unity](../unity/keyboard-input-in-unity.md)
* [Gaze in Unity](../unity/gaze-in-unity.md)
* [Motion controllers in Unity](../unity/motion-controllers-in-unity.md)
* [Gestures in Unity](../unity/gestures-in-unity.md)
* [Voice input in Unity](../unity/voice-input-in-unity.md)
* [Keyboard, mouse, and controller input in DirectX](../native/keyboard-mouse-and-controller-input-cpp.md)
* [Head and eye gaze in DirectX](../native/gaze-in-directx.md)
* [Hands and motion controllers in DirectX](../native/hands-and-motion-controllers-in-directx.md)
* [Voice input in DirectX](../native/voice-input-in-directx.md)

#### Tools and tutorials

* [Case study: The pursuit of more personal computing](../../out-of-scope/case-study-the-pursuit-of-more-personal-computing.md#less-interface-in-your-face)
* [Cast study: HoloStudio UI and interaction design learnings](../../out-of-scope/case-study-3-holostudio-ui-and-interaction-design-learnings.md)
* [Sample app: Periodic table of the elements](../unity/periodic-table-of-the-elements.md)
* [Sample app: Lunar module](../unity/lunar-module.md)

## Interactable objects

A button has long been a metaphor used for triggering an event in the 2D abstract world. In the three-dimensional mixed reality world, we don’t have to be confined to this world of abstraction anymore. Anything can be an Interactable object that triggers an event. An interactable object can be represented as anything from a coffee cup on the table to a balloon floating in the air. Regardless of the form, interactable objects should be clearly recognizable by the user through visual and audio cues.

### Device impact

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
        <td></td>
    </tr>
     <tr>
        <td>✔️</td>
        <td>✔️</td>
        <td></td>
    </tr>
</table>

### Quality criteria

|  Best  |  Meets |  Fail |
--- | --- | ---
|  Regardless of form, interactable objects are recognizable through visual and audio cues across three states: idle, targeted, and selected. "See it, say it" is clear and consistently used throughout the experience. Objects are scaled and distributed to allow for error free targeting. | User can recognize object as interactable through audio or visual feedback, and can target and activate the object. | Given no visual or audio cues, user can't recognize an interactable object. Interactions are error prone due to object scale or distance between objects. | 

### How to measure

* Interactable objects are recognizable as 'interactable'; including buttons, menus, and app-specific content. As a rule of thumb there should be a visual and audio cue when targeting interactable objects.

### Recommendations

* Use visual and audio feedback for interactions.
* Visual feedback should be differentiated for each input state (idle, targeted, selected)
* Interactable objects should be scaled and placed for error free targeting.
* Grouped interactable objects (such as a menu bar or list) should have proper spacing for targeting.
* Buttons and menus that support voice command should provide text labels for the command keyword ("See it, say it")

### Resources

#### Documentation

* [Interactable object](../../design/interactable-object.md)
* [Text in Unity](../unity/text-in-unity.md)
* [Bounding box and App bar](../../design/app-bar-and-bounding-box.md)
* [Voice input](../../design/voice-input.md)

#### Tools and tutorials

* [Mixed Reality Toolkit - UX](https://github.com/Microsoft/MixedRealityToolkit-Unity/tree/htk_release/Assets/HoloToolkit-Examples/UX)

## Room scanning

Apps that require spatial mapping data rely on the device to automatically collect this data over time and across sessions as the user explores their environment with the device active. The completeness and quality of this data depends on a number of factors including the amount of exploration the user has done, how much time has passed since the exploration and whether objects such as furniture and doors have moved since the device scanned the area. Many apps will analyze the spatial mapping data at the start of the experience to judge whether the user should perform additional steps to improve the completeness and quality of the spatial map. If the user is required to scan the environment, clear guidance should be provided during the scanning experience.

### Device impact

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
        <td></td>
    </tr>
     <tr>
        <td>✔️</td>
        <td>❌</td>
        <td></td>
    </tr>
</table>

### Quality criteria

|  Best  |  Meets |  Fail |
--- | --- | ---
|  Visualization of the spatial mesh tell users scanning is in progress. User clearly knows what to do and when the scan starts and stops. | Visualization of the spatial mesh is provided, but the user may not clearly know what to do and no progress information is provided. | No visualization of mesh. No guidance information provided to the user regarding where to look, or when the scan starts/stops. |

### How to measure

* During a required room scan, visual and audio guidance are provided indicating where to look, and when to start and stop scanning.

### Recommendations

* Indicate how much of the total volume in the users vicinity needs to be part of the experience.
* Communicate when the scan starts and stops such as a progress indicator.
* Use a visualization of the mesh during the scan.
* Provide visual and audio cues to encourage the user to look and move around the room.
* Inform the user where to go to improve the data. In many cases, it may be best to tell the user what they need to do (e.g. look at the ceiling, look behind furniture), in order to get the necessary scan quality.

### Resources

#### Documentation

* [Room scan visualization](../../design/room-scan-visualization.md)
* [Case study: Expanding the spatial mapping capabilities of HoloLens](../../out-of-scope/case-study-expanding-the-spatial-mapping-capabilities-of-hololens.md)
* [Case study: Spatial sound design for HoloTour](../../design/case-study-spatial-sound-design-for-holotour.md)
* [Case study: Creating an immersive experience in Fragments](../../out-of-scope/case-study-creating-an-immersive-experience-in-fragments.md)

#### Tools and tutorials

* [Mixed Reality Toolkit - UX](https://github.com/Microsoft/MixedRealityToolkit-Unity/tree/htk_release/Assets/HoloToolkit-Examples/UX)

## Directional indicators

In a mixed reality app, content may be outside the field of view or occluded by real-world objects. A well-designed app will make it easier for the user to find non-visible content. Directional indicators alert a user to important content and provide guidance to the content relative to the user's position. Guidance to non-visible content can take the form of sound emitters, directional arrows, or direct visual cues.

### Device impact

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
        <td></td>
    </tr>
     <tr>
        <td>✔️</td>
        <td>✔️</td>
        <td></td>
    </tr>
</table>

### Quality criteria

|  Best  |  Meets |  Fail |
--- | --- | ---
|  Visual and audio cues directly guide the user to relevant content outside the field of view. | An arrow or some indicator that points the user in the general direction of the content. | Relevant content is outside of the field of view, and poor or no location guidance is provided to the user. | 

### How to measure

* Relevant content outside of the user field of view is discoverable through visual and/or audio cues.

### Recommendations

* When relevant content is outside the user's field of view, use directional indicators and audio cues to guide the user to the content. In many cases, a direct visual guide is preferred over directional arrows.
* Directional indicators should not be built into the cursor.

### Resources

* [Holographic frame](../../design/holographic-frame.md)

## Data loading

A progress control provides feedback to the user that a long-running operation is underway. It can mean that the user can't interact with the app when the progress indicator is visible and can also indicate how long the wait time might be.

### Device impact

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
        <td></td>
    </tr>
     <tr>
        <td>✔️</td>
        <td>✔️</td>
        <td></td>
    </tr>
</table>

### Quality criteria

|  Best  |  Meets |  Fail |
--- | --- | ---
|  Animated visual indicator, in the form of a progress bar or ring, showing progress during any data loading or processing. The visual indicator provides guidance on how long the wait could be. | User is informed that data loading is in progress, but there is no indication of how long the wait could be. | No data loading or process indicators for task taking longer than 5 seconds. |

### How to measure

* During data loading verify there is no blank state for more than 5 seconds.

### Recommendations

* Provide a data loading animator showing progress in any situation when the user may perceive this app to have stalled or crashed. A reasonable rule of thumb is any 'loading' activity that could take more than 5 seconds.

### Resources

* [Displaying progress](../../design/progress.md)