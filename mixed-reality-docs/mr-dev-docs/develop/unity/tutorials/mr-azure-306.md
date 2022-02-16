---
title: HoloLens (1st gen) and Azure 306 - Streaming video
description: Complete this course to learn how to implement Azure Media Services within a mixed reality application.
author: drneil
ms.author: jemccull
ms.date: 07/04/2018
ms.topic: article
keywords: azure, mixed reality, academy, unity, tutorial, api, media services, streaming video, 360, immersive, vr, Windows 10, Visual Studio
---

# HoloLens (1st gen) and Azure 306: Streaming video

<br>

>[!NOTE]
>The Mixed Reality Academy tutorials were designed with HoloLens (1st gen) and Mixed Reality Immersive Headsets in mind.  As such, we feel it is important to leave these tutorials in place for developers who are still looking for guidance in developing for those devices.  These tutorials will **_not_** be updated with the latest toolsets or interactions being used for HoloLens 2.  They will be maintained to continue working on the supported devices. There will be a new series of tutorials that will be posted in the future that will demonstrate how to develop for HoloLens 2.  This notice will be updated with a link to those tutorials when they are posted.

<br> 

![final product -start](images/AzureLabs-Lab6-00.png)
![final product -start](images/AzureLabs-Lab6-01.png)

In this course you will learn how connect your Azure Media Services to a Windows Mixed Reality VR experience to allow streaming 360 degree video playback on immersive headsets. 

**Azure Media Services** are a collection of services that gives you broadcast-quality video streaming services to reach larger audiences on today’s most popular mobile devices. For more information, visit the [Azure Media Services page](https://azure.microsoft.com/services/media-services).

Having completed this course, you will have a mixed reality immersive headset application, which will be able to do the following:

1. Retrieve a 360 degree video from an **Azure Storage**, through the **Azure Media Service**.

2. Display the retrieved 360 degree video within a Unity scene.

3. Navigate between two scenes, with two different videos.

In your application, it is up to you as to how you will integrate the results with your design. This course is designed to teach you how to integrate an Azure Service with your Unity Project. It is your job to use the knowledge you gain from this course to enhance your mixed reality application.

## Device support

<table>
<tr>
<th>Course</th><th style="width:150px"> <a href="/hololens/hololens1-hardware">HoloLens</a></th><th style="width:150px"> <a href="/windows/mixed-reality/enthusiast-guide/immersive-headset-hardware-details">Immersive headsets</a></th>
</tr><tr>
<td> MR and Azure 306: Streaming video</td><td style="text-align: center;"> </td><td style="text-align: center;"> ✔️</td>
</tr>
</table>

## Prerequisites

> [!NOTE]
> This tutorial is designed for developers who have basic experience with Unity and C#. Please also be aware that the prerequisites and written instructions within this document represent what has been tested and verified at the time of writing (May 2018). You are free to use the latest software, as listed within the [install the tools article](../../install-the-tools.md), though it should not be assumed that the information in this course will perfectly match what you'll find in newer software than what's listed below.

We recommend the following hardware and software for this course:

- A development PC, [compatible with Windows Mixed Reality](https://support.microsoft.com/help/4039260/windows-10-mixed-reality-pc-hardware-guidelines) for immersive (VR) headset development
- [Windows 10 Fall Creators Update (or later) with Developer mode enabled](../../install-the-tools.md#installation-checklist)
- [The latest Windows 10 SDK](../../install-the-tools.md#installation-checklist)
- [Unity 2017.4](../../install-the-tools.md#installation-checklist)
- [Visual Studio 2017](../../install-the-tools.md#installation-checklist)
- A [Windows Mixed Reality immersive (VR) headset](/windows/mixed-reality/enthusiast-guide/immersive-headset-hardware-details)
- Internet access for Azure setup and data retrieval
- Two 360-degree videos in mp4 format (you can find some royalty-free videos [at this download page](https://www.mettle.com/360vr-master-series-free-360-downloads-page))

## Before you start

1.	To avoid encountering issues building this project, it is strongly suggested that you create the project mentioned in this tutorial in a root or near-root folder (long folder paths can cause issues at build-time).
2.  Set up and test your Mixed Reality Immersive Headset.

    > [!NOTE]
    > You will **not** require Motion Controllers for this course. If you need support setting up the Immersive Headset, please click [link on how to set up Windows Mixed Reality](https://support.microsoft.com/help/4043101/windows-10-set-up-windows-mixed-reality).

## Chapter 1 - The Azure Portal: creating the Azure Storage Account

To use the **Azure Storage Service**, you will need to create and configure a **Storage Account** in the Azure portal.

1.	Log in to the [Azure Portal](https://portal.azure.com).

    > [!NOTE]
    > If you do not already have an Azure account, you will need to create one. If you are following this tutorial in a classroom or lab situation, ask your instructor or one of the proctors for help setting up your new account.

2.  Once you are logged in, click on **Storage accounts** in the left menu.

    ![Azure Storage Account Setup](images/AzureLabs-Lab6-02.png)

3.  On the **Storage Accounts** tab, click on **Add**.

    ![Azure Storage Account Setup](images/AzureLabs-Lab6-03.png)

4.  In the **Create storage account** tab:

    1.  Insert a **Name** for your account, be aware this field only accepts numbers, and lowercase letters.

    2.  For **Deployment model,** select **Resource manager**.

    3.  For **Account kind**, select **Storage (general purpose v1)**.

    4.  For **Performance**, select **Standard*.**

    5.  For **Replication** select **Locally-redundant storage (LRS)**.

    6.  Leave **Secure transfer required** as **Disabled**.

    7.  Select a **Subscription**.

    8.  Choose a **Resource group** or create a new one. A resource group provides a way to monitor, control access, provision and manage billing for a collection of Azure assets.

    9.  Determine the **Location** for your resource group (if you are creating a new Resource Group). The location would ideally be in the region where the application would run. Some Azure assets are only available in certain regions.

5.  You will need to confirm that you have understood the Terms and Conditions applied to this Service.

    ![Azure Storage Account Setup](images/AzureLabs-Lab6-04.png)

6.  Once you have clicked on **Create**, you will have to wait for the service to be created, this might take a minute.

7.  A notification will appear in the portal once the Service instance is created.

    ![Azure Storage Account Setup](images/AzureLabs-Lab6-05.png)

8.  At this point you do not need to follow the resource, simply move to the next Chapter.

## Chapter 2 - The Azure Portal: creating the Media Service

To use the Azure Media Service, you will need to configure an instance of the service to be made available to your application (wherein the account holder needs to be an Admin).

1.  In the Azure Portal, click on **Create a resource** in the top left corner, and search for **Media Service,** press **Enter**. The resource you want currently has a pink icon; click this, to show a new page.

    ![The Azure Portal](images/AzureLabs-Lab6-06.png)

2.  The new page will provide a description of the **Media Service**. At the bottom left of this prompt, click the **Create** button, to create an association with this service.

    ![The Azure Portal](images/AzureLabs-Lab6-07.png)

3.  Once you have clicked on **Create** a panel will appear where you need to provide some details about your new Media Service:

    1.  Insert your desired **Account Name** for this service instance.

    2.  Select a **Subscription**.

    3. Choose a **Resource Group** or create a new one. A resource group provides a way to monitor, control access, provision and manage billing for a collection of Azure assets. It is recommended to keep all the Azure services associated with a single project (e.g. such as these labs) under a common resource group). 
    
    > If you wish to read more about Azure Resource Groups, please follow this [link on how to manage Azure Resource Groups](/azure/azure-resource-manager/resource-group-portal).

    4.  Determine the **Location** for your resource group (if you are creating a new Resource Group). The location would ideally be in the region where the application would run. Some Azure assets are only available in certain regions.

    5.  For the **Storage Account** section, click the **Please select...** section, then click the **Storage Account** you created in the last Chapter.

    6.  You will also need to confirm that you have understood the Terms and Conditions applied to this Service.

    7.  Click **Create**.

        ![The Azure Portal](images/AzureLabs-Lab6-08.png)

4.  Once you have clicked on **Create**, you will have to wait for the service to be created, this might take a minute.

5.  A notification will appear in the portal once the Service instance is created.

    ![The Azure Portal](images/AzureLabs-Lab6-09.png)

6.  Click on the notification to explore your new Service instance.

    ![The Azure Portal](images/AzureLabs-Lab6-10.png)

7.  Click the **Go to resource** button in the notification to explore your new Service instance.

8.  Within the new Media service page, within the panel on the left, click on the **Assets** link, which is about halfway down.

9.  On the next page, in the top-left corner of the page, click **Upload**.

    ![The Azure Portal](images/AzureLabs-Lab6-11.png)

10. Click on the **Folder** icon to browse your files and select the first 360 Video that you would like to stream. 
    
    > You can follow this [link to download a sample video](https://vimeo.com/214401712).

    ![The Azure Portal](images/AzureLabs-Lab6-12.png)

> [!WARNING]
> Long filenames may cause an issue with the encoder: so to ensure videos do not have issues, consider shortening the length of your video file names.

11. The progress bar will turn green when the video has finished uploading.

    ![The Azure Portal](images/AzureLabs-Lab6-13.png)

12. Click on the text above (**yourservicename - Assets**) to return to the **Assets** page.

13. You will notice that your video has been successfully uploaded. Click on it.

    ![The Azure Portal](images/AzureLabs-Lab6-14.png)

14. The page you are redirected to will show you detailed information about your video. To be able to use your video you need to encode it, by clicking the **Encode** button at the top-left of the page.

    ![The Azure Portal](images/AzureLabs-Lab6-15.png)

15. A new panel will appear to the right, where you will be able to set encoding options for your file. Set the following properties (some will be already set by default):

    1.  **Media encoder name *Media Encoder Standard***

    2.  **Encoding preset *Content Adaptive Multiple Bitrate MP4***

    3.  **Job name *Media Encoder Standard processing of Video1.mp4***

    4.  **Output media asset name *Video1.mp4 -- Media Encoder Standard encoded***

        ![The Azure Portal](images/AzureLabs-Lab6-16.png)

16. Click the **Create** button.

17. You will notice a bar with **Encoding job added**, click on that bar and a panel will appear with the Encoding progress displayed in it.

    ![The Azure Portal](images/AzureLabs-Lab6-17.png)

    ![The Azure Portal](images/AzureLabs-Lab6-18.png)

18. Wait for the Job to be completed. Once it is done, feel free to close the panel with the 'X' at the top right of that panel.

    ![The Azure Portal](images/AzureLabs-Lab6-19.png)

    ![The Azure Portal](images/AzureLabs-Lab6-20.png)

    > [!IMPORTANT]
    > The time this takes, depends on the file size of your video. This process can take quite some time.

19. Now that the encoded version of the video has been created, you can publish it to make it accessible. To do so, click the blue link
    **Assets** to go back to the assets page.

    ![The Azure Portal](images/AzureLabs-Lab6-21.png)

20. You will see your video along with another, which is of **Asset Type _Multi-Bitrate MP4_**.

    ![The Azure Portal](images/AzureLabs-Lab6-22.png)

    > [!NOTE] 
    > You may notice that the new asset, alongside your initial video, is *Unknown*, and has '0' bytes for it's **Size**, just refresh your window for it to update.

21. Click this new asset.

    ![The Azure Portal](images/AzureLabs-Lab6-23.png)

22. You will see a similar panel to the one you used before, just this is a different asset. Click the **Publish** button located at the top-center of the page.

    ![The Azure Portal](images/AzureLabs-Lab6-24.png)

23. You will be prompted to set a **Locator**, which is the entry point, to file/s in your Assets. For your scenario set the following properties:

    1.  **Locator type** > **Progressive**.

    2.  The **date** and **time** will be set for you, from your current date, to a time in the future (one hundred years in this case). Leave as is or change it to suit.

    > [!NOTE]
    > For more information about Locators, and what you can choose, visit the [Azure Media Services Documentation](/azure/media-services/media-services-concepts).

24. At the bottom of that panel, click on the **Add** button.

    ![The Azure Portal](images/AzureLabs-Lab6-25.png)

25. Your video is now published and can be streamed by using its endpoint. Further down the page is a **Files** section. This is where the different encoded versions of your video will be. Select the highest possible resolution one (in the image below it is the 1920x960 file), and then a panel to the right will appear. There you will find a **Download URL**. Copy this **Endpoint** as you will use it later in your code.

    ![The Azure Portal](images/AzureLabs-Lab6-26.png)    

    ![The Azure Portal](images/AzureLabs-Lab6-27.png)

    > [!NOTE] 
    > You can also press the **Play** button to play your video and test it.

26. You now need to upload the second video that you will use in this Lab. Follow the steps above, repeating the same process for the second video. Ensure you copy the second **Endpoint** also. Use the following [link to download a second video](https://vimeo.com/214402865).

27. Once both videos have been published, you are ready to move to the next Chapter.

## Chapter 3 - Setting up the Unity Project

The following is a typical set up for developing with the Mixed Reality, and as such, is a good template for other projects.

1.	Open **Unity** and click **New**. 

    ![The Azure Portal](images/AzureLabs-Lab6-28.png)

2.	You will now need to provide a Unity Project name, insert **MR\_360VideoStreaming.**. Make sure the project type is set to **3D**. Set the Location to somewhere appropriate for you (remember, closer to root directories is better). Then, click **Create project**.

    ![The Azure Portal](images/AzureLabs-Lab6-29.png)

3.  With Unity open, it is worth checking the default **Script Editor** is set to **Visual Studio.** Go to ***Edit* *Preferences*** and then from the new window, navigate to **External Tools**. Change **External Script Editor** to **Visual Studio 2017**. Close the **Preferences** window.

    ![The Azure Portal](images/AzureLabs-Lab6-30.png)

4.  Next, go to ***File* *Build Settings*** and switch the platform to **Universal Windows Platform**, by clicking on the **Switch Platform** button.

5.  Also make sure that:

    1. **Target Device** is set to **Any Device.**
    
    2.  **Build Type** is set to **D3D.**

    3.  **SDK** is set to **Latest installed.**

    4.  **Visual Studio Version** is set to **Latest installed.**

    5.  **Build and Run** is set to **Local Machine.**

    6.  Do not worry about setting up **Scenes** right now, as you will set these up later.

    7.  The remaining settings should be left as default for now.

        ![Setting up the Unity Project](images/AzureLabs-Lab6-31.png)

6.  In the **Build Settings** window, click on the **Player Settings** button, this will open the related panel in the space where the **Inspector** is located. 

7. In this panel, a few settings need to be verified:

    1.  In the **Other Settings** tab:

        1.  **Scripting** **Runtime Version** should be **Stable** (.NET 3.5 Equivalent).

        2. **Scripting Backend** should be **.NET.**

        3. **API Compatibility Level** should be **.NET 4.6.**

            ![Setting up the Unity Project](images/AzureLabs-Lab6-32.png)

    2.  Further down the panel, in **XR Settings** (found below **Publish Settings**), tick **Virtual Reality Supported**, make sure the **Windows Mixed Reality SDK** is added.

        ![Setting up the Unity Project](images/AzureLabs-Lab6-33.png)

    3.  Within the **Publishing Settings** tab, under **Capabilities**, check:

        - **InternetClient**

            ![Setting up the Unity Project](images/AzureLabs-Lab6-34.png)

8.  Once you have made those changes, close the **Build Settings** window.

9.  Save your Project **File* *Save Project**.



## Chapter 4 - Importing the InsideOutSphere Unity package

> [!IMPORTANT]
> If you wish to skip the *Unity Set up* component of this course, and continue straight into code, feel free to download this [.unitypackage](https://github.com/Microsoft/HolographicAcademy/raw/Azure-MixedReality-Labs/Azure%20Mixed%20Reality%20Labs/MR%20and%20Azure%20306%20-%20Streaming%20video/Azure-MR-306.unitypackage), import it into your project as a [**Custom Package**](https://docs.unity3d.com/Manual/AssetPackages.html), and then continue from **Chapter 5**. You will still need to create a Unity Project.

For this course you will need to download a Unity Asset Package called [**InsideOutSphere.unitypackage**](https://github.com/Microsoft/HolographicAcademy/raw/Azure-MixedReality-Labs/Azure%20Mixed%20Reality%20Labs/MR%20and%20Azure%20306%20-%20Streaming%20video/InsideOutSphere.unitypackage).

How-to import the **unitypackage**:

1.  With the Unity dashboard in front of you, click on **Assets** in the menu at the top of the screen, then click on **Import Package > Custom Package**.

    ![Importing the InsideOutSphere Unity Package](images/AzureLabs-Lab6-35.png)

2.  Use the file picker to select the **InsideOutSphere.unitypackage** package and click **Open**. A list of components for this asset will be displayed to you. Confirm the import by clicking **Import**.

    ![Importing the InsideOutSphere Unity Package](images/AzureLabs-Lab6-36.png)

3.  Once it has finished importing, you will notice three new folders, **Materials**, **Models**, and **Prefabs**, have been added to your **Assets** folder. This kind of folder structure is typical for a Unity project.

    ![Importing the InsideOutSphere Unity Package](images/AzureLabs-Lab6-37.png)

    1.  Open the **Models** folder, and you will see that the **InsideOutSphere** model has been imported.

    2.  Within the **Materials** folder you will find the **InsideOutSpheres** material  *lambert1*, along with a material called *ButtonMaterial*, which is used by the GazeButton, which you will see soon.

    3.  The **Prefabs** folder contains the **InsideOutSphere** prefab which contains both the **InsideOutSphere** *model* and the *GazeButton*.

    4.  **No code is included**, you will write the code by following this course.


4.  Within the **Hierarchy**, select the **Main Camera** object, and update the following components:

    1.  **Transform**

        1.  Position = **X**: 0, **Y**: 0, **Z**: 0.

        2. Rotation = **X**: 0, **Y**: 0, **Z**: 0.

        3. Scale **X**: 1, **Y**: 1, **Z**: 1.

    2.  **Camera**

        1. **Clear Flags**: Solid Color.

        2.  **Clipping Planes**: Near: 0.1, Far: 6.

            ![Importing the InsideOutSphere Unity Package](images/AzureLabs-Lab6-38.png)

5.  Navigate to the **Prefab** folder, and then drag the **InsideOutSphere** prefab into the **Hierarchy** Panel.

    ![Importing the InsideOutSphere Unity Package](images/AzureLabs-Lab6-39.png)

6.  Expand the **InsideOutSphere** object within the **Hierarchy** by clicking the little arrow next to it. You will see a **child** object beneath it called **GazeButton**. This will be used to change scenes and thus videos.

    ![Importing the InsideOutSphere Unity Package](images/AzureLabs-Lab6-40.png)

7.  In the Inspector Window click on the **InsideOutSphere**'s Transform component, ensure that the following properties are set:

    |            |    TRANSFORM - POSITION   |           |
    | :---------:| :-----------------------: | :--------:|
    |   **X** 0  |          **Y** 0          |  **Z** 0  |

    |            |    TRANSFORM - ROTATION   |           |
    | :---------:| :-----------------------: | :--------:|
    |   **X** 0  |          **Y** -50        |  **Z** 0  |

    |            |     TRANSFORM - SCALE     |           |
    | :---------:| :-----------------------: | :--------:|
    |  **X** 1   |          **Y** 1          |  **Z** 1  |

    ![Importing the InsideOutSphere Unity Package](images/AzureLabs-Lab6-41.png)

8.  Click on the **GazeButton** child object, and set its **Transform** as follows:

    |            |    TRANSFORM - POSITION   |           |
    | :---------:| :-----------------------: | :--------:|
    |   **X** 3.6|          **Y** 1.3        |  **Z** 0  |

    |            |    TRANSFORM - ROTATION   |           |
    | :---------:| :-----------------------: | :--------:|
    |   **X** 0  |          **Y** 0          |  **Z** 0  |

    |            |     TRANSFORM - SCALE     |           |
    | :---------:| :-----------------------: | :--------:|
    |  **X** 1   |          **Y** 1          |  **Z** 1  |

    ![Importing the InsideOutSphere Unity Package](images/AzureLabs-Lab6-42.png)


## Chapter 5 - Create the VideoController class

The **VideoController** class hosts the two video endpoints that will be used to stream the content from the Azure Media Service.

To create this class:

1.  Right-click in the **Asset Folder**, located in the **Project** Panel, and click **Create > Folder**. Name the folder **Scripts**.

    ![Create the VideoController class](images/AzureLabs-Lab6-43.png)

    ![Create the VideoController class](images/AzureLabs-Lab6-44.png)

2.  Double click on the **Scripts** folder to open it.

3.  Right-click inside the folder, then click **Create > C\# Script**. Name the script **VideoController**.

    ![Create the VideoController class](images/AzureLabs-Lab6-45.png)

4.  Double click on the new **VideoController** script to open it with **Visual Studio 2017.**

    ![Create the VideoController class](images/AzureLabs-Lab6-46.png)

5.  Update the namespaces at the top of the code file as follows:

    ```csharp
    using System.Collections;
    using UnityEngine;
    using UnityEngine.SceneManagement;
    using UnityEngine.Video;
    ```

6.  Enter the following variables in the **VideoController** class, along with the **Awake()** method:

    ```csharp
        /// <summary> 
        /// Provides Singleton-like behaviour to this class. 
        /// </summary> 
        public static VideoController instance; 
        
        /// <summary> 
        /// Reference to the Camera VideoPlayer Component.
        /// </summary> 
        private VideoPlayer videoPlayer; 
        
        /// <summary>
        /// Reference to the Camera AudioSource Component.
        /// </summary> 
        private AudioSource audioSource; 
        
        /// <summary> 
        /// Reference to the texture used to project the video streaming 
        /// </summary> 
        private RenderTexture videoStreamRenderTexture;

        /// <summary>
        /// Insert here the first video endpoint
        /// </summary>
        private string video1endpoint = "-- Insert video 1 Endpoint here --";

        /// <summary>
        /// Insert here the second video endpoint
        /// </summary>
        private string video2endpoint = "-- Insert video 2 Endpoint here --";

        /// <summary> 
        /// Reference to the Inside-Out Sphere. 
        /// </summary> 
        public GameObject sphere;

        void Awake()
        {
            instance = this;
        }
    ```

7.  Now is the time to enter the endpoints from your Azure Media Service videos:

    1.  The first into the *video1endpoint* variable.
    
    2.  The second into the *video2endpoint* variable.

    > [!WARNING]
    > There is a known issue with using *https* within Unity, with version 2017.4.1f1. If the videos provide an error on play, try using 'http' instead.

8.  Next, the **Start()** method needs to be edited. This method will be triggered every time the user switches scene (consequently switching the video) by looking at the Gaze Button.

    ```csharp
        // Use this for initialization
        void Start()
        {
            Application.runInBackground = true;
            StartCoroutine(PlayVideo());
        }
    ```

9.  Following the **Start()** method, insert the **PlayVideo()** *IEnumerator* method, which will be used to start videos seamlessly (so no stutter is seen).

    ```csharp
        private IEnumerator PlayVideo()
        {
            // create a new render texture to display the video 
            videoStreamRenderTexture = new RenderTexture(2160, 1440, 32, RenderTextureFormat.ARGB32);

            videoStreamRenderTexture.Create();

            // assign the render texture to the object material 
            Material sphereMaterial = sphere.GetComponent<Renderer>().sharedMaterial;

            //create a VideoPlayer component 
            videoPlayer = gameObject.AddComponent<VideoPlayer>();

            // Set the video to loop. 
            videoPlayer.isLooping = true;

            // Set the VideoPlayer component to play the video from the texture 
            videoPlayer.renderMode = VideoRenderMode.RenderTexture;

            videoPlayer.targetTexture = videoStreamRenderTexture;

            // Add AudioSource 
            audioSource = gameObject.AddComponent<AudioSource>();

            // Pause Audio play on Awake 
            audioSource.playOnAwake = true;
            audioSource.Pause();

            // Set Audio Output to AudioSource 
            videoPlayer.audioOutputMode = VideoAudioOutputMode.AudioSource;
            videoPlayer.source = VideoSource.Url;

            // Assign the Audio from Video to AudioSource to be played 
            videoPlayer.EnableAudioTrack(0, true);
            videoPlayer.SetTargetAudioSource(0, audioSource);

            // Assign the video Url depending on the current scene 
            switch (SceneManager.GetActiveScene().name)
            {
                case "VideoScene1":
                    videoPlayer.url = video1endpoint;
                    break;

                case "VideoScene2":
                    videoPlayer.url = video2endpoint;
                    break;

                default:
                    break;
            }

            //Set video To Play then prepare Audio to prevent Buffering 
            videoPlayer.Prepare();

            while (!videoPlayer.isPrepared)
            {
                yield return null;
            }

            sphereMaterial.mainTexture = videoStreamRenderTexture;

            //Play Video 
            videoPlayer.Play();

            //Play Sound 
            audioSource.Play();

            while (videoPlayer.isPlaying)
            {
                yield return null;
            }
        }
    ```

10. The last method you need for this class is the **ChangeScene()** method, which will be used to swap between scenes.

    ```csharp
        public void ChangeScene()
        {
            SceneManager.LoadScene(SceneManager.GetActiveScene().name == "VideoScene1" ? "VideoScene2" : "VideoScene1");
        }
    ```

    > [!TIP] 
    > The **ChangeScene()** method uses a handy C\# feature called the *Conditional Operator*. This allows for conditions to be checked, and then values returned based on the outcome of the check, all within a single statement. Follow this [link to learn more about Conditional Operator](/dotnet/csharp/language-reference/operators/conditional-operator).

11. Save your changes in Visual Studio before returning to Unity.

12. Back in the Unity Editor, click and drag the **VideoController** class [from]{.underline} the **Scripts** folder to the **Main Camera** object in the **Hierarchy** Panel.

13. Click on the **Main Camera** and look at the **Inspector Panel**. You will notice that within the newly added Script component, there is a field with an empty value. This is a reference field, which targets the public variables within your code.

14. Drag the **InsideOutSphere** object from the **Hierarchy Panel** to the **Sphere** slot, as shown in the image below.

    ![Create the VideoController class](images/AzureLabs-Lab6-47.png)
    ![Create the VideoController class](images/AzureLabs-Lab6-48.png)

## Chapter 6 - Create the Gaze class

This class is responsible for creating a **Raycast** that will be projected forward from the **Main Camera**, to detect which object the user is looking at. In this case, the **Raycast** will need to identify if the user is looking at the **GazeButton** object in the scene and trigger a behavior.

To create this Class:

1.  Go to the **Scripts** folder you created previously.

2.  Right-click in the **Project** Panel, **Create* *C\# Script**. Name the script **Gaze**.

3.  Double click on the new ***Gaze*** script to open it with **Visual Studio 2017.**

4.  Ensure the following namespace is at the top of the script, and remove any others:

    ```csharp
    using UnityEngine;
    ```

5.  Then add the following variables inside the **Gaze** class:

    ```csharp
        /// <summary> 
        /// Provides Singleton-like behaviour to this class. 
        /// </summary> 
        public static Gaze instance;

        /// <summary> 
        /// Provides a reference to the object the user is currently looking at. 
        /// </summary> 
        public GameObject FocusedGameObject { get; private set; }

        /// <summary> 
        /// Provides a reference to compare whether the user is still looking at 
        /// the same object (and has not looked away). 
        /// </summary> 
        private GameObject oldFocusedObject = null;

        /// <summary> 
        /// Max Ray Distance 
        /// </summary> 
        float gazeMaxDistance = 300;

        /// <summary> 
        /// Provides whether an object has been successfully hit by the raycast. 
        /// </summary> 
        public bool Hit { get; private set; }
    ```

6.  Code for the **Awake()** and **Start()** methods now needs to be added.

    ```csharp
        private void Awake()
        {
            // Set this class to behave similar to singleton 
            instance = this;
        }

        void Start()
        {
            FocusedGameObject = null;
        }
    ```

7.  Add the following code in the **Update()** method to project a Raycast and detect the target hit:

    ```csharp
        void Update()
        {
            // Set the old focused gameobject. 
            oldFocusedObject = FocusedGameObject;
            RaycastHit hitInfo;

            // Initialise Raycasting. 
            Hit = Physics.Raycast(Camera.main.transform.position, Camera.main.transform.forward, out hitInfo, gazeMaxDistance);

            // Check whether raycast has hit. 
            if (Hit == true)
            {
                // Check whether the hit has a collider. 
                if (hitInfo.collider != null)
                {
                    // Set the focused object with what the user just looked at. 
                    FocusedGameObject = hitInfo.collider.gameObject;
                }
                else
                {
                    // Object looked on is not valid, set focused gameobject to null. 
                    FocusedGameObject = null;
                }
            }
            else
            {
                // No object looked upon, set focused gameobject to null.
                FocusedGameObject = null;
            }

            // Check whether the previous focused object is this same 
            // object (so to stop spamming of function). 
            if (FocusedGameObject != oldFocusedObject)
            {
                // Compare whether the new Focused Object has the desired tag we set previously. 
                if (FocusedGameObject.CompareTag("GazeButton"))
                {
                    FocusedGameObject.SetActive(false);
                    VideoController.instance.ChangeScene();
                }
            }
        }
    ```

8.  Save your changes in Visual Studio before returning to Unity.

9.  Click and drag the **Gaze** class from the Scripts folder to the Main Camera object in the **Hierarchy** Panel.

## Chapter 7 - Setup the two Unity Scenes

The purpose of this Chapter is to setup the two scenes, each hosting a video to stream. You will duplicate the scene you have already created, so that you do not need to set it up again, though you will then edit the new scene, so that the *GazeButton* object is in a different location and has a different appearance. This is to show how to change between scenes.

1.  Do this by going to **File > Save Scene as...**. A save window will appear. Click the **New folder** button.

    ![Chapter 7 - Setup the two Unity Scenes](images/AzureLabs-Lab6-49.png)

2.  Name the folder **Scenes**.

3.  The **Save Scene** window will still be open. Open your newly created **Scenes** folder.

4.  In the **File name:** text field, type **VideoScene1**, then press **Save**.

5.  Back in Unity, open your **Scenes** folder, and left-click your **VideoScene1** file. Use your keyboard, and press **Ctrl + D** you will duplicate that scene

    > [!TIP]
    > The **Duplicate** command can also be performed by navigating to **Edit > Duplicate**.

6.  Unity will automatically increment the scene names number, but check it anyway, to ensure it matches the previously inserted code.

    >  You should have **VideoScene1** and **VideoScene2**.

7.  With your two scenes, go to **File > Build Settings**. With the **Build Settings** window open, drag your scenes to the **Scenes in Build** section.

    ![Chapter 7 -- Setup the two Unity Scenes](images/AzureLabs-Lab6-50.png)

    > [!TIP] 
    > You can select both of your scenes from your **Scenes** folder through holding the **Ctrl** button, and then left-clicking each scene, and finally drag both across.

8.  Close the **Build Settings** window, and double click on **VideoScene2**.

9.  With the second scene open, click on the **GazeButton** child object of the **InsideOutSphere**, and set its Transform as follows:

    |            |    TRANSFORM - POSITION   |           |
    | :---------:| :-----------------------: | :--------:|
    |   **X** 0  |         **Y** 1.3         | **Z** 3.6 |

    |            |    TRANSFORM - ROTATION   |           |
    | :---------:| :-----------------------: | :--------:|
    |   **X** 0  |          **Y** 0          |  **Z** 0  |

    |            |     TRANSFORM - SCALE     |           |
    | :---------:| :-----------------------: | :--------:|
    |  **X** 1   |          **Y** 1          |  **Z** 1  |

10. With the **GazeButton** child still selected, look at the **Inspector** and at the **Mesh Filter**. Click the little target next to the **Mesh** reference field:

    ![Chapter 7 -- Setup the two Unity Scenes](images/AzureLabs-Lab6-51.png)

11. A **Select Mesh** popup window will appear. Double click the **Cube** mesh from the list of **Assets**.

    ![Chapter 7 -- Setup the two Unity Scenes](images/AzureLabs-Lab6-52.png)

12. The **Mesh Filter** will update, and now be a **Cube**. Now, click the **Gear** icon next to **Sphere Collider** and click **Remove Component**, to delete the collider from this object.

    ![Chapter 7 -- Setup the two Unity Scenes](images/AzureLabs-Lab6-53.png)

13. With the **GazeButton** still selected, click the **Add Component** button at the bottom of the **Inspector**. In the search field, type **box**, and **Box Collider** will be an option -- click that, to add a **Box Collider** to your **GazeButton** object.

    ![Chapter 7 -- Setup the two Unity Scenes](images/AzureLabs-Lab6-54.png)

14. The **GazeButton** is now partially updated, to look different, however, you will now create a new **Material**, so that it looks completely different, and is easier to recognize as a different object, than the object in the first scene.

15. Navigate to your **Materials** folder, within the **Project Panel**. Duplicate the **ButtonMaterial** Material (press **Ctrl** + **D** on the keyboard, or left-click the **Material**, then from the **Edit** file menu option, select **Duplicate**).

    ![Chapter 7 -- Setup the two Unity Scenes](images/AzureLabs-Lab6-55.png)
    ![Chapter 7 -- Setup the two Unity Scenes](images/AzureLabs-Lab6-56.png)

16. Select the new **ButtonMaterial** Material (here named **ButtonMaterial 1**), and within the **Inspector**, click the **Albedo** color window. A popup will appear, where you can select another color (choose whichever you like), then close the popup. The Material will be its own instance, and different to the original.

    ![Chapter 7 -- Setup the two Unity Scenes](images/AzureLabs-Lab6-57.png)

17. Drag the new **Material** onto the **GazeButton** child, to now completely update its look, so that it is easily distinguishable from the first scenes button.

    ![Chapter 7 -- Setup the two Unity Scenes](images/AzureLabs-Lab6-58.png)

18. At this point you can test the project in the Editor before building the UWP project.

    -  Press the **Play** button in the **Editor** and wear your headset.

        ![Chapter 7 -- Setup the two Unity Scenes](images/AzureLabs-Lab6-59.png)

19. Look at the two **GazeButton** objects to switch between the first and second video.

## Chapter 8 - Build the UWP Solution

Once you have ensured that the editor has no errors, you are ready to Build.

To Build:

1.  Save the current scene by clicking on **File > Save**.

2.  Check the box called **Unity C\# Projects** (this is important because it will allow you to edit the classes after build is completed).

3.  Go to **File > Build Settings**, click on **Build**.

4.  You will be prompted to select the folder where you want to build the Solution.

5.  Create a **BUILDS** folder and within that folder create another folder with an appropriate name of your choice.

6.  Click your new folder and then click **Select Folder**, so to choose that folder, to begin the build at that location.

    ![Chapter 8 -- Build the UWP Solution](images/AzureLabs-Lab6-60.png)
    ![Chapter 8 -- Build the UWP Solution](images/AzureLabs-Lab6-61.png)

7.  Once Unity has finished building (it might take some time), it will open a **File Explorer** window at the location of your build.

## Chapter 9 - Deploy on Local Machine

Once the build has been completed, a **File Explorer** window will appear at the location of your build. Open the Folder you named and built to, then double click on the solution (.sln) file within that folder, to open your solution with Visual Studio 2017.

The only thing left to do is deploy your app to your computer (or *Local Machine*).

To deploy to Local Machine:

1.  In **Visual Studio 2017**, open the solution file that has just been created.

2.  In the **Solution Platform**, select **x86, Local Machine**.

3.  In the **Solution Configuration** select **Debug**.

    ![Chapter 9 -- Deploy on Local Machine](images/AzureLabs-Lab6-62.png)

4.  You will now need to restore any packages to your solution. Right-click on your **Solution**, and click **Restore NuGet Packages for Solution...**

    > [!NOTE] 
    > This is done because the packages which Unity built need to be targeted to work with your local machines references.

5.  Go to **Build menu** and click on **Deploy Solution** to sideload the application to your machine. Visual Studio will first build and then deploy your application.

6.  Your App should now appear in the list of installed apps, ready to be launched.

    ![Chapter 9 -- Deploy on Local Machine](images/AzureLabs-Lab6-63.png)

When you run the Mixed Reality application, you will you be within the **InsideOutSphere** model which you used within your app. This sphere will be where the video will be streamed to, providing a 360-degree view, of the incoming video (which was filmed for this kind of perspective). Do not be surprised if the video takes a couple of seconds to load, your app is subject to your available Internet speed, as the video needs to be fetched and then downloaded, so to stream into your app.
When you are ready, change scenes and open your second video, by gazing at the red sphere! Then feel free to go back, using the blue cube in the second scene!

## Your finished Azure Media Service application
 
Congratulations, you built a mixed reality app that leverages the Azure Media Service to stream 360 videos.

![lab outcome](images/AzureLabs-Lab6-00.png)

![lab outcome](images/AzureLabs-Lab6-01.png)

## Bonus Exercises

**Exercise 1**

It is entirely possible to only use a single scene to change videos within this tutorial. Experiment with your application and make it into a single scene! Perhaps even add another video to the mix.

**Exercise 2**

Experiment with Azure and Unity, and attempt to implement the ability for the app to automatically select a video with a different file size, depending on the strength of an Internet connection.