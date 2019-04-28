
# Gaze and Dwell

## Introduction

When hands are occupied with tools and parts, gestures can be tedious or impossible.  Voice commands, like gesture, can be situationally unreliable, for example under excessively loud conditions.  Additionally, using voice to control computers isn't a mainstream interaction yet, but it certainly is gaining steam!  Gaze dwell offers the most familiar and easy-to-master mechanism for working heads-up hands-free on HoloLens.  Additionally, gaze dwell is 100% reliable independent of noise interference nor silence constraints in the operating environment.

## Goals

Provide a mechanism for full hands-free interactions, without using Voice.

## Design Principles

1. Gaze is not a weapon
	
	Gaze requires visual feedback for intuitive interaction, but too much feedback can induce anxiety. The feedback should help a user know what they're targeting, but not auto-select against their intent. Reading text requires extra consideration to provide a user room to absorb the info before selecting.
	
2. Seek Goldilocks speed
	
	The dwell fill can have different timers based on impact of navigation - more frequently used functions will generally benefit from faster fill times, while more consequential functions may benefit from longer fill times. Animation curves of the fill color can positively influence a feeling of faster fill times. Consideration should be taken to enable user decision from fast/medium/slow fill speed overrides.
	
3. Say no-no to yo-yo effect

    The yo-yo effect (also known as "Night at the Roxbury") is an uncomfortable pattern that can emerge from certain  placement of content and gaze-based controls. For example, a list nav with the fill button at the bottom induces a loop of - look down to dwell, look up at results, look down to dwell, etc. This resulting pattern is uncomfortable and should be avoided by placing navigation controls in a centralized location that requires less back-and-forth. Placement of dwell buttons relative to their effects becomes important for comfort.

## UI Patterns

### High frequency buttons
	
* Next/Back buttons
  * Very short delay pre-fill (flyover flicker buffer)
  * Larger buttons are easier to hit with gaze
  * Nice to keep these at eye height so no strain to interact
  * Dwell region can be larger than inactive icon to make it easier to use (BACK)

### Low frequency buttons
	
* Activate settings menu
  * Longer delay pre-fill okay (flyover flicker buffer)
  * Try to keep these buttons out of the way of frequent cursor pathways

* Confirmations (i.e. scan flow, dialogs)
  * Show selection highlight on main button
  * Reveal dwell target at same time as selection highlight
  * Use dwell target surrounding icon to keep interface simple
  * Important decision, so highlight doesn't activate, reveals dwell target for reconsideration time
		
### Toggle buttons

* Pin
  * Clear active/inactive visual state
  * Radial fill helps focus user and provides natural progress 

* Individual settings
  * Clear active/inactive states
  * Dwell targets all on left surrounding icon
  * Dwell targets only show up when selection highlight active
  * "Dwell on slider" on right side for on/off settings

### List views

* Browsing list view - guide files to open
  * Cursor highlights row from anywhere on row but doesn’t begin dwell
  * When row is highlighted by cursor, dwell target appears on left
  * Dwell target always a circle on left side of text in all list views
  * Don't show all dwell targets at once to avoid repetitive UI
  * Re-use the same pattern to establish UX familiarity
		
* Browsing list view - hierarchy of tasks/steps in a guide
  * Dwell target always a circle on left side of text
  * Collapse/expand dwell affordance
		
* Browsing list view - mode select
  * Follow patterns established above

### Contextual buttons

* Show/Hide 3D - shows up in 3D along tether near holograms 
  * Clear active/inactive visual state

### Pivots

* Recent/All guides list
  * Fill the UI affordance that remains to indicate which tab is active
  * For short single word pivots, we elected to forego the dwell target pattern
  * We favored the simplified interface over another 2 circle targets and a wider UI
  * In our case, the words are short enough that a delay provides enough comfort before filling


## UX Guidelines and Best Practices

### Target sizes

  * Pin icon minimum size: 6cm in world space in Unity, 30 MRUs ( 30cm @ 2m)
  * Are the targets "magnetized" or "sticky" at all? (i.e. gaze cursor smoothing)

### Animation

  * Delay before dwell visual triggers .5sec
  * Duration of dwell visual 1.2sec
  * Curve on animation?

### Visual Feedback

  * Radial fill from gaze cursor start location
  * Always radial fill from center of button. A consistent response is less confusing than all different directions on different buttons. 
    * This rule can be broken though for directional interactions (e.g., nav up/down/left/right, etc.). For example, Guides makes an exception on NEXT/BACK being left right fills.
    * Consider inverting radial fill from outside (if toggling off). THe inverse feeling of pushing a button is a nice visual pattern to maintain. 

### Progressive Disclosure

 * Progressive disclosure means that the dwell target is revealed on highlight (e.g., in a list control)
 * Text bar highlights with spotlight reveal on gaze anywhere on text
 * Gaze fill target appears always on left, but only for the list item which is highlighted
 * Try to avoid having all dwell targets on at all times due to repetitive look of stacked circles