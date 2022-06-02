
# Deploying to a Quest Device

This page describes how to deploy your Unity Project with MRTK onto a Quest device. To add MRTK to your project, please refer to the [setup page](../setup.md).

>**Note**
>We **strongly recommend** using [Holographic remoting](https://docs.microsoft.com/windows/mixed-reality/develop/unity/preview-and-debug-your-app) for rapid iteration and testing on HoloLens 2, which allows for instant testing on the device without the need for compile + deploy. You can also play in Unity directly with the PC's current OpenXR runtime, including [Windows Mixed Reality](https://www.microsoft.com/p/openxr-tools-for-windows-mixed-reality/9n5cvvl23qbt), [SteamVR on OpenXR](https://www.steamvr.com/), or even [Oculus Link for Quest](https://support.oculus.com/airlink). See our complete list [here](../debugging-and-testing.md).

## Deployment Prerequisites

1. Follow [these steps](https://developer.oculus.com/documentation/unity/book-unity-gsg/) to ensure that your project is ready to deploy on the Quest Device.

1. Ensure that [developer mode](https://developer.oculus.com/documentation/native/android/mobile-device-setup/) is enabled on your device. Installing the Oculus ADB Drivers is optional.

1. Ensure that your [project settings](../setup.md#mrtk3-configuration-new-unity-project) are configured correctly to use Open XR pipeline and MRTK's feature set. **These features are required to deploy your project onto the Oculus Quest** 

1. Navigate to **File > Build Settings** 

1. Under **Platform**, select **Android**. Switch the platform to **Android**.

1. Navigate to **Edit > Project Settings**

1. Under **Project Settings**, navigate to **XR Plug-in Management** and enable **OpenXR** under the **Android** tab. Ensure that **Initialize XR on Startup** is selected and that no feature groups are enabled.


    ![Oculus XR Plug-in Management window](../.images/oculus-xr-plug-in-management.png)

1. Under **Project Settings**, navigate to **XR Plug-in Management > OpenXR > Interaction Profiles** and change it so only **Oculus Touch Controller Profile** is present. 

1. Under **Project Settings**, navigate to **XR Plug-in Management > OpenXR > OpenXR Feature Groups** and ensure the following are checked under **All Features**

    ![Oculus OpenXR](../.images/oculus-openxr.png)

    >[!NOTE] 
    >Several red error icons and yellow warning icon may appear during this process. Click on the icon to open the **OpenXR Project Validation** tool and select **Fix All** to address the issues. You may need to do this several times.

    >[!NOTE] 
    >If you do not see **Oculus Quest Support** under the **OpenXR Feature Groups** panel, make sure you've downloaded the Mixed Reality OpenXR Plugin via the [MR Feature Tool](https://docs.microsoft.com/windows/mixed-reality/develop/unity/welcome-to-mr-feature-tool)


## Deploying to Device

1. After you have the project configured, proceed to (Generate Build)[https://developer.oculus.com/documentation/unity/unity-build/#generate-build]

    >[!NOTE] 
    >**Do not** follow the Configure Settings instructions on Oculus's documentation page. Their instructions require the use of the Oculus Integration SDK, and uses the Oculus XR Plug-in rather than the OpenXR Plug-in.

    >[!NOTE] 
    >It is recommended to **Build and Run** your project, as it will deploy it directly onto your Oculus Quest.
