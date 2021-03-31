# [Unity 2019/2020 + Windows XR Plugin](#tab/winxr)

## Ensuring Eye Gaze Input capability and adding Eye Gaze Data Provider

In the Unity menu, select Mixed Reality Toolkit > Utilities > **Configure Unity Project** to open the **MRTK Project Configurator** window, then in the **UWP Capabilities** section, verify that **Enable Eye Gaze Input Capability** is greyed out:

![Unity MRTK Project Configurator window](../images/mr-learning-base/base-08-section1-step1-1.png)

> [!NOTE]
> The Gaze Input capability should have been enabled during the [Apply the MRTK Project Configurator settings](../mr-learning-base-02.md#configuring-the-unity-project) instructions when you configured the Unity project at the beginning of this tutorial series. However, if it is not enabled, make sure you enable it now.

In the Hierarchy window, select the MixedRealityToolkit object, then in the Inspector window, navigate to the Input tab:

* Expand the **Input Data Providers** , click the **+ Add Data Provider** button to add a new Data Provider

![Adding Eye data provider 1](../images/mr-learning-base/base-08-section1-step1-2.png)

Assign **Microsoft.MixedReality.ToolKit.WindowsMixedReality.Input** > **WindowsMixedRealityEyeGazeProvider** to the **Type** field of the new Data Provider.

![Adding Eye data provider 2](../images/mr-learning-base/base-08-section1-step1-3.png)

# [Legacy WSA](#tab/wsa)

## Ensuring the Eye Gaze Input capability is enabled

In the Unity menu, select Mixed Reality Toolkit > Utilities > **Configure Unity Project** to open the **MRTK Project Configurator** window, then in the **UWP Capabilities** section, verify that **Enable Eye Gaze Input Capability** is greyed out:

![Unity MRTK Project Configurator window](../images/mr-learning-base/base-08-section1-step1-1.png)

> [!NOTE]
> The Gaze Input capability should have been enabled during the [Apply the MRTK Project Configurator settings](../mr-learning-base-02.md#creating-the-scene-and-configuring-mrtk) instructions when you configured the Unity project at the beginning of this tutorial series. However, if it is not enabled, make sure you enable it now.
