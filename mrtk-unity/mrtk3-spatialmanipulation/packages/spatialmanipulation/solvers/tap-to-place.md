---
title: Tap to place | MRTK3
description: Documentation of TapToPlace in MRTK3
author: CDiaz-MS
ms.author: cadia
ms.date: 4/14/2022
ms.localizationpriority: high
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Tap to Place
---

# Tap to place | MRTK3

Tap to Place is a solver used to place a game object on the surface of the scene reconstruction (SR) mesh of the environment around the user. Tap to Place uses a combination of two selections and head movement to place an object. You can start the placement with a single selection, use head movement to control the object's position, and place the object in the scene with another select action.

## How to use

1. Set up the scene.
    - Create a new Unity scene.
    - Add a cube to the scene, change the scale to 0.2 and change the position to (0, 0, 0.7).
1. Attach Tap to Place to a game object with a collider.

    - When the Tap to Place component is added, a Solver Handler will also be attached. Tap to Place derives from the [Solver](solver.md) class, which requires a Solver Handler. The position of a Tap to Place object is calculated relative to the `TrackedTargetType` within the Solver Handler. By default, the Head is the `TrackedTargetType`--that is, when the head moves, the object follows if it's selected.  The `TrackedTargetType` can also be set to Controller Ray, which has the object follow the controller. The first group of properties in the Tap to Place inspector are the [Common Solver Properties](solver.md#common-solver-properties).  
    > [!IMPORTANT]
    > Tap to Place is a stand-alone Solver and cannot be chained with other Solvers. It cannot be chained because `SolverHandler.UpdateSolvers` is used to update the object's position while it's being placed.
    - Tap to Place Properties:
        - `Auto Start`: If true, the Tap to Place solver will start out controlling the position of the game object to be placed. The object will immediately start following the TrackedTargetType (Head or Controller Ray). This value must be modified before Start() is invoked to have any effect.
        - `Default Placement Distance`: The default distance (in meters) an object will be placed relative to the TrackedTargetType forward in the SolverHandler. If the raycast doesn't hit the surface, the game object will be placed at the default placement distance.
        - `Max Raycast Distance`: The maximum distance (meters) for the raycast based on the 'TrackedTargetType' origin. This raycast looks for a surface to place a selected object.
        - `UseDefaultSurfaceNormalOffset`: This property is true by default. It ensures the object being placed is aligned on a surface. If this property is true, the default surface normal offset will be applied instead of any value specified for the `SurfaceNormalOffset` property. If false, the value for `SurfaceNormalOffset` will be applied. The default surface normal offset is the collider's extends along the z-axis.
        - `Surface Normal Offset`: The distance between the center of the game object to place and a surface along the surface normal if the raycast hits a surface. This property is only applied to an object if `UseDefaultSurfaceNormalOffset` is false.
        - `Keep Orientation Vertical`: If true, the game object to place will remain upright and in line with Vector3.up.
        - `Rotate According to Surface`: If false, the game object to place won't change its rotation according to the surface hit. The object will face the camera while IsBeingPlaced is true.
        - `Magnetic Surfaces`: An array of LayerMasks to execute from highest to lowest priority. The first layer mask to provide a raycast hit will be used for position calculations.
        - `Debug Enabled`: If true and in the Unity Editor, the normal of the raycast hit will be drawn in yellow. Debug enabled is useful when `RotateAccordingToSurface` is true because it draws the normal of the surface hit, which visually explains why the object is set at its current orientation.
        - `On Placing Started`: This event is triggered once when the game object to place is selected.
        - `On Placing Stopped`: This event is triggered once when the game object to place is unselected, placed.

1. Testing Tap to Place behavior in editor
    - Press play and hold the space bar to show an input simulation hand.
    - Move the hand until the cube is in focus and simulate a click with the input simulation hand by clicking with the left mouse.
        - If colliders aren't present in the scene, the object will follow the `TrackedTargetType` at the defined `Default Placement Distance`.
    - The object will follow the movement of the `TrackedTargetType` after selection. To simulate head movement in the editor, press the WASD keys. Change head rotation by clicking and holding the right mouse button.
    - To stop placing the object, click again.  The object doesn't need to be in focus for the stop placement click. Focus is only required for the initial click that starts the placement process.