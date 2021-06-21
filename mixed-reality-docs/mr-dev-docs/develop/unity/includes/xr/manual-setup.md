# [OpenXR](#tab/openxr)

Install the OpenXR plugin with the new Mixed Reality Feature Tool application. Follow the [installation and usage instructions](../../welcome-to-mr-feature-tool.md) and select the **Mixed Reality OpenXR Plugin** package in the **Platform Support** category:

![Mixed Reality Feature Tool packages window with open xr plugin highlighted](../../images/feature-tool-openxr.png)

### Setting your build target

If you're targeting Desktop VR, we suggest using the PC Standalone Platform selected by default on a new Unity project:

![Screenshot of Build Settings window open in the unity editor with PC, Mac & Standalone platform highlighted](../../images/wmr-config-img-3.png)

If you're targeting HoloLens 2, you need to switch to the Universal Windows Platform:

1. Select **File > Build Settings...**
2. Select **Universal Windows Platform** in the Platform list and select **Switch Platform**
3. Set **Architecture** to **ARM64**
4. Set **Target device** to **HoloLens**
5. Set **Build Type** to **D3D Project**
6. Set **Target SDK Version** to **Latest installed**

![Screenshot of Build Settings window open in unity editor with Universal Windows Platform highlighted](../../images/wmr-config-img-4.png)

### Configuring XR Plugin Management for OpenXR

To set OpenXR as the the runtime in Unity:

1. In the Unity Editor, navigate to **Edit > Project Settings**
2. In the list of Settings, select **XR Plugin Management**
3. Select **Install XR Plugin Management** if it appears
![Screenshot of Project Settings window open in unity editor with XR Plugin management highlighted](../../images/wmr-config-img-5.png)
4. Check the **Initialize XR on Startup** box
5. If targeting Desktop VR, stay on the PC Standalone tab (the monitor) and check the **OpenXR** and **Windows Mixed Reality feature set** boxes
6. If targeting HoloLens 2, switch to the Universal Windows Platform tab (the Windows logo) and select the **OpenXR** and **Microsoft HoloLens feature set** boxes

![Screenshot of the project settings panel open in the Unity editor with XR Plug-in management highlighted](../../images/openxr-img-05.png)

> [!IMPORTANT]
> If you see a yellow warning icon next to **OpenXR Plugin**, click the icon and select **Fix All** before continuing. The Unity Editor may need to restart itself for the changes to take effect.

![Screenshot of the OpenXR project validation window](../../images/openxr-img-06.png)

### Optimization

If you're developing for HoloLens 2, select the **Mixed Reality > Project > Apply recommended project settings for HoloLens 2** menu item to get better app performance.

![Screenshot of the mixed reality menu item open with OpenXR selected](../../images/openxr-img-08.png)

You're now ready to begin developing with OpenXR in Unity!  Continue on to the next section to learn how to use the OpenXR samples.

### Unity sample projects for OpenXR and HoloLens 2

Check out the [OpenXR Mixed Reality samples repo](https://github.com/microsoft/OpenXR-Unity-MixedReality-Samples) for sample unity projects showcasing how to build Unity applications for HoloLens 2 or Mixed Reality headsets using the Mixed Reality OpenXR plugin.

Or, if you're ready to get started on your own from a blank project, proceed to the [Camera setup](../../camera-in-unity.md) article.

# [Windows XR](#tab/windowsxr)

> [!CAUTION]
> The Windows XR plugin is deprecated in Unity 2021.1 and will be removed in Unity 2021.2.  For Unity 2020 development, Microsoft recommends the OpenXR plugin instead.

If you're targeting Desktop VR, we suggest using the PC Standalone Platform selected by default on a new Unity project:

![Screenshot of Build Settings window open in the unity editor with PC, Mac & Standalone platform highlighted](../../images/wmr-config-img-3.png)

If you're targeting HoloLens 2, you need to switch to the Universal Windows Platform:

1.  Select **File > Build Settings...**
2.  Select **Universal Windows Platform** in the Platform list and select **Switch Platform**
3.  Set **Architecture** to **ARM64**
4.  Set **Target device** to **HoloLens**
5.  Set **Build Type** to **D3D Project**
6.  Set **Target SDK Version** to **Latest installed**
7.	Set **Build configuration** to **Release** because there are known performance issues with Debug

![Screenshot of Build Settings window open in unity editor with Universal Windows Platform highlighted](../../images/wmr-config-img-4.png)

After setting your platform, you need to let Unity know to create an [immersive view](../../../../design/app-views.md) instead of a 2D view when exported:

1. In the Unity Editor, navigate to **Edit > Project settings** and select **XR Plugin Management**

2. Select **Install XR Plugin Management** if it appears

![Screenshot of Project Settings window open in unity editor with XR Plugin management highlighted](../../images/wmr-config-img-5.png)

3. Select **Initialize XR on Startup** and **Windows Mixed Reality**

![Screenshot of Project settings window open in unity editor with XR Plugin management highlighted](../../images/wmr-config-img-7.png)

4. Select the **XR Plug-in Management** > **Windows Mixed Reality** section, check all boxes and set **Depth Buffer Format** to **Depth Buffer 16 Bit**

![Screenshot of Project settings window open in unity editor with Windows Mixed Reality section highlighted](../../images/wmr-config-img-8.png)

# [Legacy XR](#tab/legacy)

> [!CAUTION]
> Legacy XR is deprecated in Unity 2019 and removed in Unity 2020.

If you're targeting Desktop VR, we suggest using the PC Standalone Platform selected by default on a new Unity project:

![Screenshot of Build Settings window open in the unity editor with PC, Mac & Standalone platform highlighted](../../images/wmr-config-img-3.png)

If you're targeting HoloLens 2, you need to switch to the Universal Windows Platform:

1.  Select **File > Build Settings...**
2.  Select **Universal Windows Platform** in the Platform list and select **Switch Platform**
3.  Set **Architecture** to **ARM64**
4.  Set **Target device** to **HoloLens**
5.  Set **Build Type** to **D3D Project**
6.  Set **Target SDK Version** to **Latest installed**
7.	Set **Build configuration** to **Release** because there are known performance issues with Debug

![Screenshot of Build Settings window open in unity editor with Universal Windows Platform highlighted](../../images/wmr-config-img-4.png)

After setting your platform, you need to let Unity know to create an [immersive view](../../../../design/app-views.md) instead of a 2D view when exported.

1. Open **Player Settings...** from the **Build Settings... window** and expand the **XR Settings** group
2. In the **XR Settings** section, select **Virtual Reality Supported** to add the Virtual Reality Devices list
3. Set **Depth Format** to **16-bit depth** and check **Enable Depth Buffer Sharing**
4. Set **Stereo Rendering Mode** to **Single Pass Instanced**
5. Select **WSA Holographic Remoting Supported** if you'd like to use holographic play mode remoting

![Screenshot of Project settings window open in unity editor with Player settings section highlighted](../../images/wmr-config-img-9.png)
