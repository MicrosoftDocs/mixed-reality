---
title: Visual themes
description: Overview Visual Themes flexible control of UX assets in MRTK
author: CDiaz-MS
ms.author: cadia
ms.date: 01/12/2021
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK Themes,
---

# Visual themes &#8212; MRTK2

Themes allow for flexible control of UX assets in response to various states transitions. This may involve changing a button's color, resizing an element in response to focus, etc. The Visual Themes framework is made up of two key pieces: 1) configuration and 2) runtime engines.

[Theme configurations](#theme-configuration) are definitions of properties and types while [Theme Engines](#theme-engines) are classes that consume the configurations and implement the logic to update transforms, materials, and more at runtime.

## Theme configuration

Theme configurations are [ScriptableObjects](https://docs.unity3d.com/Manual/class-ScriptableObject.html) that define how Theme Engines will be initialized at runtime. They define what properties and values to utilize in response to input or other state changes when the app is running. As [ScriptableObjects](https://docs.unity3d.com/Manual/class-ScriptableObject.html) assets, theme configurations can be defined once and then re-used across different UX components.

To create a new [`Theme`](xref:Microsoft.MixedReality.Toolkit.UI.Theme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) asset:

1) Right click in the *Project Window*
1) Select **Create** > **Mixed Reality Toolkit** > **Theme**

Example Theme configuration assets can be found under `MRTK/SDK/Features/UX/Interactable/Themes`.

![Theme ScriptableObject example in inspector](../images/visual-themes/ThemeInspectorExample.png)

### States

When creating a new [`Theme`](xref:Microsoft.MixedReality.Toolkit.UI.Theme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true), the first thing to set is what states are available. The *States* property indicates how many values a Theme configuration needs to define as there will be one value per state. In the example image above, the [default states defined for the Interactable](interactable.md#general-input-settings) component are *Default*, *Focus*, *Pressed*, and *Disabled*. These are defined in the `DefaultInteractableStates` (Assets/MRTK/SDK/Features/UX/Interactable/States) asset file.

To create a new [`State`](xref:Microsoft.MixedReality.Toolkit.UI.States?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) asset:

1) Right click in the *Project Window*
1) Select **Create** > **Mixed Reality Toolkit** > **State**

![States ScriptableObject example in inspector](../images/interactable/DefaultInteractableStates.png)

A [`State`](xref:Microsoft.MixedReality.Toolkit.UI.States?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) ScriptableObject defines both the list of states as well as the type of *StateModel* to create for these states. A *StateModel* is a class that extends [`BaseStateModel`](xref:Microsoft.MixedReality.Toolkit.UI.BaseStateModel?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) and implements the state machine logic to generate the current state at runtime. The current state from this class is generally used by Theme Engines at runtime to dictate what values to set against material properties, GameObject transforms, and more.

### Theme engine properties

Outside of *States*, a [`Theme`](xref:Microsoft.MixedReality.Toolkit.UI.Theme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) asset also defines a list of Theme Engines and the associated properties for these engines. A [Theme engine](#theme-engines) again defines the logic to set the correct values against a GameObject at runtime.

A [`Theme`](xref:Microsoft.MixedReality.Toolkit.UI.Theme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) asset can define multiple Theme Engines to achieve sophisticated visual states transitions targeting multiple GameObject properties.

**Theme Runtime**

Defines the class type of the Theme engine that will be created

**Easing**

Some *Theme Engines*, if they define their property [IsEasingSupported](xref:Microsoft.MixedReality.Toolkit.UI.InteractableThemeBase.IsEasingSupported?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) as true, support easing between states. For example, lerping between two colors when a state change occurs. The *Duration* defines in seconds how long to ease from start value to end value and the *Animation Curve* defines the rate of change during that time period.

**Shader properties**

Some *Theme Engines*, if they define their property [AreShadersSupported](xref:Microsoft.MixedReality.Toolkit.UI.InteractableThemeBase.AreShadersSupported?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) as true, will modify particular shader properties at runtime. The *Shader* and *Property* fields define the shader property to target.

### Create a theme configuration via code

In general, it is easier to design Theme configurations via the Unity inspector but there are cases where Themes must be dynamically generated at runtime via code. The code snippet below gives an example of how to accomplish this task.

To help expedite development, the following helper methods are useful for simplifying setup.

[`Interactable.GetDefaultInteractableStates()`](xref:Microsoft.MixedReality.Toolkit.UI.Interactable?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) - creates a new States ScriptableObject with the four default state values used in the [Interactable](interactable.md) component.

[`ThemeDefinition.GetDefaultThemeDefinition<T>()`](xref:Microsoft.MixedReality.Toolkit.UI.ThemeDefinition?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) - Every Theme Engine defines a default configuration with the correct properties needed for that Theme runtime type. This helper creates a definition for the given Theme Engine type.

```c#
// This code example builds a Theme ScriptableObject that can be used with an Interactable component.
// A random color is selected for the on pressed state every time this code is executed.

// Use the default states utilized in the Interactable component
var defaultStates = Interactable.GetDefaultInteractableStates();

// Get the default configuration for the Theme engine InteractableColorTheme
var newThemeType = ThemeDefinition.GetDefaultThemeDefinition<InteractableColorTheme>().Value;

// Define a color for every state in our Default Interactable States
newThemeType.StateProperties[0].Values = new List<ThemePropertyValue>()
{
    new ThemePropertyValue() { Color = Color.black},  // Default
    new ThemePropertyValue() { Color = Color.black}, // Focus
    new ThemePropertyValue() { Color = Random.ColorHSV()},   // Pressed
    new ThemePropertyValue() { Color = Color.black},   // Disabled
};

// Create the Theme configuration asset
Theme testTheme = ScriptableObject.CreateInstance<Theme>();
testTheme.States = defaultStates;
testTheme.Definitions = new List<ThemeDefinition>() { newThemeType };
```

## Theme engines

A [Theme Engine](#theme-engines) is a class that extends from the [`InteractableThemeBase`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableThemeBase?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) class. These classes are instantiated at runtime and configured with a [`ThemeDefinition`](xref:Microsoft.MixedReality.Toolkit.UI.ThemeDefinition?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) object as outlined earlier.

### Default theme engines

MRTK ships with a default set of Theme Engines listed below:

- [`InteractableActivateTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableActivateTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
- [`InteractableAnimatorTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableAnimatorTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
- [`InteractableAudioTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableAudioTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
- [`InteractableColorChildrenTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableColorChildrenTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
- [`InteractableColorTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableColorTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
- [`InteractableGrabScaleTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableGrabScaleTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
- [`InteractableMaterialTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableMaterialTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
- [`InteractableOffsetTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableOffsetTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
- [`InteractableRotationTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableRotationTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
- [`InteractableScaleTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableScaleTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
- [`InteractableShaderTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableShaderTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
- [`InteractableStringTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableStringTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
- [`InteractableTextureTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableTextureTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
- [`ScaleOffsetColorTheme`](xref:Microsoft.MixedReality.Toolkit.UI.ScaleOffsetColorTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)

The default Theme Engines can be found under `MRTK/SDK/Features/UX/Scripts/VisualThemes/ThemeEngines`.

### Custom theme engines

As stated, a Theme Engine is defined as a class that extends from the [`InteractableThemeBase`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableThemeBase?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) class. Thus, new Theme Engine need only extend this class and implement the following:

#### Mandatory implementations

[`public abstract void SetValue(ThemeStateProperty property, int index, float percentage)`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableThemeBase.SetValue%2A?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)

For the given property, which can be identified by `ThemeStateProperty.Name`, set its current state value on the targeted GameObject host (i.e set the material color, etc). The *index* indicates the current state value to access and the *percentage*, a float between 0 and 1, is used for easing/lerping between values.

[`public abstract ThemePropertyValue GetProperty(ThemeStateProperty property)`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableThemeBase.GetProperty%2A?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)

For the given property, which can be identified by `ThemeStateProperty.Name`, return the current value set on the targeted Host  GameObject (i.e the current material color, the current local position offset, etc). This is primarily used for caching the start value when easing between states.

[`public abstract ThemeDefinition GetDefaultThemeDefinition()`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableThemeBase.GetDefaultThemeDefinition?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)

Returns a [`ThemeDefinition`](xref:Microsoft.MixedReality.Toolkit.UI.ThemeDefinition?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) object that defines the default properties and configuration needed for the custom theme

`protected abstract void SetValue(ThemeStateProperty property, ThemePropertyValue value)`

Protected variant of the public `SetValue()` definition, except provided ThemePropertyValue to set instead of directing to use index and/or percentage configuration.

#### Recommended overrides

[`InteractableThemeBase.Init(GameObject host, ThemeDefinition settings)`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableThemeBase?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)

Perform any initialization steps here targeting the provided *GameObject* parameter and using the properties and configurations defined in the *ThemeDefinition* parameter. It is recommended to call `base.Init(host, settings)` at the beginning of an override.

[`InteractableThemeBase.IsEasingSupported`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableThemeBase.IsEasingSupported?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)

If the custom Theme Engine can support easing between values which is configured via the [`ThemeDefinition.Easing`](xref:Microsoft.MixedReality.Toolkit.UI.ThemeDefinition.Easing?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) property.

[`InteractableThemeBase.AreShadersSupported`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableThemeBase.AreShadersSupported?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)

If the custom Theme Engine can support targeting shader properties. It is recommended to extend from [`InteractableShaderTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableShaderTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) to benefit from the existing infrastructure to efficiently set/get shader properties via [MaterialPropertyBlocks](https://docs.unity3d.com/ScriptReference/MaterialPropertyBlock.html). The shader property information is stored in each [`ThemeStateProperty`](xref:Microsoft.MixedReality.Toolkit.UI.ThemeStateProperty?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) via [`ThemeStateProperty.TargetShader`](xref:Microsoft.MixedReality.Toolkit.UI.ThemeStateProperty.TargetShader?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) and [`ThemeStateProperty.ShaderPropertyName`](xref:Microsoft.MixedReality.Toolkit.UI.ThemeStateProperty.ShaderPropertyName?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true).

> [!NOTE]
> If extending [`InteractableShaderTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableShaderTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true), it can also be useful to override the [InteractableShaderTheme.DefaultShaderProperty](xref:Microsoft.MixedReality.Toolkit.UI.InteractableShaderTheme.DefaultShaderProperty?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) via *new*.
>
> Example code: `protected new const string DefaultShaderProperty = "_Color";`
>
> Furthermore, the following classes below extend the [`InteractableShaderTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableShaderTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) class which again uses [MaterialPropertyBlocks](https://docs.unity3d.com/ScriptReference/MaterialPropertyBlock.html) to modify shader property values. This approach [helps performance](https://docs.unity3d.com/Manual/DrawCallBatching.html) because *MaterialPropertyBlocks* do not create new instanced materials when values change. However, accessing the typical [Material](https://docs.unity3d.com/ScriptReference/Material.html) class properties will not return expected values. Use *MaterialPropertyBlocks* to get and validate current material property values (i.e *_Color* or *_MainTex*).
>
> - [`InteractableColorChildrenTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableColorChildrenTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
> - [`InteractableColorTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableColorTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
> - [`InteractableTextureTheme`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableTextureTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)
> - [`ScaleOffsetColorTheme`](xref:Microsoft.MixedReality.Toolkit.UI.ScaleOffsetColorTheme?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)

[`InteractableThemeBase.Reset`](xref:Microsoft.MixedReality.Toolkit.UI.InteractableThemeBase.Reset?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true)

Directs the theme to reset any modified properties back to their original values that were set on the host GameObject when this theme engine was initialized.  

### Custom theme engine example

The class below is an example of a custom new Theme Engine. This implementation will find a [MeshRenderer](https://docs.unity3d.com/ScriptReference/MeshRenderer.html) component on the initialized host object and control its visibility based on the current state.

```c#
using Microsoft.MixedReality.Toolkit.UI;
using System;
using System.Collections.Generic;
using UnityEngine;

// This class demonstrates a custom theme to control a Host's MeshRenderer visibility
public class MeshVisibilityTheme : InteractableThemeBase
{
    // Bool visibility does not make sense for lerping
    public override bool IsEasingSupported => false;

    // No material or shaders are being modified
    public override bool AreShadersSupported => false;

    // Cache reference to the MeshRenderer component on our Host
    private MeshRenderer meshRenderer;

    public MeshVisibilityTheme()
    {
        Types = new Type[] { typeof(MeshRenderer) };
        Name = "Mesh Visibility Theme";
    }

    // Define a default configuration to simplify initialization of this theme engine
    // There is only one state property with a value per available state
    // This state property is a boolean that defines whether the renderer is enabled
    public override ThemeDefinition GetDefaultThemeDefinition()
    {
        return new ThemeDefinition()
        {
            ThemeType = GetType(),
            StateProperties = new List<ThemeStateProperty>()
            {
                new ThemeStateProperty()
                {
                    Name = "Mesh Visible",
                    Type = ThemePropertyTypes.Bool,
                    Values = new List<ThemePropertyValue>(),
                    Default = new ThemePropertyValue() { Bool = true }
                },
            },
            CustomProperties = new List<ThemeProperty>()
        };
    }

    // When initializing, cache a reference to the MeshRenderer component
    public override void Init(GameObject host, ThemeDefinition definition)
    {
        base.Init(host, definition);

        meshRenderer = host.GetComponent<MeshRenderer>();
    }

    // Get the current state of the MeshRenderer visibility
    public override ThemePropertyValue GetProperty(ThemeStateProperty property)
    {
        return new ThemePropertyValue()
        {
            Bool = meshRenderer.enabled
        };
    }

    // Update the MeshRenderer visibility based on the property state value data
    public override void SetValue(ThemeStateProperty property, int index, float percentage)
    {
        meshRenderer.enabled = property.Values[index].Bool;
    }
}
```

## End-to-end example

Extending off of the custom Theme Engine defined in the earlier section, the code example below demonstrates how to control this theme at runtime. In particular, how to set the current state on the theme so the MeshRenderer visibility is updated appropriately.

> [!NOTE]
> `theme.OnUpdate(state,force)` should generally be called in the Update() method to support Theme Engines that utilize easing/lerping between values.

```c#
using Microsoft.MixedReality.Toolkit.UI;
using System;
using System.Collections.Generic;
using UnityEngine;

public class MeshVisibilityController : MonoBehaviour
{
    private MeshVisibilityTheme themeEngine;
    private bool hideMesh = false;

    private void Start()
    {
        // Define the default configuration. State 0 will be on while State 1 will be off
        var themeDefinition = ThemeDefinition.GetDefaultThemeDefinition<MeshVisibilityTheme>().Value;
        themeDefinition.StateProperties[0].Values = new List<ThemePropertyValue>()
        {
            new ThemePropertyValue() { Bool = true }, // show state
            new ThemePropertyValue() { Bool = false }, // hide state
        };

        // Create the actual Theme engine and initialize it with the GameObject we are attached to
        themeEngine = (MeshVisibilityTheme)InteractableThemeBase.CreateAndInitTheme(themeDefinition, this.gameObject);
    }

    private void Update()
    {
        // Update the theme engine to set our MeshRenderer visibility
        // based on our current state (i.e the hideMesh variable)
        themeEngine.OnUpdate(Convert.ToInt32(hideMesh));
    }

    public void ToggleVisibility()
    {
        // Alternate state of visibility
        hideMesh = !hideMesh;
    }
}
```

## See also

- [Interactable](interactable.md)
