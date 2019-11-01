---
title: Head-gaze and commit
description: Overview of the head-gaze and commit input model
author: caseymeekhof
ms.author: cmeekhof
ms.date: 03/31/2019
ms.topic: article
keywords: Mixed Reality, gaze, gaze targeting, interaction, design
---
# Head-gaze and commit
Head-gaze and commit is an input model that involves targeting an object with the direction of your head pointing forward (head-direction), and then acting on it with a secondary input, such as the hand gesture air tap or the voice command Select. It is considered a far input model with indirect manipulation, meaning it is best used for interacting with content that is beyond arms reach.

## Device support

<table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tr>
        <td><strong>Input model</strong></td>
        <td><a href="hololens-hardware-details.md"><strong>HoloLens (1st gen)</strong></a></td>
        <td><a href="https://docs.microsoft.com/hololens/hololens2-hardware"><strong>HoloLens 2</strong></td>
        <td><a href="immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Head-gaze and commit</td>
        <td>✔️ Recommended</td>
        <td>✔️ Recommended (third choice - <a href="interaction-fundamentals.md">See the other options</a>)</td>
        <td>➕ Alternate option</td>
    </tr>
</table>


---


## Head-gaze targeting
All interactions are built upon the ability of a user to target the element they want to interact with, regardless of the input modality. In Windows Mixed Reality, this is generally done using the user's gaze.
To enable a user to work with an experience successfully, the system's calculated understanding of a user's intent and the user's actual intent must align as closely as possible. To the degree that the system interprets the user's intended actions correctly, satisfaction increases and performance improves.

As a mixed reality developer, you can do a lot with head or eye gaze:
* Your app can intersect gaze with the holograms in your scene to determine where the user's attention is.
* Your app can target gestures and controller presses based on the user's gaze, letting the user select, activate, grab, scroll, or otherwise interact with their holograms.
* Your app can let the user place holograms on real-world surfaces, by intersecting their gaze ray with the spatial mapping mesh.
* Your app can know when the user is *not* looking in the direction of an important object, which can lead your app to give visual and audio cues to turn towards that object.

<br>

---

## Cursor

:::row:::
    :::column:::
        For head gaze, most apps should use a [cursor](cursors.md) (or other auditory/visual indication) to give the user confidence in what they're about to interact with. 
        You typically position this cursor in the world where their head gaze ray first intersects an object, which may be a hologram or a real-world surface.<br>
        <br>
        For eye gaze, we generally recommend *not* to show a cursor, as this can quickly become distracting and annoying for the user. 
        Instead subtly highlight visual targets or use a very faint eye cursor to provide confidence about what the user is about to interact with. For more information, please check out our [design guidance for eye-based input](eye-tracking.md) on HoloLens 2.
    :::column-end:::
        :::column:::
       ![An example visual cursor to show gaze](images/cursor.jpg)<br>
       *Image: An example visual cursor to show gaze*
    :::column-end:::
:::row-end:::


<br>

---


## Target sizing and feedback
The gaze vector has been shown repeatedly to be usable for fine targeting, but often works best for gross targeting--acquiring somewhat larger targets. Minimum target sizes of 1 to 1.5 degrees allows successful user actions in most scenarios, though targets of 3 degrees often allow for greater speed. Note that the size that the user targets is effectively a 2D area even for 3D elements--whichever projection is facing them should be the targetable area. Providing some salient cue that an element is "active" (that the user is targeting it) is extremely helpful. This can include treatments like visible "hover" effects, audio highlights or clicks, or clear alignment of a cursor with an element.

![Optimal target size at 2 meter distance](images/gazetargeting-size-1000px.jpg)<br>
*Optimal target size at 2 meter distance*

<br>

![An example of highlighting a gaze targeted object](images/gazetargeting-highlighting-940px.jpg)<br>
*An example of highlighting a gaze targeted object*

## Target placement
Users often fail to find UI elements that are positioned very high or very low in their field of view, focusing most of their attention on areas around their main focus, which is approximately at eye level. Placing most targets in some reasonable band around eye level can help. Given the tendency for users to focus on a relatively small visual area at any time (the attentional cone of vision is roughly 10 degrees), grouping UI elements together to the degree that they're related conceptually can leverage attention-chaining behaviors from item to item as a user moves their gaze through an area. When designing UI, keep in mind the potential large variation in field of view between HoloLens and immersive headsets.

![An example of grouped UI elements for easier gaze targeting in Galaxy Explorer](images/gazetargeting-grouping-1000px.jpg)<br>
*An example of grouped UI elements for easier gaze targeting in Galaxy Explorer*

## Improving targeting behaviors
If user intent to target something can be determined (or approximated closely), it can be very helpful to accept near miss attempts at interaction as though they were targeted correctly. Here are a handful of successful methods that can be incorporated in mixed reality experiences:

### Head-gaze stabilization ("gravity wells")
This should be turned on most or all of the time. This technique removes the natural head and neck jitters that users might have as well movement due to looking and speaking behaviors.

### Closest link algorithms
These work best in areas with sparse interactive content. If there is a high probability that you can determine what a user was attempting to interact with, you can supplement their targeting abilities by assuming some level of intent.

### Backdating and postdating actions
This mechanism is useful in tasks requiring speed. When a user is moving through a series of targeting and activation maneuvers at speed, it is useful to assume some intent, and allow missed steps to act upon targets that the user had in focus slightly before or slightly after the tap (50 ms before/after was effective in early testing).

### Smoothing
This mechanism is useful for pathing movements, reducing the slight jitter and wobble due to natural head movement characteristics. When smoothing over pathing motions, smooth by the size and distance of movements rather than over time.

### Magnetism
This mechanism can be thought of as a more general version of closest link algorithms--drawing a cursor toward a target or simply increasing hitboxes, whether visibly or not, as users approach likely targets by using some knowledge of the interactive layout to better approach user intent. This can be particularly powerful for small targets.

### Focus stickiness
When determining which nearby interactive elements to give focus to, focus stickiness provides a bias to the element that is currently focused. This helps reduce erratic focus switching behaviors when floating at a midpoint between two elements with natural noise.


## Composite gestures

### Air tap
The air tap gesture (as well as the other gestures below) reacts only to a specific tap. To detect other taps, such as Menu or Grasp, your application must directly use the lower-level interactions described in the two key component gestures section above.

### Tap and hold
Hold is simply maintaining the downward finger position of the air tap. The combination of air tap and hold allows for a variety of more complex "click and drag" interactions when combined with arm movement such as picking up an object instead of activating it or mousedown secondary interactions such as showing a context menu.
Caution should be used when designing for this gesture however, as users can be prone to relaxing their hand postures during the course of any extended gesture.

### Manipulation
Manipulation gestures can be used to move, resize, or rotate a hologram when you want the hologram to react 1:1 to the user's hand movements. One use for such 1:1 movements is to let the user draw or paint in the world.
The initial targeting for a manipulation gesture should be done by gaze or pointing. Once the tap and hold starts, any manipulation of the object is handled by hand movements, freeing the user to look around while they manipulate.

### Navigation
Navigation gestures operate like a virtual joystick, and can be used to navigate UI widgets, such as radial menus. You tap and hold to start the gesture and then move your hand within a normalized 3D cube, centered around the initial press. You can move your hand along the X, Y or Z axis from a value of -1 to 1, with 0 being the starting point.
Navigation can be used to build velocity-based continuous scrolling or zooming gestures, similar to scrolling a 2D UI by clicking the middle mouse button and then moving the mouse up and down.

Navigation with rails refers to the ability of recognizing movements in certain axis until a certain threshold is reached on that axis. This is only useful when movement in more than one axis is enabled in an application by the developer, such as if an application is configured to recognize navigation gestures across X, Y axis but also specified X axis with rails. In this case the system will recognize hand movements across X axis as long as they remain within an imaginary rails (guide) on the X axis, if hand movement also occurs on the Y axis.

Within 2D apps, users can use vertical navigation gestures to scroll, zoom, or drag inside the app. This injects virtual finger touches to the app to simulate touch gestures of the same type. Users can select which of these actions take place by toggling between the tools on the bar above the application, either by selecting the button or saying '<Scroll/Drag/Zoom> Tool'.

[More info on composite gestures](gaze-and-commit.md#composite-gestures)

## Gesture recognizers

One benefit of using gesture recognition is that you can configure a gesture recognizer only for the gestures the currently targeted hologram can accept. The platform only does disambiguation as necessary to distinguish those particular supported gestures. In this way, a hologram that just supports air tap can accept any length of time between press and release, while a hologram that supports both tap and hold can promote the tap to a hold after the hold time threshold.

## Hand recognition
HoloLens recognizes hand gestures by tracking the position of either or both hands that are visible to the device. HoloLens sees hands when they are in either the ready state (back of the hand facing you with index finger up) or the pressed state (back of the hand facing you with the index finger down). When hands are in other poses, HoloLens ignores them.
For each hand that HoloLens detects, you can access its position without orientation and its pressed state. As the hand nears the edge of the gesture frame, you're also provided with a direction vector, which you can show to the user so they know how to move their hand to get it back where HoloLens can see it.

## Gesture frame
For gestures on HoloLens, the hand must be within a gesture frame, in a range that the gesture-sensing cameras can see appropriately,  from nose to waist and between the shoulders. Users need to be trained on this area of recognition both for success of action and for their own comfort. Many users will initially assume that the gesture frame must be within their view through HoloLens, and hold their arms up uncomfortably in order to interact. When using the HoloLens Clicker, it's not necessary for hands to be within the gesture frame.

In the case of continuous gestures in particular, there is some risk of users moving their hands outside of the gesture frame while in mid-gesture when moving a holographic object, for example, and losing their intended outcome.

There are three things that you should consider:

- User education on the gesture frame's existence and approximate boundaries. This is taught during HoloLens setup.

- Notifying users when their gestures are nearing or breaking the gesture frame boundaries within an application to the degree that a lost gesture leads to undesired outcomes. Research has shown the key qualities of such a notification system. The HoloLens shell provides a good example of this type of notification--visual, on the central cursor, indicating the direction in which boundary crossing is taking place.

- Consequences of breaking the gesture frame boundaries should be minimized. In general, this means that the outcome of a gesture should be stopped at the boundary, and not reversed. For example, if a user is moving some holographic object across a room, the movement should stop when the gesture frame is breached, and not returned to the starting point. The user might experience some frustration, but might more quickly understand the boundaries, and not have to restart their full intended actions each time.


## See also
* [Eye-based interaction] (eye-gaze-interaction.md)
* [Gaze and dwell](gaze-and-dwell.md)
* [Hands - Direct manipulation](direct-manipulation.md)
* [Hands - Gestures](gaze-and-commit.md#composite-gestures)
* [Hands - Point and commit](point-and-commit.md)
* [Instinctual interactions](interaction-fundamentals.md)
* [Voice input](voice-input.md)



