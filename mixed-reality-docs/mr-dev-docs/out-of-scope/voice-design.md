---
title: Voice commands
description: Get guidance on voice design, and learn about gaze, gesture, and voice (GGV), the primary means of interaction on HoloLens.
author: sean-kerawala
ms.author: sekerawa
ms.date: 05/16/2022
ms.topic: article
keywords: Windows Mixed Reality, design, interaction, voice
---


# Voice commands

Voice is a powerful and convenient way to control the system and apps. Consider adding voice commands to any experience that you build.

[HoloLens (1st gen)](/hololens/hololens1-hardware), [HoloLens 2](/hololens/hololens2-hardware), and [immersive headsets](../../../enthusiast-guide/immersive-headset-hardware-details.md) with headsets attached support voice commands.

### Strengths of voice

Voice commands have the following benefits:

- Voice input is a natural way to communicate intent. 
- Voice is a convenient input method when users [have their hands full](../design/hands-free.md) or are multi-tasking.
- Voice dictation can be an efficient, alternative input method on devices where typing on a keyboard is difficult.
- In some cases with limited range of accuracy for gaze and gesture, voice might be a user's only trusted method of input.
- Voice is especially good at interface *traversals*, because it can help users cut through multiple steps. A user can say "go back" while looking at a web page, instead of having to locate and select the **Back** button in the app. This small time savings can have a powerful emotional effect on a user's perception of an experience.

Voice input offers users the following advantages:

- Saves time. Voice makes reaching the end goal more efficient.
- Minimizes effort. Voice makes tasks more fluid and effortless.
- Reduces cognitive load. Voice commands are intuitive, easy to learn, and easy to remember.
- Conforms to societal behavior norms.
- Easily becomes routine, habitual behavior.

### Weaknesses of voice

Voice commands also have the following weaknesses:

- Lack of fine-grained control. For example, a user might say "louder," but can't say how much. "A little" is hard to quantify.
- Difficulty moving or scaling objects. Voice doesn't offer much granularity of control.
- Imperfect performance. A voice system can hear a command incorrectly or fail to hear a command. Recovering from such errors is a challenge in any interface.
- Social issues. Voice input might be disruptive in public places. Users can't or shouldn't say certain things.

## How to use voice

You typically use [head-gaze](../design/gaze-and-commit.md) as the targeting mechanism for voice commands. You can use gaze as a pointer with "select," or direct your command to an application with "see it, say it." Some voice commands, like "go to start" or "hey cortana" don't need a gaze target.

### Select

Users can say "select" at any time to activate whatever the gaze cursor is pointing at.

In HoloLens 2, users first invoke the [gaze cursor](../design/cursors.md#head-gaze-cursor) by saying the word "select". Saying "select" again activates the cursor. To hide the gaze cursor, users simply use their hands to air tap or touch an object.

### See it, say it

In the Windows Mixed Reality "see it, say it" voice model, button labels are identical to the associated voice commands. Because there's no dissonance between the label and the voice command, users can easily understand what to say to control the system. To reinforce the model, while dwelling on a button, a **voice dwell tip** appears to communicate that the button is voice enabled.

The following images show examples of "see it, say it."

![Image of a see it, say it example.](../design/images/voice-seeitsayit1-640px.jpg)

![Image of another see it, say it example.](../design/images/voice-seeitsayit2-640px.jpg)<br>

### Design recommendations

Because users speak with a variety of dialects and accents, proper choice of speech keywords ensures that your users' commands are interpreted unambiguously. The following practices promote smooth speech recognition.

- **Use multi-syllable commands.** When possible, choose keywords of two or more syllables. People with different accents tend to use different vowel sounds when speaking one-syllable words. For example, "play video" is better than "Play clip."
- **Use concise commands.** Use short commands. For example, "play video" is better than "Play the currently selected video."
- **Use simple vocabulary.** For example, "show note" is better than "show placard."
- **Make sure commands are non-destructive.** Make sure any actions taken are non-destructive and easily undone in case another nearby person accidentally triggers a command.
- **Avoid similar sounding commands.** Avoid multiple commands that sound very similar, like "show more" and "show store."
- **Unregister your app when not in use.** When your app isn't in a state to use a particular speech command, consider unregistering it so other commands aren't confused for that one.
- **Test with different accents.** Test your app with users of different accents.
- **Maintain voice command consistency.** If "go back" goes to the previous page, maintain this behavior throughout your applications.
- **Don't use system commands** The voice commands "hey cortana" and "select" are reserved for the system. Don't use these commands in applications.

## User interface considerations

When a voice system is applied properly, the user *knows what they can say*, and *gets clear feedback that the system heard them correctly*. These two signals make the user feel confident in using voice as a primary input.

Common questions and concerns users have about voice include:

- What can I say?
- How do I know the system heard me correctly?
  - The system keeps getting my voice commands wrong.
  - The system reacts the wrong way when I give it a voice command.
  - The system doesn't react when I give a voice command.
- How do I target my voice to a specific app or app command?
- Can I use voice to command things out of the holographic frame on HoloLens?

The most important things to instruct users about voice in mixed reality are:

- You can say "select" anywhere you're targeting a button to select the button.
- In some apps, you can say the label name of an app bar button to take an action. For example, while looking at an app, you can say "remove" to remove the app from the world. You don't have to select the app with your hand.
- You can initiate Cortana listening by saying "hey cortana." You can then ask questions, open apps, or bring up the **Start** menu by saying "hey cortana, take me home."

The following diagram shows what happens to the cursor when the system recognizes a voice input, and how the system communicates that to the user.

![Diagram showing voice feedback states for the cursor.](../design/images/voicefeedbackstates.png)

1. Regular cursor state.
1. System communicates voice feedback and then dissipates.
1. Regular cursor state.

## See also
- [Gestures](../design/gaze-and-commit.md#composite-gestures)
- [Head-gaze and dwell](../design/gaze-and-dwell.md)