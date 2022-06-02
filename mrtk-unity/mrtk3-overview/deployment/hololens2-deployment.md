
# Deploy an MRTK3 project to HoloLens 2

This page describes how to deploy your Unity Project with MRTK onto a HoloLens 2. To add MRTK to your project, please refer to the [setup page](../setup.md).

>**Note**
>We **strongly recommend** using [Holographic remoting](https://docs.microsoft.com/windows/mixed-reality/develop/unity/preview-and-debug-your-app) for rapid iteration and testing on Hololens 2, which allows for instant testing on the device without the need for compile + deploy. You can also play in Unity directly with the PC's current OpenXR runtime, including [Windows Mixed Reality](https://www.microsoft.com/p/openxr-tools-for-windows-mixed-reality/9n5cvvl23qbt), [SteamVR on OpenXR](https://www.steamvr.com/), or even [Oculus Link for Quest](https://support.oculus.com/airlink). See our complete list [here](../debugging-and-testing.md).


## Deployment Prerequisites

1. Ensure that your [project settings](../setup.md#mrtk3-configuration-new-unity-project) are configured correctly to use the OpenXR pipeline and MRTK's feature set. **These features are required to deploy your project onto Hololens** 

## Deploying to Device

1. After you have the project configured, proceed to [Build the Unity Project](https://docs.microsoft.com/windows/mixed-reality/develop/unity/build-and-deploy-to-hololens#build-the-unity-project).

1. Once built, you will need to deploy the project through [Visual Studio](https://docs.microsoft.com/windows/mixed-reality/develop/advanced-concepts/using-visual-studio?tabs=hl2).

