
# Unity scenes

**The following are sample scenes shipped with the sample Unity project (under `Samples/Assets/Scenes`):**

**HandInteractionExample**

You can experience various hand interaction and UI examples such as poke, touch, grab, and two-handed manipulations.

![Hand Menu](images/hand-interaction-examples.png)

**BoundsControlExamples**

Various configurations of BoundsControl, showing both flattened and 3D bounds.

**CanvasExample**

Shows a collection of UX components built on the Unity Canvas. These UX components are built on XRI, support full XR interactions, but are also authored in Canvas and support traditional interactions with mouse, keyboard, and gamepad.

**DialogExample**

This scene demonstrates use of the Dialog control.

**EyeGazeExample**

Example of using the Gaze Interactor to highlight objects within a scene.

**HandMenuExamples**

Demonstrates using a menu appearing beside the hand.

**InteractableButtonExamples**

An example of different styles of interactable buttons.

**NearMenuExamples**

Near interaction menu examples.

**ObjectBarExample**

Shows Object Bar, a dynamic collection of objects positioned in a horizontal or vertical stack with an auto sized back plate.

**SampleEmptyMRTKScene**

The sample empty MRTK scene only contains the core MRTK prefab (**MRTK XR Rig**) and the input simulator prefab (**MRTKInputSimulator**). It's intended to give developers an empty scene with the MRTK essentials only to get started.

**SlateDrawingExample**

A demonstration of using MRTK3 to create a simple drawing application.

**SpatialMappingExample**

The spatial mapping example scene demonstrates using `ARMeshManager` (**MRTK XR Rig > ARSpatialMeshManager**) in MRTK3 to visualize the spatial mesh.

**TabViewExample**

Shows a collection of toggles that control the visibility of associated game objects.

**ToggleCollectionExample**

Demonstrates the `ToggleCollection` script which enforces a single toggle in a collection to be active at once.

**UIBackplateExample**

The scene demonstrates `UIBackplate.prefab`, which you can use to construct various types of UI panels and menus.

**UITearSheet**

This scene showcases all available UI building blocks and their permutations in MRTK. All controls are based on the new Mixed Reality Design Language.

**The following are DataBinding and Theming sample scenes also shipped with the sample Unity project:**

**Assets\CoreUX Theming Example\Scenes\AudioTheming**

Change the sound of a virtual keyboard using Data Binding and Theming.

**Assets\CoreUX Theming Example\Scenes\BatteryLevelExample**

Using Data Binding to update a battery level display.

**Assets\CoreUX Theming Example\Scenes\CoreUXThemingExample**

Example of using Data Binding and Theming to control the look of UX Core components.

**Assets\DataBinding Example\Scenes\DataBindingExamples**

Demonstration of using Data Binding and Theming to bind to data sources.

## Creating a new Scene with MRTK3

1. Create a new unity scene 
1. Add the **MRTK XR Rig** prefab
1. Remove the **Main Camera** Game Object because the **MRTK XR Rig** already contains one

    ![Hand Menu](images\mrtk-xr-rig.png)

1. Add the MRTK Input Simulator prefab to your scene.

    >[!Note]
    >This step is optional, but required by in-editor simulations.


![MRTK input simulator hierarchy pane](images\mrtk-input-simulator.png)


