# [Unity 2019/2020 + Windows XR Plugin](#tab/winxr)

### 1. Clone the default Configuration Profile

> [!NOTE]
> The Configuration Profile is the top-level profile. Consequently, to be able to edit any other profiles, you first have to clone the Configuration Profile.

In the Hierarchy window, select the **MixedRealityToolkit** object, then in the Inspector window, verify that the **MixedRealityToolkit** Configuration Profile is set to the **DefaultXRSDKConfigurationProfile**:

![Unity MixedRealityToolkit component with DefaultHoloLens2ConfigurationProfile selected](../../images/mr-learning-base/base-03-section1-step1-1xrsdk.png)

With the **MixedRealityToolkit** object still selected, in the Inspector window, click the **Copy & Customize** button to open the Clone Profile window:

![Unity MixedRealityToolkit component Copy & Customize button](../../images/mr-learning-base/base-03-section1-step1-2xrsdk.png)

In the Clone Profile window, enter a suitable **Profile Name**, for example, _GettingStarted_XRSDKConfigurationProfile_, then click the **Clone** button to create an editable copy of the **DefaultXRSDKConfigurationProfile**:

![Unity MixedRealityToolkit clone Configuration Profile popup window](../../images/mr-learning-base/base-03-section1-step1-3xrsdk.png)

The newly created Configuration Profile is now assigned as the Configuration Profile for your scene:

![Unity MixedRealityToolkit component with newly created custom HoloLens2ConfigurationProfile applied](../../images/mr-learning-base/base-03-section1-step1-4xrsdk.png)

In the Unity menu, select **File** > **Save** to save your scene.

> [!TIP]
> Remember to save your work throughout the tutorials.

### 2. Enable the Spatial Awareness System

In the Hierarchy window, select the **MixedRealityToolkit** object, then in the Inspector window, select the **Spatial Awareness** tab, and then check the **Enable Spatial Awareness System** checkbox:

![Unity MixedRealityToolkit component with Spatial Awareness System enabled](../../images/mr-learning-base/base-03-section1-step2-1xrsdk.png)

> [!NOTE]
> For future projects, if your app doesn't need to respond to or interact with the environment, it's recommended to keep the spatial awareness turned off to reduce performance cost.

### 3. Clone the default Spatial Awareness System Profile

In the **Spatial Awareness** tab, click the **Clone** button to open the Clone Profile window:

![Unity MixedRealityToolkit component with Spatial Awareness tab selected](../../images/mr-learning-base/base-03-section1-step3-1xrsdk.png)

In the Clone Profile window, enter a suitable **Profile Name**, for example, _GettingStarted_XRSDKSpatialAwarenessSystemProfile_, then click the **Clone** button to create an editable copy of the **DefaultXRSDKSpatialAwarenessSystemProfile**:

![Unity MixedRealityToolkit clone Spatial Awareness System Profile popup window](../../images/mr-learning-base/base-03-section1-step3-2xrsdk.png)

The newly created Spatial Awareness System Profile is now automatically assigned to your Configuration Profile:

![Unity MixedRealityToolkit component with newly created custom MixedRealitySpatialAwarenessSystemProfile applied](../../images/mr-learning-base/base-03-section1-step3-3xrsdk.png)

### 4. Clone the default Spatial Awareness Mesh Observer Profile

With the **Spatial Awareness** tab still selected, expand the **XR SDK Windows Mixed Reality Spatial Mesh Observer** section, then click the **Clone** button to open the Clone Profile window:

![Unity MixedRealityToolkit component with Windows Mixed Reality Spatial Mesh Observer section expanded](../../images/mr-learning-base/base-03-section1-step4-1xrsdk.png)

In the Clone Profile window, enter a suitable **Profile Name**, for example, _GettingStarted_MixedRealitySpatialAwarenessMeshObserverProfile_, then click the **Clone** button to create an editable copy of the **DefaultMixedRealitySpatialAwarenessMeshObserverProfile**:

![Unity MixedRealityToolkit clone Spatial Mesh Observer Profile popup window](../../images/mr-learning-base/base-03-section1-step4-2xrsdk.png)

The newly created Spatial Awareness Mesh Observer Profile is now automatically assigned to your Spatial Awareness System Profile:

![Unity MixedRealityToolkit component with newly created custom MixedRealitySpatialAwarenessMeshObserverProfile applied](../../images/mr-learning-base/base-03-section1-step4-3xrsdk.png)

### 5. Change the visibility of the spatial awareness mesh

In the **Spatial Mesh Observer Settings**, change the **Display Option** to **Occlusion** to make the spatial mapping mesh invisible while still functional:

![Unity MixedRealityToolkit component with Spatial Mesh Observer Display Option set to Occlusion](../../images/mr-learning-base/base-03-section1-step5-1xrsdk.png)

> [!NOTE]
> Although the spatial mapping mesh is not visible, it is still present and functional. For example, any holograms behind the spatial mapping mesh, such as a hologram behind a physical wall, will not be visible.

You just learned how to modify a setting in the MRTK profile. As you can see, to customize the MRTK settings, you first need to create copies of the default profiles. Because the default profiles are not editable, you will always have them as references if you want to revert to the default settings. To learn more about MRTK profiles and their architecture, you can refer to the [MRTK profile configuration guide](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/MixedRealityConfigurationGuide.html) in the [MRTK Documentation Portal](https://microsoft.github.io/MixedRealityToolkit-Unity/README.html).


# [Legacy WSA](#tab/wsa)

### 1. Clone the default Configuration Profile

> [!NOTE]
> The Configuration Profile is the top-level profile. Consequently, to be able to edit any other profiles, you first have to clone the Configuration Profile.

In the Hierarchy window, select the **MixedRealityToolkit** object, then in the Inspector window, change the **MixedRealityToolkit** Configuration Profile to the **DefaultHoloLens2ConfigurationProfile**:

![Unity MixedRealityToolkit component with DefaultHoloLens2ConfigurationProfile selected](../../images/mr-learning-base/base-03-section1-step1-1.png)

With the **MixedRealityToolkit** object still selected, in the Inspector window, click the **Copy & Customize** button to open the Clone Profile window:

![Unity MixedRealityToolkit component Copy & Customize button](../../images/mr-learning-base/base-03-section1-step1-2.png)

In the Clone Profile window, enter a suitable **Profile Name**, for example, _GettingStarted_HoloLens2ConfigurationProfile_, then click the **Clone** button to create an editable copy of the **DefaultHololens2ConfigurationProfile**:

![Unity MixedRealityToolkit clone Configuration Profile popup window](../../images/mr-learning-base/base-03-section1-step1-3.png)

The newly created Configuration Profile is now assigned as the Configuration Profile for your scene:

![Unity MixedRealityToolkit component with newly created custom HoloLens2ConfigurationProfile applied](../../images/mr-learning-base/base-03-section1-step1-4.png)

In the Unity menu, select **File** > **Save** to save your scene.

> [!TIP]
> Remember to save your work throughout the tutorials.

### 2. Enable the Spatial Awareness System

In the Hierarchy window, select the **MixedRealityToolkit** object, then in the Inspector window, select the **Spatial Awareness** tab, and then check the **Enable Spatial Awareness System** checkbox:

![Unity MixedRealityToolkit component with Spatial Awareness System enabled](../../images/mr-learning-base/base-03-section1-step2-1.png)

> [!NOTE]
> For future projects, if your app doesn't need to respond to or interact with the environment, it's recommended to keep the spatial awareness turned off to reduce performance cost.

### 3. Clone the default Spatial Awareness System Profile

In the **Spatial Awareness** tab, click the **Clone** button to open the Clone Profile window:

![Unity MixedRealityToolkit component with Spatial Awareness tab selected](../../images/mr-learning-base/base-03-section1-step3-1.png)

In the Clone Profile window, enter a suitable **Profile Name**, for example, _GettingStarted_MixedRealitySpatialAwarenessSystemProfile_, then click the **Clone** button to create an editable copy of the **DefaultMixedRealitySpatialAwarenessSystemProfile**:

![Unity MixedRealityToolkit clone Spatial Awareness System Profile popup window](../../images/mr-learning-base/base-03-section1-step3-2.png)

The newly created Spatial Awareness System Profile is now automatically assigned to your Configuration Profile:

![Unity MixedRealityToolkit component with newly created custom MixedRealitySpatialAwarenessSystemProfile applied](../../images/mr-learning-base/base-03-section1-step3-3.png)

### 4. Clone the default Spatial Awareness Mesh Observer Profile

With the **Spatial Awareness** tab still selected, expand the **Windows Mixed Reality Spatial Mesh Observer** section, then click the **Clone** button to open the Clone Profile window:

![Unity MixedRealityToolkit component with Windows Mixed Reality Spatial Mesh Observer section expanded](../../images/mr-learning-base/base-03-section1-step4-1.png)

In the Clone Profile window, enter a suitable **Profile Name**, for example, _GettingStarted_MixedRealitySpatialAwarenessMeshObserverProfile_, then click the **Clone** button to create an editable copy of the **DefaultMixedRealitySpatialAwarenessMeshObserverProfile**:

![Unity MixedRealityToolkit clone Spatial Mesh Observer Profile popup window](../../images/mr-learning-base/base-03-section1-step4-2.png)

The newly created Spatial Awareness Mesh Observer Profile is now automatically assigned to your Spatial Awareness System Profile:

![Unity MixedRealityToolkit component with newly created custom MixedRealitySpatialAwarenessMeshObserverProfile applied](../../images/mr-learning-base/base-03-section1-step4-3.png)

### 5. Change the visibility of the spatial awareness mesh

In the **Spatial Mesh Observer Settings**, change the **Display Option** to **Occlusion** to make the spatial mapping mesh invisible while still functional:

![Unity MixedRealityToolkit component with Spatial Mesh Observer Display Option set to Occlusion](../../images/mr-learning-base/base-03-section1-step5-1.png)

> [!NOTE]
> Although the spatial mapping mesh is not visible, it is still present and functional. For example, any holograms behind the spatial mapping mesh, such as a hologram behind a physical wall, will not be visible.

You just learned how to modify a setting in the MRTK profile. As you can see, to customize the MRTK settings, you first need to create copies of the default profiles. Because the default profiles are not editable, you will always have them as references if you want to revert to the default settings. To learn more about MRTK profiles and their architecture, you can refer to the [MRTK profile configuration guide](https://docs.microsoft.com/windows/mixed-reality/mrtk-docs/configuration/mixed-reality-configuration-guide.md) in the [MRTK Documentation Portal](https://docs.microsoft.com/windows/mixed-reality/mrtk-docs).
