---
title: Comfort
description: During natural viewing, the human visual system relies on multiple sources of information, or “cues,” to interpret 3D shapes and the relative position of objects.
author: rwinj
ms.author: roheld, phguan, mcrisler
ms.date: 2/28/2018
ms.topic: article
keywords: Windows Mixed Reality, design, comfort
---



# Comfort

During natural viewing, the human visual system relies on multiple sources of information, or “cues,” to interpret 3D shapes and the relative position of objects. Some cues are monocular, including [linear perspective](https://en.wikipedia.org/wiki/Perspective_(graphical)), familiar size, occlusion, depth-of-field blur, and [accommodation](https://en.wikipedia.org/wiki/Accommodation_(eye)). Other cues are binocular, such as [vergence](https://en.wikipedia.org/wiki/Vergence) (essentially the relative rotations of the eyes required to look at an object) and [binocular disparity](https://en.wikipedia.org/wiki/Stereopsis) (the pattern of differences between the projections of the scene on the back of the two eyes). To ensure maximum comfort on head-mounted displays, it’s important for designers and developers to create and present content in a way that mimics how these cues operate in the natural world. From a physical perspective, it is also important to design content that does not require fatiguing motions of the neck or arms. In this article, we’ll go over key considerations to keep in mind to achieve these goals.

## Vergence-accommodation conflict

To view objects clearly, humans must [accommodate](https://en.wikipedia.org/wiki/Accommodation_%28eye%29), or adjust their eyes’ focus, to the distance of the object. At the same time, the two eyes must [converge](https://en.wikipedia.org/wiki/Convergence_(eye)) to the object’s distance to avoid seeing double images. In natural viewing, vergence and accommodation are linked. When you view something near (e.g. a housefly close to your nose) your eyes cross and accommodate to a near point. Conversely, if you view something at infinity, your eyes’ lines of sight become parallel and the your eyes accommodates to infinity. In most head-mounted displays users will always accommodate to the focal distance of the display (to get a sharp image), but converge to the distance of the object of interest (to get a single image). When users accommodate and converge to different distances, the natural link between the two cues must be broken and this can lead to visual discomfort or fatigue.

<br>
>[!VIDEO https://www.youtube.com/embed/-606oZKLa_s]

**Guidance for holographic devices**

HoloLens displays are fixed at an optical distance approximately 2.0m away from the user. Thus, users must always accommodate near 2.0m to maintain a clear image in the device. App developers can guide where users' eyes converge by placing content and holograms at various depths. Discomfort from the vergence-accommodation conflict can be avoided or minimized by keeping content to which users converge to as close to 2.0m as possible (i.e. in a scene with lots of depth, place the areas of interest near 2.0m from the user when possible). When content cannot be placed near 2.0m, discomfort from the vergence-accomodation conflict is greatest when the user’s gaze switches back and forth between different distances. In other words, it is much more comfortable to look at a stationary hologram that stays 50cm away than to look at a hologram 50cm away that moves toward and away from you over time.

![Optimal distance for placing holograms from the user.](images/distanceguiderendering-950px.png)

**Best practices**

For maximum comfort, **the optimal zone for hologram placement is between 1.25m and 5m**. In every case, designers should attempt to structure content scenes to encourage users to interact 1m or farther away from the content (e.g. adjust [content size and default placement parameters](gaze-targeting.md)). When possible, we recommend starting to fade out content at 40cm and placing a rendering clipping plane at 30cm to avoid any nearer objects.

In applications where content must be placed closer than 1m, extra care should be taken to ensure user comfort. For instance, as stated above, objects that move in depth are more likely than stationary objects to produce discomfort due to the vergence-accommodation conflict. Additionally, the odds of discomfort due to the conflict increase exponentially with decreasing viewing distance. We recommend creating a “depth budget” for apps based on the amount of time a user is expected to view content that is near (<1m) and/or moving in depth. An example is to avoid placing the user in those situations more than 25% of the time. If the depth budget is exceeded, we recommend careful user testing to ensure it remains a comfortable experience.

**Guidance for immersive devices**

For immersive devices, the guidance for HoloLens still applies, but the specific values for the Zone of Comfort are shifted depending on the focal distance to the display. In general, the focal distances to these displays are between 1.25m-2.5m. When in doubt, avoid rendering objects of interest too near to users and instead try to keep most content 1m or farther away.

## Rendering rates

Mixed reality apps are unique because users can move freely in the world and interact with virtual content like as though they were real objects. To maintain this impression, it is critical to render holograms so they appear stable in the world and animate smoothly. Rendering at a [minimum of 60 frames per second (FPS)](performance-recommendations-for-hololens-apps.md) helps achieve this goal. There are some Mixed Reality devices that support rendering at framerates higher than 60 FPS and for these devices it is strongly recommended to render at the higher framerates to provide an optimal user experience.

**Diving deeper**

To draw holograms to look like [they're stable in the real or virtual world](hologram-stability.md), apps need to render images from the user's position. Since image rendering takes time, HoloLens and other Windows Mixed Reality devices predict where a user's head will be when the images are shown in the displays. This prediction algorithm is an approximation. Windows Mixed Reality algorithms and hardware adjust the rendered image to account for the discrepancy between the predicted head position and the actual head position. This process makes the image seen by the user appear as if it were rendered from the correct location, and holograms feel stable. The updates work best for small changes in head position, and they can't completely account for some rendered image differences, like those caused by motion-parallax.

**By rendering at a minimum framerate of 60 FPS, you are doing two things to help make stable holograms:**
1. Reducing the appearance of judder, which is characterized by uneven motion and double images. Faster hologram motion and lower render rates are associated with more pronounced judder. Therefore, striving to always maintain 60 FPS (or your device’s maximum render rate) will help avoid judder for moving holograms.
2. Minimizing the overall latency. In an engine with a game thread and a render thread running in lockstep, running at 30FPS can add 33.3ms of extra latency. By reducing latency, this decreases prediction error, and increases hologram stability.

**Performance analysis**

There are a variety of tools that can be used to benchmark your application frame rate such as:
* GPUView
* Visual Studio Graphics Debugger
* Profilers built into 3D engines such as Unity

## Self-motion and user locomotion

The only limitation is the size of your physical space; if you want to allow users to move farther in the virtual environment than they can in their real rooms, then a form of purely virtual motion must be implemented. However, sustained virtual motion that does not match the user’s real, physical motion can often induce motion sickness. This outcome is due to the *visual cues* for self-motion from the *virtual world* conflicting with the [vestibular cues](https://en.wikipedia.org/wiki/Vestibular_system) for self-motion coming from the *real world*.

Fortunately, there are tips for implementing user locomotion that can help avoid the issue:
* Always put the user in control of their movements; unexpected self-motion is particularly problematic
* Humans are very sensitive to the direction of gravity. Therefore, non-user-initiated vertical motions especially should be avoided.
* **For holographic devices** - One method to allow the user to move to another location in a large virtual environment is to give the impression they're moving a small object in the scene. This effect can be achieved as follows:
1. Provide an interface where the user can select a spot in the virtual environment where they want to move.
2. Upon selection, shrink the scene rendering down to a disk around the desired spot.
3. While keeping the spot selected, allow the user to move it as though it were a small object. The user can then move the selection close to their feet.
4. Upon deselection, resume rendering the entire scene.
* **For immersive devices** - The preceding holographic device approach does not work as well in an immersive device because it requires the app to render a large black void or another default environment while moving the “disk.” This treatment disrupts one’s sense of immersion. One trick for user locomotion in an immersive headset is the “blink” approach. This implementation provides the user with control over their motion and gives a brief impression of movement, but makes it so brief that the user is less likely to feel disoriented by the purely virtual self-motion:
1. Provide an interface where the user can select a spot in the virtual environment where they want to move.
2. Upon selection, begin a very rapid simulated (100 m/s) motion towards that location while quickly fading out the rendering.
3. Fade the rendering back in after finishing the translation.

## Heads-up displays

In first-person-shooter videogames, heads-up displays (HUDs) persistently present information such as player health, mini-maps, and inventories directly on the screen. HUDs work well to keep the player informed without intruding on the gameplay experience. In mixed reality experiences, HUDs have the potential to cause significant discomfort and must be adapted to the more immersive context. Specifically, HUDs that are rigidly locked to the user’s head orientation are likely to produce discomfort. If an app requires a HUD, we recommend *body* locking rather than head locking. This treatment can be implemented as a set of displays that immediately translate with the user, but do not rotate with the user’s head until a threshold of rotation is reached. Once that rotation is achieved, the HUD may reorient to present the information within the user’s field of view. Implementing 1:1 HUD rotation and translation relative to the user’s head motions should always be avoided.

## Gaze direction

To avoid eye and neck strain content should be designed so that excessive eye and neck movements are avoided.
* **Avoid** gaze angles more than 10 degrees above the horizon (vertical movement)
* **Avoid** gaze angles more than 60 degrees below the horizon (vertical movement)
* **Avoid** neck rotations more than 45 degrees off-center (horizontal movement)

The optimal (resting) gaze angle is considered between 10-20 degrees below horizontal, as the head tends to tilt downward slightly, especially during activities.

![Allowable field of view (FOV) as determined by neck range of motion](images/optimal-field-of-view-2.png)

Allowable field of view (FOV) as determined by neck range of motion

## Arm positions

Muscle fatigue can accumulate when users are expected to keep a hand raised throughout the duration of an experience. It can also be fatiguing to require the user to repeatedly make air tap gestures over long durations. We therefore recommend that experiences avoid requiring constant, repeated gesture input. This goal can be achieved by incorporating short breaks or offering a mixture of gesture and speech input to interact with the app.

## See also
* [Gaze](gaze.md)
* [Hologram stability](hologram-stability.md)
* [Interaction fundamentals](interaction-fundamentals.md)
