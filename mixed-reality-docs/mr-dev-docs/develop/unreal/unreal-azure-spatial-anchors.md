---
title: Azure Spatial Anchors in Unreal
description: Learn how to create, manage, and locate existing Azure Spatial Anchors in Unreal mixed reality applications.
author: hferrone
ms.author: jacksonf
ms.date: 12/9/2020
ms.topic: tutorial
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens 2, azure, azure development, spatial anchors, mixed reality, development, features, new project, emulator, documentation, guides, holograms, game development, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Azure Spatial Anchors in Unreal

Azure Spatial Anchors is a Microsoft Mixed Reality service, allowing augmented reality devices to discover, share, and persist anchor points in the physical world. Documentation below provides instructions for integrating the Azure Spatial Anchors service into an Unreal project. If you're looking for more information, check out the [Azure Spatial Anchors service](https://azure.microsoft.com/services/spatial-anchors/).

> [!NOTE]
> Unreal Engine 4.26 now has plugins for ARKit and ARCore support if you're targeting iOS or Android.

> [!IMPORTANT]
> Local anchors are stored on device, while Azure Spatial Anchors are stored in the cloud. If you're looking to store your anchors locally on a device, we have a [Local Spatial Anchors](unreal-spatial-anchors.md) document that can walk you through the process. Note that you can have local and Azure anchors in the same project without conflict.

## Prerequisites

To complete this guide, make sure you have:

- Installed [Unreal version 4.25](https://www.unrealengine.com/get-now) or later
- A [HoloLens 2 project](tutorials/unreal-uxt-ch1.md) setup in Unreal 
- Read through the [Azure Spatial Anchors overview](/azure/spatial-anchors/overview)
- Basic knowledge on C++ and Unreal

## Getting Azure Spatial Anchors account info

Before using Azure Spatial Anchors in your project, you need to:
* [Create a spatial anchors resource](/azure/spatial-anchors/quickstarts/get-started-hololens#create-a-spatial-anchors-resource) and copy the account fields listed below. These values are used to authenticate users with your application's account:
    * **Account ID**
    * **Account Key**

Check out the [Azure Spatial Anchors authentication](/azure/spatial-anchors/concepts/authentication?tabs=csharp) docs for more information.

> [!NOTE]
> Azure Spatial Anchors in Unreal 4.25 does not support Azure AD authentication tokens, but support for this functionality will be coming in a later release.

## Enable Capabilities and Permissions
### HoloLens

Open **Project Settings > HoloLens** and enable the **Internet Client** capability:

![HoloLens project settings with capabilities highlighted](images/asa-enable-wifi-connection.jpg)

### Android
For an Android app to display a permission dialogue and allow location capabilities, the **Request Android Permissions** function must be called before attempting to start the Azure Spatial Anchor session: 

![Request Android permissions function](images/asa-unreal/unreal-spatial-anchors-android-img-1.png)

Create a local variable for the input permissions, and populate with:
- android.permission.ACCESS_WIFI_STATE
- android.permission.CHANGE_WIFI_STATE
- android.permission.INTERNET
- android.permission.BLUETOOTH
- android.permission.BLUETOOTH_ADMIN
- android.permission.ACCESS_COARSE_LOCATION
- android.permission.ACCESS_FINE_LOCATION
- android.permission.CAMERA

![Set Android permissions](images/asa-unreal/unreal-spatial-anchors-android-img-2.png)

Finally, open **Project Settings > Android** and set the same permissions in the **Extra Permissions** field under **Advanced APK Packaging**:

![Android APK project settings](images/asa-unreal/unreal-spatial-anchors-android-img-3.png)

### iOS
To build an application for iOS, you will need to use Unreal on a Mac.  To package with an Apple developer account, open **Project Settings > iOS** and scroll down to the **Build** section.  Enable the **Automatic Signing** checkbox and populate the **IOS Team ID** with your Team ID.

You can find your Team ID by logging into **developer.apple.com**, navigating to the **Membership** tab and searching for **Team ID**.

To display a permission dialogue and allow the iOS device to access location information, the **Init Location Services** and **Start Location Services** functions must be called before attempting to start the Azure Spatial Anchor session: 

![Start iOS location services](images/asa-unreal/unreal-spatial-anchors-ios-img-3.png)

## Adding Azure Spatial Anchors plugins

### HoloLens
Enable the Azure Spatial Anchors plugins in the Unreal editor by:
1. Clicking **Edit > Plugins** and searching for **Azure Spatial Anchors** and **Azure Spatial Anchors For WMR**.
2. Select the **Enabled** checkbox in both plugins to allow access to the Azure Spatial Anchors blueprint libraries in your application.

![Screenshot of spatial Anchors plugins in Unreal editor](images/asa-unreal/unreal-spatial-anchors-img-01.png)

Once that's done, restart the Unreal Editor for the plugin changes to take effect. The project is now ready to use Azure Spatial Anchors.

### Android
Enable the Azure Spatial Anchors plugins in the Unreal editor by:
1. Clicking **Edit > Plugins** and searching for **Azure Spatial Anchors** and **Azure Spatial Anchors For ARCore**.
2. Select the **Enabled** checkbox in both plugins to allow access to the Azure Spatial Anchors blueprint libraries in your application.

![Android plugins in Unreal editor](images/asa-unreal/unreal-spatial-anchors-android-img-4.png)

Once that's done, restart the Unreal Editor for the plugin changes to take effect. The project is now ready to use Azure Spatial Anchors.

### iOS
Enable the Azure Spatial Anchors plugins in the Unreal editor by:
1. Clicking **Edit > Plugins** and searching for **Azure Spatial Anchors** and **Azure Spatial Anchors For ARKit**.
2. Select the **Enabled** checkbox in both plugins to allow access to the Azure Spatial Anchors blueprint libraries in your application.

![iOS ASA plugins in Unreal editor](images/asa-unreal/unreal-spatial-anchors-ios-img-1.png)

3. Also search for **Mobile Location Services** and **Mobile Location Services - IOS Implementation**
4. Select the **Enabled** checkbox in both plugins to allow the iOS device to access current location.

![iOS Location plugins in Unreal editor](images/asa-unreal/unreal-spatial-anchors-ios-img-2.png)

Once that's done, restart the Unreal Editor for the plugin changes to take effect. The project is now ready to use Azure Spatial Anchors.

## Starting a Spatial Anchors session

An Azure Spatial Anchors session allows client applications to communicate with the Azure Spatial Anchors service. You'll need to create and start an Azure Spatial Anchors session to create, persist, and share Azure Spatial Anchors:

1. Open the blueprint for the Pawn you're using in the application.
2. Add two string variables for the **Account ID** and **Account Key**, then assign the corresponding values from your Azure Spatial Anchors account to authenticate the session.

![Screenshot of details panel with azure spatial anchors account id, key, and variable type highlighted](images/asa-unreal/unreal-spatial-anchors-img-02.png)

Start an Azure Spatial Anchors session by:
1. Checking that an **AR Session** is running in the HoloLens application, as the Azure Spatial Anchors session can't start until an AR Session is running. If you don't have one setup, [create an AR Session asset](/windows/mixed-reality/unreal-uxt-ch3#adding-the-session-asset).
2. Adding the **Start Azure Spatial Anchors Session** custom event and configure it as shown in the screenshot below.
    * Creating a session doesn't start the session by default, which allows you to configure the session for authentication with the Azure Spatial Anchors service.

![Blueprint of starting azure spatial anchors session custom event](images/asa-unreal/unreal-spatial-anchors-img-03.png)

3. Configure the Azure Spatial Anchors session to provide the **Account ID**, **Account Key**, **Account Domain**, and **Course Localization Settings**.  All of the checkboxes should be enabled in the course localization settings so the azure spatial anchor service can use sensor data to locate anchors.

![Blueprint of config session function with account id and key added](images/asa-unreal/unreal-spatial-anchors-img-04.png)

4. Start the Azure Spatial Anchors session, allowing the application to create and locate Azure Spatial Anchors.

![Blueprint of the azure spatial anchors session start function](images/asa-unreal/unreal-spatial-anchors-img-05.png)

It's good practice to clean up Azure Spatial Anchors resources in your Event Graph blueprint when you're no longer using the service:

1. Stop the Azure Spatial Anchors session. The session will no longer be running, but its associated resources will still exist in the Azure Spatial Anchors plugin.

![Blueprint of stop azure spatial anchors sessions custom event and stop session function](images/asa-unreal/unreal-spatial-anchors-img-06.png)

2. Destroy the Azure Spatial Anchors session to clean up any Azure Spatial Anchors session resources still known to the Azure Spatial Anchors plugin.

![Blueprint of destroy session function](images/asa-unreal/unreal-spatial-anchors-img-07.png)

Your Event Graph blueprint should look like the screenshot below:

![Blueprint of complete event graph of azure spatial anchor session setup](images/asa-unreal/unreal-spatial-anchors-img-08.png)

## Creating an anchor

An Azure Spatial Anchor represents a physical world pose in the augmented reality application space, which locks augmented reality content to physical locations. Azure Spatial Anchors can also be shared among different users. This sharing allows augmented reality content drawn on different devices to be positioned in the same location in the physical world. 

To create a new Azure Spatial Anchor:
1. Check that an Azure Spatial Anchors session is running. The application can't create or persist an Azure Spatial Anchor when no Azure Spatial Anchors session is running.

![Blueprint of create azure spatial anchor custom event](images/asa-unreal/unreal-spatial-anchors-img-09.png)

2. Create or obtain an Unreal **[Scene Component](https://docs.unrealengine.com/API/Runtime/Engine/Components/USceneComponent/)** that should have its location persisted. 
    * In the below image, the **Scene Component Needing Anchor** component is used as a variable. An Unreal Scene Component is needed to establish an application world transform for an [AR Pin](https://docs.unrealengine.com/BlueprintAPI/ARAugmentedReality/ARPin/) and Azure Spatial Anchor.

![Blueprint of create azure spatial anchor custom event with scene component](images/asa-unreal/unreal-spatial-anchors-img-10.png)

To construct and save an Azure Spatial Anchor for an Unreal Scene Component:
1. Call the [Pin Component](https://docs.unrealengine.com/BlueprintAPI/ARAugmentedReality/ARPin/PinComponent/) for the Unreal Scene Component and specify the Scene Component's **World Transform** as the World Transform used for the AR Pin.
    * Unreal tracks AR points in the application space using AR Pins, which are used to create an Azure Spatial Anchor. In Unreal, an AR Pin is analogous to a SpatialAnchor on HoloLens.

![Blueprint of scene component connected to pin component function](images/asa-unreal/unreal-spatial-anchors-img-11.png)

2. Call **Create Cloud Anchor** using the newly created AR Pin.
    * Create Cloud Anchor creates an Azure Spatial Anchor locally but not in the Azure Spatial Anchor service. Parameters for the Azure Spatial Anchor, such as an expiration date, can be set before creating the Azure Spatial Anchor with the service.

![Blueprint of pin component function connected to create cloud anchor function returning ARPin](images/asa-unreal/unreal-spatial-anchors-img-12.png)

3. Set the Azure Spatial Anchor expiration. This function's Lifetime parameter allows the developer to specify in seconds how long the anchor should be maintained by the service.
    * For example, a week long expiration would take a value of 60 seconds x 60 minutes x 24 hours x seven days = 604,800 seconds.

![Blueprint of cloud anchor connected to set expiration function with lifetime value set to 604,800 seconds](images/asa-unreal/unreal-spatial-anchors-img-13.png)

After setting anchor parameters, declare the anchor as ready to save. In the example below, the newly created Azure Spatial Anchor is added to a set of Azure Spatial Anchors needing saving. This set is declared as a variable for the Pawn blueprint.

![Blueprint of anchor ready to be saved in set variable](images/asa-unreal/unreal-spatial-anchors-img-14.png)

## Saving an Anchor

After configuring the Azure Spatial Anchor with your parameters, call **Save Cloud Anchor**. Save Cloud Anchor declares the anchor to the Azure Spatial Anchors service. When the call to Save Cloud Anchor succeeds, the Azure Spatial Anchor is available to other users of the Azure Spatial Anchor service.  

![Blueprint of save cloud anchor function being called](images/asa-unreal/unreal-spatial-anchors-img-15.png)

> [!NOTE]
> Save Cloud Anchor is an asynchronous function and can only be called on a game thread event such as **EventTick**. Save Cloud Anchor may not appear as an available blueprint function in custom blueprint Functions. However, it should be available in the Pawn Event Graph blueprint editor.

In the example below, the Azure Spatial Anchor is stored in a set during an input event callback. The anchor is then saved on the EventTick. Saving an Azure Spatial Anchor may take multiple attempts depending on the amount of spatial data that your Azure Spatial Anchors session has created. That's why it's a good idea to check whether the save call succeeded.

If the anchor doesn't save, readd it to the set of anchors still needing to be saved. Future EventTicks will keep trying to save the anchor until it's successfully stored.

![Blueprint of unsaved anchors being saved again in set variable](images/asa-unreal/unreal-spatial-anchors-img-16.png)

Once the anchor saves, the AR Pins' transform acts as a reference transform for placing content in your app. Other users can detect this anchor and align AR content for different devices in the physical world.

## Deleting an Anchor

You can delete anchors from the Azure Spatial Anchor service by calling **Delete Cloud Anchor**.

![Blueprint of delete cloud anchor function being called](images/asa-unreal/unreal-spatial-anchors-img-17.png)

> [!NOTE]
> Delete Cloud Anchor is a latent function and can only be called on a game thread event, such as EventTick. Delete Cloud Anchor may not appear as an available blueprint function in custom blueprint Functions. It should however be available in the Pawn Event Graph blueprint editor.

In the example below, the anchor is flagged for deletion on a custom input event. The deletion is then attempted on the EventTick. If the anchor deletion fails, add the Azure Spatial Anchor to the set of anchors flagged for deletion and tries again on later EventTicks.

Your Event Graph blueprint should now look like the screenshot below:

![Blueprint of complete event graph for handling cloud anchors](images/asa-unreal/unreal-spatial-anchors-img-18.png)


## Locating pre-existing anchors

Existing anchors can be created by peers with the Azure Spatial Anchors service:

1. Obtain an Azure Spatial Anchor identifier for the anchor that you would like to detect.
    * An anchor identifier can be obtained for an anchor created by the same device in a previous Azure Spatial Anchors session. It can also be created and shared by peer devices interacting with the Azure Spatial Anchors service.

![Blueprint of store azure spatial anchor identifier custom event with get azure cloud identifier function](images/asa-unreal/unreal-spatial-anchors-img-24.png)

2. Add an **AzureSpatialAnchorsEvent** component to your Pawn blueprint.
    * This component allows you to subscribe to various Azure Spatial Anchors events, such as events called when Azure Spatial Anchors are located.

![Screenshot of BP_Pawn open in blueprint editor with components and detail panels open](images/asa-unreal/unreal-spatial-anchors-img-19.png)

3. Subscribe to the **ASAAnchor Located Delegate** for the **AzureSpatialAnchorsEvent** component.
    * The delegate lets the application know when new anchors associated with the Azure Spatial Anchors account have been located.
    * With the event callback, Azure Spatial Anchors created by peers using the Azure Spatial Anchors session won't have AR Pins created by default. To create an AR Pin for the detected Azure Spatial Anchor, developers can call **Create ARPin Around Azure Cloud Spatial Anchor**.

![Blueprint of begin play event connected to ASAAnchor located delegate](images/asa-unreal/unreal-spatial-anchors-img-20.png)

To locate Azure Spatial Anchors created by peers using the Azure Spatial Anchor service, the application will have to create an **Azure Spatial Anchors Watcher**:
1. Check that an Azure Spatial Anchors session is running.
2. Create an **AzureSpatialAnchorsLocateCriteria**.
    * You can specify various location parameters like distance from the user or distance from another anchor.
3. Declare the Azure Spatial Anchor identifier you're looking for in the **AzureSpatialAnchorsLocateCritieria**.
4. Call **Create Watcher**.

![Blueprint of start azure spatial anchors watcher custom event](images/asa-unreal/unreal-spatial-anchors-img-21.png)

The application now begins looking for Azure Spatial Anchors known to the Azure Spatial Anchors service, meaning that users can locate Azure Spatial Anchors created by their peers.

After locating the Azure Spatial Anchor, call **Stop Watcher** to stop the Azure Spatial Anchors Watcher and clean up watcher resources.

![Blueprint of stop watcher function being called](images/asa-unreal/unreal-spatial-anchors-img-22.png)

Your final Event Graph blueprint should now look like the screenshot below:

![Blueprint of complete event graph for handling anchor delegate events](images/asa-unreal/unreal-spatial-anchors-img-23.png)

## Next Development Checkpoint

If you're following the Unreal development journey we've laid out, you're in the midst of exploring the MRTK core building blocks. From here, you can continue to the next building block: 

> [!div class="nextstepaction"]
> [Spatial mapping](unreal-spatial-mapping.md)

Or jump to Mixed Reality platform capabilities and APIs:

> [!div class="nextstepaction"]
> [HoloLens camera](unreal-hololens-camera.md)

You can always go back to the [Unreal development checkpoints](unreal-development-overview.md#2-core-building-blocks) at any time.


## Next steps
* [Local Spatial Anchors](unreal-spatial-anchors.md)
* [Spatial Anchors documentation](/azure/spatial-anchors/)
* [Spatial Anchor features](https://azure.microsoft.com/services/spatial-anchors/#features)
* [Effective anchor experience guidelines](/azure/spatial-anchors/concepts/guidelines-effective-anchor-experiences)