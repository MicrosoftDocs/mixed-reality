# [OpenXR (XR SDK)](#tab/openxr)

MRTK's support for the Oculus Quest comes via two different sources, Unity's OpenXR Plugin package for the XR SDK pipeline and the Mixed Reality OpenXR Plugin package. The **OpenXR XRSDK Data Provider** enables the use of both sources and must be used to deploy MRTK on the Oculus Quest.

You can use the [Mixed Reality OpenXR Plugin](../../configuration/getting-started-with-mrtk-and-xrsdk.md#openxr) to deploy MRTK applications to the Oculus Quest. After enabling OpenXR, ensure any required features are enabled (likely "Hand Tracking" and "Meta Quest Support").

![Plugin management OpenXR Android](../../features/images/xrsdk/PluginManagementOpenXRAndroid.png)

Ensure your profile (if not using the MRTK default) is set up with the OpenXR Device Manager. See [Configuring MRTK for the XR SDK pipeline](../../configuration/getting-started-with-mrtk-and-xrsdk.md#configuring-mrtk-for-the-xr-sdk-pipeline) for more information on ensuring your profile is ready for OpenXR.

![OpenXR input settings](../../features/images/xrsdk/InputSystemOpenXR.png)

# [Oculus (XR SDK)](#tab/xr)

MRTK's support for the Oculus Quest comes via two different sources, Unity's Oculus Plugin package for the XR SDK pipeline and the Oculus Integration Unity package. The **Oculus XRSDK Data Provider** enables the use of both sources and must be used to deploy MRTK on the Oculus Quest.

The [Unity XR SDK Pipeline](https://docs.unity3d.com/Manual/XR.html) enables the use of Oculus Touch controllers and head tracking with the Oculus Quest.
This pipeline is the standard for developing XR applications in Unity 2019.3 and beyond. To use this pipeline, make sure that you using **Unity 2019.3 or newer**. This is **required** to deploy MRTK applications to the Oculus Quest.

The [Oculus Integration Unity package](https://assetstore.unity.com/packages/tools/integration/oculus-integration-82022) allows for the use of **hand tracking** and controller models with the Oculus Quest.

## Setting up the XR SDK Pipeline for Oculus Quest

1. Ensure that the **Oculus XR Plugin** is installed under **Window --> Package Manager**

    ![Oculus XR Plugin Package](../../images/cross-platform/oculus-quest/OculusXRPluginPackage.png)

1. Make sure that the Oculus Plug-in Provider is included in your project by going to **Edit --> Project Settings --> XR Plug-in Management --> Plug-in Providers**

    ![Oculus Plugin Provider](../../images/cross-platform/oculus-quest/OculusPluginProvider.png)

## Setting up the Oculus Integration Unity package to enable hand tracking

1. Download and import [Oculus Integration](https://assetstore.unity.com/packages/tools/integration/oculus-integration-82022) from the Unity Asset Store. The latest version tested to
work is 39.0.0. Prior versions will not work due to change made to the Oculus API. All versions of the Oculus Integration Package can be found from this [archive](https://developer.oculus.com/downloads/package/unity-integration-archive/).

1. Navigate to Mixed Reality Toolkit > Utilities > Oculus > Integrate Oculus Integration Unity Modules. Doing this will update the asmdefs with definitions and references needed for the
relevant Oculus Quest code to function. It will also update the csc file to filter out the obsolete warnings produced by the Oculus Integration assets. The MRTK repo contains a csc file that converts warnings to errors, this conversion halts the MRTK-Quest configuration process.

    ![Oculus Integration asmdef](../../images/cross-platform/oculus-quest/OculusIntegrationAsmdef.png)

1. In the imported Oculus folder (It should be found at Assets/Oculus), there is a scriptable object called OculusProjectConfig. In that config file, you need to set HandTrackingSupport
to "Controllers and Hands".

    ![Oculus Integration Controller And Hands](../../images/cross-platform/oculus-quest/OculusIntegrationControllerAndHands.png)

## Using the Oculus XR SDK Data Provider

::: moniker range=">= mrtkunity-2021-05"

1. Configure your profile to use the **Oculus XR SDK Data Provider**
    - If not intending to modify the configuration profiles
        - Use any of the default MRTK profiles, which are all configured across Unity's XR pipelines. The previous DefaultXRSDKConfigurationProfile is now labeled obsolete.
        - Go to [Build and deploy your project to Oculus Quest](../oculus-quest-mrtk.md#build-and-deploy-your-project-to-oculus-quest).
    - Otherwise follow the following:
        - Select the MixedRealityToolkit game object in the hierarchy and select **Copy and Customize** to clone the default mixed reality profile.

            ![Clone Profile](../../images/cross-platform/CloneProfile.png)

        - Select the **Input** Configuration Profile.

            ![Input Configuration Profile](../../images/cross-platform/InputConfigurationProfile.png)

        - Select **Clone** in the input system profile to enable modification.

            ![Clone Input System Profile](../../images/cross-platform/CloneInputSystemProfile.png)

        - Open the **Input Data Providers** section, select **Add Data Provider** at the top, and new data provider will be added at the end of the list.  Open the new data provider and set the **Type** to **Microsoft.MixedReality.Toolkit.XRSDK.Oculus > OculusXRSDKDeviceManager**.

            ![Oculus Add XRSDK Data Provider](../../images/cross-platform/oculus-quest/OculusAddDataXRSDKProvider.png)
::: moniker-end
::: moniker range="< mrtkunity-2021-05"

1. Configure your profile to use the **Oculus XR SDK Data Provider**
    - If not intending to modify the configuration profiles
        - Change your profile to DefaultXRSDKConfigurationProfile.
        - Go to [Build and deploy your project to Oculus Quest](../oculus-quest-mrtk.md#build-and-deploy-your-project-to-oculus-quest).
    - Otherwise follow the following:
        - Select the MixedRealityToolkit game object in the hierarchy and select **Copy and Customize** to clone the default mixed reality profile.

            ![Clone Profile](../../images/cross-platform/CloneProfile.png)

        - Select the **Input** Configuration Profile.

            ![Input Configuration Profile](../../images/cross-platform/InputConfigurationProfile.png)

        - Select **Clone** in the input system profile to enable modification.

            ![Clone Input System Profile](../../images/cross-platform/CloneInputSystemProfile.png)

        - Open the **Input Data Providers** section, select **Add Data Provider** at the top, and new data provider will be added at the end of the list.  Open the new data provider and set the **Type** to **Microsoft.MixedReality.Toolkit.XRSDK.Oculus > OculusXRSDKDeviceManager**.

            ![Oculus Add XRSDK Data Provider](../../images/cross-platform/oculus-quest/OculusAddDataXRSDKProvider.png)
::: moniker-end

1. The Oculus XR SDK Data Provider includes an OVR Camera Rig Prefab which automatically configures the project with an OVR Camera Rig and OVR Hands to properly route input. Manually adding an OVR Camera Rig to the scene will require manual configuration of settings and input.

## Removing Oculus Integration from the Project

1. Navigate to Mixed Reality Toolkit > Oculus > Separate Oculus Integration Unity Modules
    ![Oculus Separation asmdef](../../images/cross-platform/oculus-quest/OculusSeparationAsmdef.png)
1. Let Unity refresh as references in the Microsoft.MixedReality.Toolkit.Providers.Oculus.asmdef and other files are modified in this step
1. Close Unity
1. Close Visual Studio, if it's open
1. Open File Explorer and navigate to the root of the MRTK Unity project
1. Delete the UnityProjectName/Library directory
1. Delete the UnityProjectName/Assets/Oculus directory
1. Delete the UnityProjectName/Assets/Oculus.meta file
1. Reopen Unity
