# [Unity 2020 + OpenXR](#tab/openxr)

### 4. Clone the default Spatial Awareness Mesh Observer Profile

With the **Spatial Awareness** tab still selected, expand the **XR SDK Windows Mixed Reality Spatial Mesh Observer** section, then click the **Clone** button to open the Clone Profile window:

![Unity MixedRealityToolkit component with Windows Mixed Reality Spatial Mesh Observer section expanded](../images/mr-learning-base/base-03-section1-step4-1xrsdk.png)

In the Clone Profile window, enter a suitable **Profile Name**, for example, _GettingStarted_MixedRealitySpatialAwarenessMeshObserverProfile_, then click the **Clone** button to create an editable copy of the **DefaultMixedRealitySpatialAwarenessMeshObserverProfile**:

![Unity MixedRealityToolkit clone Spatial Mesh Observer Profile popup window](../images/mr-learning-base/base-03-section1-step4-2xrsdk.png)

The newly created Spatial Awareness Mesh Observer Profile is now automatically assigned to your Spatial Awareness System Profile:

![Unity MixedRealityToolkit component with newly created custom MixedRealitySpatialAwarenessMeshObserverProfile applied](../images/mr-learning-base/base-03-section1-step4-3xrsdk.png)


# [Unity 2019/2020 + Windows XR Plugin](#tab/winxr)

### 4. Clone the default Spatial Awareness Mesh Observer Profile

With the **Spatial Awareness** tab still selected, expand the **XR SDK Windows Mixed Reality Spatial Mesh Observer** section, then click the **Clone** button to open the Clone Profile window:

![Unity MixedRealityToolkit component with Windows Mixed Reality Spatial Mesh Observer section expanded](../images/mr-learning-base/base-03-section1-step4-1xrsdk.png)

> [!NOTE]
> above screenshot is from **Unity 2020** If you are using **Unity 2019**, there will be two tabs, one for Legacy XR and one for XRSDK, ensure that you are in XRSDK tab and clone the **XR SDK Windows Mixed Reality Spatial Mesh Observer**.

In the Clone Profile window, enter a suitable **Profile Name**, for example, _GettingStarted_MixedRealitySpatialAwarenessMeshObserverProfile_, then click the **Clone** button to create an editable copy of the **DefaultMixedRealitySpatialAwarenessMeshObserverProfile**:

![Unity MixedRealityToolkit clone Spatial Mesh Observer Profile popup window](../images/mr-learning-base/base-03-section1-step4-2xrsdk.png)

The newly created Spatial Awareness Mesh Observer Profile is now automatically assigned to your Spatial Awareness System Profile:

![Unity MixedRealityToolkit component with newly created custom MixedRealitySpatialAwarenessMeshObserverProfile applied](../images/mr-learning-base/base-03-section1-step4-3xrsdk.png)

# [Legacy WSA](#tab/wsa)

### 4. Clone the default Spatial Awareness Mesh Observer Profile

With the **Spatial Awareness** tab still selected, ensure that you are in **Legacy XR** tab and expand the **Windows Mixed Reality Spatial Mesh Observer** section, then click the **Clone** button to open the Clone Profile window:

![Unity MixedRealityToolkit component with Windows Mixed Reality Spatial Mesh Observer section expanded](../images/mr-learning-base/base-03-section1-step4-1.png)

In the Clone Profile window, enter a suitable **Profile Name**, for example, _GettingStarted_MixedRealitySpatialAwarenessMeshObserverProfile_, then click the **Clone** button to create an editable copy of the **DefaultMixedRealitySpatialAwarenessMeshObserverProfile**:

![Unity MixedRealityToolkit clone Spatial Mesh Observer Profile popup window](../images/mr-learning-base/base-03-section1-step4-2.png)

The newly created Spatial Awareness Mesh Observer Profile is now automatically assigned to your Spatial Awareness System Profile:

![Unity MixedRealityToolkit component with newly created custom MixedRealitySpatialAwarenessMeshObserverProfile applied](../images/mr-learning-base/base-03-section1-step4-3.png)

### 5. Change the visibility of the spatial awareness mesh

In the **Spatial Mesh Observer Settings**, change the **Display Option** to **Occlusion** to make the spatial mapping mesh invisible while still functional:

![Unity MixedRealityToolkit component with Spatial Mesh Observer Display Option set to Occlusion](../images/mr-learning-base/base-03-section1-step5-1.png)

> [!NOTE]
> Although the spatial mapping mesh is not visible, it is still present and functional. For example, any holograms behind the spatial mapping mesh, such as a hologram behind a physical wall, will not be visible.

You just learned how to modify a setting in the MRTK profile. As you can see, to customize the MRTK settings, you first need to create copies of the default profiles. Because the default profiles are not editable, you will always have them as references if you want to revert to the default settings. To learn more about MRTK profiles and their architecture, you can refer to the [MRTK profile configuration guide](/windows/mixed-reality/mrtk-unity/configuration/mixed-reality-configuration-guide) in the [MRTK Documentation Portal](/windows/mixed-reality/mrtk-unity).

