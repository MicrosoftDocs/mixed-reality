# [World Locking Tools (Recommended)](#tab/wlt)

World Locking Tools provides a stable coordinate system and adjustable camera that minimizes the visible inconsistencies between virtual and real world markers. Put another way, it world-locks the entire scene with a shared pool of anchors, rather than locking each group of objects with the group's own individual anchor.

### What comes with World Locking Tools

World Locking Tools keeps an internal supply of of spatial anchors it spreads throughout the virtual scene as the user moves around. The tools analyze the coordinates of the camera and those spatial anchors every frame. Instead of changing the coordinates of everything in the world to compensate for the changed coordinates of the user's head, the tools just fix the head's coordinates instead.

What this means for you as a developer: rather than having an anchor drag a hologram through Unity space to keep it fixed in physical space, the entire Unity world space is locked to physical space. If a hologram is motionless in Unity space, it will remain motionless relative to the physical world around it. More importantly, it will also remain fixed relative to the virtual features around it.

Obviously, it's more complicated under the hood than that. For example, spatial anchors move independently and don't always agree with each other. The underlying FrozenWorld engine arbitrates those disagreements and comes up with the most perceptually correct camera correction in every frame.

# [Unity 2020 + OpenXR](#tab/openxr)

TBD

# [Unity 2019/2020 + Windows XR Plugin](#tab/winxr)

TBD

# [Legacy WSA](#tab/wsa)

TBD