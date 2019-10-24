---
title: Cursors
description: A cursor, or indicator of your targeting vector, provides continuous feedback for the user to understand what HoloLens understands about their intentions.
author: thetuvix
ms.author: alexturn
ms.date: 02/24/2019
ms.topic: article
keywords: HoloLens (1st gen), HoloLens 2, Mixed Reality, cursors, targeting, gaze, gestures
---

# Cursors

A cursor, or indicator of your current targeting vector, provides continuous feedback for the user to understand where the headset believes their current focus is at that time. The cursor allows the user to understand their current targeting point and acts as feedback to indicate what area, hologram, or point will respond to input. It is the digital representation of where the device understands the user's attention to be (though that may not be the same as determining anything about their intentions).

The feedback provided by the cursor offers users the ability to anticipate how the system will respond, use that signal as feedback to better communicate their intention to the device, and ultimately be more confident about their interactions.

There are 3 kinds of cursors, including finger cursor, ray cursor and head cursor, to work with different input modalities on HoloLens, HoloLens 2 and immersive headsets. According to your chosen interaction model, please adopt a related type of cursor to match the goal. In MRTK, We've made all types of cursors into modules that you can use it by drag and drop.    

<table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tr>
        <td><strong>Feature</strong></td>
        <td><a href="hololens-hardware-details.md"><strong>HoloLens (1st gen)</strong></a></td>
        <td><strong>HoloLens 2</strong></td>
        <td><a href="immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Finger cursor</td>
        <td>❌</td>
        <td>✔️</td>
        <td>❌</td>
    </tr>
     <tr>
        <td>Ray cursor</td>
        <td>❌</td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td>Head-gaze cursor</td>
        <td>✔️</td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
</table>

## Finger cursor
The finger cursor mainly and newly design for HoloLens 2 to enhence the "direct manipulation with hands." The idea is to attach a ring cursor at the tip of the index finger. The diameter of the ring changes according to the distance between the index finger tip and the target. 

## Ray cursor
The ray cursor is a cursor attached at the end of a far targeting ray. In Windows Mixed Realiry of immersive headsets, the rays shoot out from motion controllers with a dot cursor at the end. In HoloLens 2, we leaverage the mental modal of motion controller rays to have the rays come from the hand palms. This makes the interactions modals of "motion controller" and "point and commit with hands" in sync. We use the a ring shape to represnet the curosr, instead of a dot, to keep consistant with the finger cursor in HoloLens 2.  

## Head-gaze cursor
The head-gaze cursor is a cursor attached at the end of head-gaze vector (an invisible ray controlled by the position and rotation of the head). In "head-gaze and commit" model, the head-gaze cursor has to work with other commit inputs, such as air tap gesture and voice commands, to execute the manipulation. In HoloLens, users can freely switch between suggested commit inputs. In HoloLens 2, users can also switch between "hand rays" and "Head-gaze and commit" excepts using air tap gesture as the way of commit.    


## Cursor customization principles
If you would like to customize your own cursor feedback behaviors and appearances, please reference principles below:

### Always present
* We recommend that the cursor is always present.
* If the user can't find the cursor, then they're lost.
* Exceptions to this are instances where having a cursor provides a suboptimal experience for the user. An example is when a user is watching a video. The cursor becomes undesirable at this point as it's in the middle of the video all the time. This is a scenario where you may consider making the cursor only visible when the user has their hand up indicating a desire to take action. Otherwise, it's not visible on the video.

### Cursor scale
* The cursor should be no larger than the available targets, allowing users to easily interact with and view the content.
* Depending on the experience you create, scaling the cursor as the user looks around is also an important consideration. For example, as the user looks further away in your experience perhaps the cursor should not become too small such that its lost.
* When scaling the cursor, consider applying a soft animation to it as it scales giving it an organic feeling.
* Avoid obstructing content. Holograms are what make the experience memorable and the cursor should not be taking away from them.

### Directionless cursor
* Although there is no one right cursor shape, we recommend that you use a directionless shape like a torus or something else. A cursor that points in some direction (ex: a traditional arrow cursor) might confuse the user to always look that way.
* An exception to this is when using the cursor to communicate interaction instruction to the user. For example, when scaling holograms in the Windows Holographic shell, the cursor temporarily includes arrows that help instruct the user on how to move their hand to scale the hologram.

### Look and feel
* A donut or torus shaped cursor works for a lot of applications.
* Pick a color and shape that best represents the experience you are creating.
* Cursors are especially prone to [color separation](hologram-stability.md#color-separation).
* A small cursor with balanced opacity keeps it informative without dominating the visual hierarchy.
* Be cognizant of using shadows or highlights behind your cursor as they might obstruct content and distract from the purpose.
* Cursors should align to and hug the surfaces in your app, this will give the user a feeling that the system can see where they are looking, but also that the system is aware of their surroundings.
* For example, in the Windows Holographic OS, the cursor aligns to the surfaces of the user's world, creating a feeling of awareness of the world even when the user isn't looking directly at a hologram..
* Magnetically locking the cursor to an interactive element when it is within close proximity. This can help improve confidence that user will interact with that element when they perform a selection action.

### Visual cues
* There is a lot of information in our world and with holograms we are adding more information. A cursor is a great way of communicating to the user what is important.
* If your experience is focused on a single hologram, then perhaps your cursor aligns and hugs only that hologram and changes shape when you look away from that hologram. This can convey to the user that the hologram is special and they can interact with it.
* If your application uses spatial mapping, then your cursor could align and hug every surface it sees. This gives feedback to the users that HoloLens and your application can see their space.
* These things help reinforce the fact that holograms are real and in our world. They help bridge the gap between real and virtual.
* Have an idea of what the cursor should do when there are no holograms or surfaces in view. Placing it at a predetermined distance in front of the user is one option.

## Cursor feedback

As we mentioned it is good practice to have the cursor always be present, as you can use the cursor to convey some important bits of information.

### Possible actions
* As the user is gazing at a hologram and the cursor is on that hologram, you could use the cursor to convey possible actions on that hologram.
* You could display an icon on the cursor that the user can for example purchase that item or perhaps scale that hologram. Or even something as simple like the hologram can be tapped on.
* Only add extra information on the cursor if it means something to the user. Otherwise, users might either not notice the state changes or get confused by the cursor.

### Input state
* We could use the cursor to display the user's input state. For example, we could display an icon telling the user if the system sees their hand state. This will tell the user that the application knows the user is ready to take action.
* We could also use the cursor to make the user aware that there is a voice command available. Or perhaps change the color of the cursor momentarily to tell the user that the voice command was heard by the system.

These different cursor states can be implemented in different ways. You might implement these different states by modeling the cursor like a state machine. For example:
* Idle state is where you show the default cursor.
* Ready state is when you have detected the user's hand in the ready position.
* Interaction state is when the user is performing a particular interaction.
* Possible Actions state is when you convey possible actions that can be performed on a hologram.

You could also implement these states in a skin-able manner such that you can display different art assets when different states are detected.

## Going "cursor-free"

Designing without a cursor is recommended only when the sense of immersion is a key component of an experience, and interactions that involve targeting (through gaze and gesture) do not require great precision. The system must still meet the needs that are normally met by a cursor though - providing users with continuous feedback on the system's understanding of their targeting and helping them to confidently communicate their intentions to the system. This may be achievable through other noticeable state changes.

## See also
* [Gestures](gestures.md)
* [Gaze targeting](gaze-targeting.md)
