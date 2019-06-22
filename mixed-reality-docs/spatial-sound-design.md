---
title: Spatial sound design
description: Spatial sound is a powerful tool for immersion, accessibility, and UX design in mixed reality applications.
author: joekellyms
ms.author: joekelly
ms.date: 03/21/2018
ms.topic: article
keywords: Windows Mixed Reality, spatial sound, design, style
---



# Spatial sound design

Spatial sound is a powerful tool for immersion, accessibility, and UX design in mixed reality applications.

If you've ever played [Marco Polo](https://en.wikipedia.org/wiki/Marco_Polo_(game)), or had someone call your phone to help you locate it, you are already familiar with the importance of spatial sound. We use sound cues in our daily lives to locate objects, get someone's attention, or get a better understanding of our environment. The more closely your app's sound behaves like it does in the real world, the more convincing and engaging your virtual world will be.

<br>

> [!VIDEO https://www.youtube.com/embed/aB3TDjYklmo]

## Device support

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><strong>Feature</strong></td>
        <td><a href="hololens-hardware-details.md"><strong>HoloLens</strong></a></td>
        <td><a href="immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Spatial sound design</td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
</table>


## Four key things spatial sound does for mixed reality development

By default, sounds are played back in stereo. This means the sound will play with no spatial position, so the user does not know where the sound came from. Spatial sound does four key things for mixed reality development:

**Grounding**

Without sound, virtual objects effectively cease to exist when we turn our head away from them. Just like real objects, you want to be able to hear these objects even when you can't see them, and you want to be able to locate them anywhere around you. Just as virtual objects need to be grounded visually to blend with your real world, they also need to be grounded audibly. Spatial sound seamlessly blends your real world audio environment with the digital audio environment.

**User attention**

In mixed reality experiences, you can't assume where your user is looking and expect them to see something you place in the world visually. But users can always hear a sound play even when the object playing the sound is behind them. People are used to having their attention drawn by sound - we instinctually look toward an object that we hear around us. When you want to direct your user's gaze to a particular place, rather than using an arrow to point them visually, placing a sound in that location is a very natural and fast way to guide them.

**Immersion**

When objects move or collide, we usually hear those interactions between materials. So when your objects don't make the same sound they would in the real world, a level of immersion is lost - like watching a scary movie with the volume all the way down. All sounds in the real world come from a particular point in space - when we turn our heads, we hear the change in where those sounds are coming from relative to our ears, and we can track the location of any sound this way. Spatialized sounds make up the "feel" of a place beyond what we can see.

**Interaction design**

In most traditional interactive experiences, interaction sounds like UI sound effects are played in standard mono or stereo. But because everything in mixed reality exists in 3D space - including the UI - these objects benefit from spatialized sounds. When we press a button in the real world, the sound we hear comes from that button. By spatializing interaction sounds, we again provide a more natural and realistic user experience.

## Best practices when using spatial sound

**Real sounds work better than synthesized or unnatural sounds**

The more familiar your user is with a type of sound, the more real it will feel, and the more easily they will be able to locate it in their environment. A human voice, for example, is a very common type of sound, and your users will locate it just as quickly as a real person in the room talking to them.

**Expectation trumps simulation**

If you are used to a sound coming from a particular direction, your attention will be guided in that direction regardless of spatial cues. For example, most of the time that we hear birds, they are above us. Playing the sound of a bird will most likely cause your user to look up, even if you place the sound below them. This is usually confusing, and it is recommended that you work with expectations like these rather than going against them for a more natural experience.

**Most sounds should be spatialized**

As mentioned above, everything in Mixed Reality exists in 3D space - your sounds should as well. Even music can sometimes benefit from spatialization, particularly when it's tied to a menu or some other UI.

**Avoid invisible emitters**

Because we've been conditioned to look at sounds that we hear around us, it can be an unnatural and even unnerving experience to locate a sound that has no visual presence. Sounds in the real world don't come from empty space, so be sure that if an audio emitter is placed within the user's immediate environment that it can also be seen.

**Avoid spatial masking**

Spatial sound relies on very subtle acoustic cues that can be overpowered by other sounds. If you do have stereo music or ambient sounds, make sure they are low enough in the mix to give room for the details of your spatialized sounds that will allow your users to locate them easily, and keep them sounding realistic and natural.

## General concepts to keep in mind when using spatial sound

**Spatial sound is a simulation**

The most frequent use of spatial sound is making a sound seem as though it is emanating from a real or virtual object in the world. Thus, spatialized sounds may make the most sense coming from such objects.

Note that the perceived accuracy of spatial sound means that a sound shouldn't necessarily emit from the center of an object, as the difference will be noticeable depending on the size of the object and distance from the user. With small objects, the center point of the object is usually sufficient. For larger objects, you may want a sound emitter or multiple emitters at the specific location within the object that is supposed to be producing the sound.

**Normalize all sounds**

Distance attenuation happens quickly within the first meter from the user, as it does in the real world. All audio files should be normalized to ensure physically accurate distance attenuation, and ensure that a sound can be heard when several meters away (when applicable). The spatial audio engine will handle the attenuation necessary for a sound to "feel" like it's at a certain distance (with a combination of attenuation and "distance cues"), and applying any attenuation on top of that could reduce the effect. Outside of simulating a real object, the initial distance decay of *spatial sound* sounds will likely be more than enough for a proper mix of your audio.

**Object discovery and user interfaces**

When using audio cues to direct the user's attention beyond their current view, the sound should be audible and prominent in the mix, well above any stereo sounds, and any other spatialized sounds which might distract from the directional audio cue. For sounds and music that are associated with an element of the user interface (e.g. a menu), the sound emitter should be attached to that object. Stereo and other non-positional audio playing can make spatialized elements difficult for users to locate (See above: Avoid spatial masking).

**Use spatial sound over standard 3D sound as much as possible**

In mixed reality, for the best user experience, 3D audio should be achieved using spatial sound rather than legacy 3D audio technologies. In general, the improved spatialization is worth the small CPU cost over standard 3D sound. Standard 3D audio can be used for low-priority sounds, sounds that are spatialized but not necessarily tied to a physical or virtual object, and objects that the user never need locate to interact with the app.

## See also
* [Spatial sound](spatial-sound.md)
* [Spatial mapping](spatial-mapping.md)
