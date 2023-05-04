---
title: Solvers
description: Overview of Solvers in MRTK3
author: marlenaklein-msft
ms.author: marlenaklein
ms.date: 5/5/2023
ms.localizationpriority: high
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Solvers
---

# Solvers &#8212; MRTK3

![Solver Main](../../../../mrtk3-overview/images/UXBuildingBlocks/MRTK_Solver_Main.png)

Solvers are components that facilitate calculating an object's position and orientation according to a predefined algorithm. Example: placing an object on the surface that the user's gaze raycast intersects with.

The Solver system deterministically defines an order of operations for these transform calculations as there's no reliable way to specify to Unity the update order for components.

Solvers offer a range of behaviors to attach objects to other objects or systems. One other example would be a tag-along object that hovers in front of the user based on the camera. A solver could also be attached to a controller and an object to make the object tag along the controller. All solvers can be safely stacked--for example, a tag-along behavior plus surface magnetism plus momentum.

## How to use

The Solver system consists of three categories of scripts:

* `Solver`: The abstract base class that all solvers derive from. It provides state tracking, smoothing parameters and implementation, automatic solver system integration, and update order.
* `SolverHandler`: Sets the reference object tracking against (example: the main camera transform, hand ray, etc.), handles the  gathering of solver components, and executes updating them in the proper order.

The third category is the solver itself. The following solvers provide the building blocks for basic behavior:

* [`Orbital`](#orbital): Locks to a specified position and offset from the referenced object.
* `ConstantViewSize`: Scales to maintain a constant size relative to the view of the referenced object.
* [`RadialView`](#radialview): Keeps the object within a view cone cast by the referenced object.
* [`Follow`](#follow): Keeps the object within a set of user-defined bounds of the referenced object.
* [`InBetween`](#inbetween): Keeps an object in between two tracked objects.
* [`SurfaceMagnetism`](#surfacemagnetism): casts rays to surfaces in the world and aligns the object to that surface.
* [`DirectionalIndicator`](#directionalindicator): Determines the position and orientation of an object as a directional indicator. From the point of reference of the SolverHandler Tracked Target, this indicator will orient towards the DirectionalTarget supplied.
* `Momentum`: Applies acceleration/velocity/friction to simulate momentum and springiness for an object being moved by other solvers/components.
* [`HandConstraint`](#hand-menu-with-handconstraint-and-handconstraintpalmup): Constraints object to follow hands in a region that doesn't intersect the GameObject with the hands. Useful for hand constrained interactive content such as menus, etc. This solver is intended to work with `XRNode`.
* [`HandConstraintPalmUp`](#hand-menu-with-handconstraint-and-handconstraintpalmup): Derives from HandConstraint but includes logic to test if the palm is facing the user before activation. This solver only works with `XRNode` controllers and will behave just like its base class with other controller types.

To use the Solver system, add one of the components listed above to a GameObject. Since all Solvers require a `SolverHandler`, one will be created automatically by Unity.

> [!NOTE]
> Examples of how to use the Solvers system can be found in the **SolverExamples.scene** file.

## How to change tracking reference

The *Tracked Target Type* property of the `SolverHandler` component defines the point of reference all solvers will use to calculate their algorithms. For example, a value type of `Head` with a simple `SurfaceMagnetism` component will result in a ray cast from the head and in the direction of the user's gaze for solving which surface is hit. Potential values for the `TrackedTargetType` property are:

* *Head: Point of reference is the transform of the main camera
* *ControllerRay*: Point of reference is the `LinePointer` transform on a controller (that is, pointer origin on a motion controller or hand controller) pointing in the direction of the line ray
  * Use the `TrackedHandedness` property to select the handedness preference (that is, Left, Right, Both)
* *HandJoint*: Point of reference is the transformation of a specific hand joint
  * Use the `TrackedHandedness` property to select the handedness preference (that is, Left, Right, Both)
  * Use the  `TrackedHandJoint` property to determine the joint transform to utilize
* *CustomOverride*: Point of reference from the assigned `TransformOverride`

> [!NOTE]
> For both *ControllerRay* and *HandJoint* types, the solver handler will attempt to provide the left controller/hand transform first and then the right if the former is unavailable or unless the `TrackedHandedness` property specifies otherwise.

> [!IMPORTANT]
> Most solvers use the forward vector of the tracked transform target supplied by the `SolverHandler`. When using a *Hand Joint* tracked target type, the forward vector of the palm joint may point through the fingers and not through the palm. This depends on the platform supplying the hand joint data. For input simulation and Windows Mixed Reality, the *up vector* points up through the palm (in other words, green vector is up, blue vector is forward).
>
> To overcome this, update the *Additional Rotation* property on the `SolverHandler` to **<90, 0, 0>**. This ensures that the forward vector supplied to the solvers is pointing through the palm and outward away from the hand.
>
> Alternatively, use the *Controller Ray* tracked target type to get similar behavior for pointing with hands.

## How to chain solvers

It's possible to add multiple `Solver` components to the same GameObject, thus chaining their algorithms. The `SolverHandler` components handle updating all solvers on the same GameObject. By default, the `SolverHandler` calls `GetComponents<Solver>()` on Start, which will return the Solvers in the order they appear in the inspector.

Furthermore, setting the *Updated Linked Transform* property to true will instruct that `Solver` to save its calculated position, orientation, and scale to an intermediary variable accessible by all Solvers (that is, `GoalPosition`). When false, the `Solver` will update the GameObject's transform directly. By saving the transform properties to an intermediary location, other Solvers can perform their calculations starting from the intermediary variable. This is because Unity doesn't allow updates to gameObject.transform to stack within the same frame.

> [!NOTE]
> Developers can modify the order of execution of Solvers by setting the `SolverHandler.Solvers` property directly.

## How to create a new solver

All solvers must inherit from the abstract base class, `Solver`. The primary requirements of a Solver extension involve overriding the `SolverUpdate` method. In this method, developers should update the inherited `GoalPosition`, `GoalRotation`, and `GoalScale` properties to the desired values. Furthermore, it's valuable to leverage `SolverHandler.TransformTarget` as the frame of reference desired by the consumer.

The code provided below gives an example of a new Solver component called `InFront` that places the attached object 2 m in front of the `SolverHandler.TransformTarget`. The consumer sets `SolverHandler.TrackedTargetType` as `Head`, then the `SolverHandler.TransformTarget` will be the camera transform, and thus this Solver will place the attached GameObject 2 m in front of the users' gaze every frame.

```c#
/// <summary>
/// InFront solver positions an object 2m in front of the tracked transform target
/// </summary>
public class InFront : Solver
{
    ...

    public override void SolverUpdate()
    {
        if (SolverHandler != null && SolverHandler.TransformTarget != null)
        {
            var target = SolverHandler.TransformTarget;
            GoalPosition = target.position + target.forward * 2.0f;
        }
    }
}
```

## Solver implementation guides

### Common solver properties

Every Solver component has a core set of identical properties that control the core Solver behavior.

If *Smoothing* is enabled, the Solver will gradually update the transform of the GameObject over time to the calculated values. Every transform component's *LerpTime* property determines the speed of this change. For example, a higher *MoveLerpTime* value will result in slower increments in movement between frames.

If *MaintainScale* is enabled, the Solver will utilize the GameObject's default local scale.

### Orbital

The `Orbital` class is a tag-along component that behaves like planets in a solar system. This Solver will ensure the attached GameObject orbits around the tracked transform. Thus, if the *Tracked Target Type* of the `SolverHandler` is set to `Head`, then the GameObject will orbit around the user's head with a fixed offset applied.

Developers can modify this fixed offset to keep menus or other scene components at eye level or waist level, etc., around a user. This is done by changing the *Local Offset* and *World Offset* properties. The *Orientation Type* property determines the rotation applied to the object if it should maintain its original rotation or always face the camera or face whatever transform is driving its position.

### RadialView

The `RadialView` is another tag-along component that keeps a particular portion of a GameObject within the frustum of the user's view.

The *Min & Max View Degrees* properties determine how much of a portion of the GameObject must always be in view.

The *Min & Max Distance* properties determine how far the GameObject should be kept from the user. For example, walking towards the GameObject with a *Min Distance* of 1 m will push the GameObject away to ensure it's never closer than 1 m to the user.

Generally, the `RadialView` is used with *Tracked Target Type* set to `Head` so that the component follows the user's gaze. However, this component can function to be kept in *"view"* of any *Tracked Target Type*.

### Follow

The `Follow` class positions an element in front of the tracked target relative to its local forward axis. The element can be loosely constrained (also known as "tag-along") so that it doesn't follow until the tracked target moves beyond user-defined bounds.

It works similarly to the RadialView solver, with additional controls to manage *Max Horizontal & Vertical View Degrees* and mechanisms to alter the object's *Orientation*.

### InBetween

The `InBetween` class will keep the attached GameObject between two transforms. The GameObject's own `SolverHandler` *Tracked Target Type* and the `InBetween` component's *Second Tracked Target Type* property define these two transform endpoints. Generally, both types will be set to `CustomOverride` and the resulting `SolverHandler.TransformOverride` and `InBetween.SecondTransformOverride` values are set to the two tracked endpoints.

The `InBetween` component will create another `SolverHandler` component at runtime based on the *Second Tracked Target Type* and *Second Transform Override* properties.

Along the line between two transforms, the `PartwayOffset` defines where the object will be placed with 0.5 as halfway, 1.0 at the first transform, and 0.0 at the second transform.

### SurfaceMagnetism

The `SurfaceMagnetism` works by performing a raycast against a set LayerMask of surfaces and placing the GameObject at that contact point.

The *Surface Normal Offset* will place the GameObject a set distance in meters away from the surface in the direction of the normal at the hit point on the surface.

Conversely, the *Surface Ray Offset* will place the GameObject a set distance in meters away from the surface but in the opposite direction of the raycast performed. Thus, if the raycast is the user's gaze, the GameObject will move closer along the line from the hit point on the surface to the camera.

The *Orientation Mode* determines the type of rotation to apply in relation to the normal on the surface.

* *None* - No rotation applied
* *TrackedTarget* - Object will face the tracked transform driving the raycast
* *SurfaceNormal* - Object will align based on normal at hit point on surface
* *Blended* - Object will align based on normal at hit point on surface AND based on facing the tracked transform.

To force the associated GameObject to stay vertical in any mode other than *None*, enable *Keep Orientation Vertical*.

> [!NOTE]
> Use the *Orientation Blend* property to control the balance between rotation factors when *Orientation Mode* is set to *Blended*. A value of 0.0 will have orientation entirely driven by *TrackedTarget* mode, and a value of 1.0 will have orientation driven entirely by *SurfaceNormal*.

#### Determining what surfaces can be hit

When adding a `SurfaceMagnetism` component to a GameObject, it's important to consider the layer of the GameObject and its children, if any have colliders. The component works by performing various raycasts to determine which surface to "magnet" itself against. Suppose the solver GameObject has a collider on one of the layers listed in the `MagneticSurfaces` property of `SurfaceMagnetism`. In that case, the raycast will likely hit itself, resulting in the GameObject attaching to its own collider point. This odd behavior can be avoided by setting the main GameObject and all children to the *Ignore Ray cast* layer or modifying the `MagneticSurfaces` LayerMask array appropriately.

Conversely, a `SurfaceMagnetism` GameObject won't collide with surfaces on a layer not listed in the `MagneticSurfaces` property. We recommend that you place all desired surfaces on a dedicated layer (that is, *Surfaces*) and set the `MagneticSurfaces` property to just this layer.  Using *default* or *everything* may result in UI components or cursors contributing to the solver.

Finally, surfaces farther than the `MaxRaycastDistance` property setting will be ignored by the `SurfaceMagnetism` raycasts.

### DirectionalIndicator

The `DirectionalIndicator` class is a tag-along component that orients itself to the direction of the desired point in space. It's most commonly used when the *Tracked Target Type* of the `SolverHandler` is set to `Head`. In this fashion, a UX component with the `DirectionalIndicator` solver will direct a user to look at the desired point in space. This point is determined by the *Directional Target* property.

If the directional target is viewable by the user or whichever frame of reference is set in the [`SolverHandler`](xref:Microsoft.MixedReality.Toolkit.Utilities.Solvers.SolverHandler), then this solver will disable all [`Renderer`](https://docs.unity3d.com/ScriptReference/Renderer.html) components underneath it. If not viewable, then everything will be enabled on the indicator.

The size of the indicator will shrink the closer the user is to capturing the *Directional Target* in their FOV.

* *Min Indicator Scale* - The minimum scale for the indicator object
* *Max Indicator Scale* - The maximum scale for the indicator object

* *Visibility Scale Factor* - Multiplier to increase or decrease the FOV which determines if the *Directional Target* point is viewable or not
* *View Offset* - From the viewpoint of the frame of reference (that is, camera possibly) and in the indicator direction, this property defines how far the object is from the center of the viewport.

*Directional Indicator Example Scene (Assets/MRTK/Examples/Demos/Solvers/Scenes/DirectionalIndicatorSolverExample.unity)*

### Hand menu with HandConstraint and HandConstraintPalmUp

The `HandConstraint` behavior provides a solver that constrains the tracked object to a region safe for hand constrained content (such as hand UI, menus, etc.) Safe regions are considered areas that don't intersect with the hand. A derived class of `HandConstraint` called `HandConstraintPalmUp` is also included to demonstrate a common behavior of activating the solver-tracked object when the palm is facing the user.

[See the Hand Menu documentation](../../../../mrtk3-uxcomponents/packages/uxcomponents/hand-menu.md) for examples of using the Hand Constraint solver to create hand menus.