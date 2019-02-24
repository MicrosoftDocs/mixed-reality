---
title: Shared experiences in Unity
description: Share the same holograms between multiple users in a Unity application.
author: thetuvix
ms.author: alexturn
ms.date: 02/24/2019
ms.topic: article
keywords: Sharing, Anchor, WorldAnchor, MR Sharing 250, WorldAnchorTransferBatch, SpatialPerception, Azure, Azure Spatial Anchors, ASA
---



# Shared experiences in Unity

A shared experience is one where multiple users, each with their own HoloLens, iOS or Android device, collectively view and interact with the same hologram which is positioned at a fixed point in space. This is accomplished through spatial anchor sharing.

## Azure Spatial Anchors

You can use [Azure Spatial Anchors](https://docs.microsoft.com/azure/spatial-anchors/overview) to create durable cloud-backed spatial anchors, which your app can then locate across multiple HoloLens, iOS and Android devices.  By sharing a common spatial anchor across multiple devices, each user can see content rendered relative to that anchor in the same physical location.  This allows for real-time shared experiences.

You can also use [Azure Spatial Anchors](https://docs.microsoft.com/azure/spatial-anchors/overview) for asynchronous hologram persistence across HoloLens, iOS and Android devices.  By sharing a durable cloud spatial anchor, multiple devices can observe the same persisted hologram over time, even if those devices are not present together at the same time.

To get started building shared experiences in Unity, try out the 5-minute [Azure Spatial Anchors Unity quickstarts](https://docs.microsoft.com/azure/spatial-anchors/unity-overview).

Once you're up and running with Azure Spatial Anchors, you can then [create and locate anchors in Unity](https://docs.microsoft.com/azure/spatial-anchors/concepts/create-locate-anchors-unity).

## Local anchor transfers


In situations where you cannot use Azure Spatial Anchors, [local anchor transfers](local-anchor-transfers-in-unity.md) enable one HoloLens device to export an anchor to be imported by a second HoloLens device.  Note that this approach provides less robust anchor recall than Azure Spatial Anchors, and iOS and Android devices are not supported by this approach.

>[!NOTE]
>If you have already exported your Unity project to a Visual Studio solution, you will need to either export to a new folder or manually [set this capability in the AppxManifest in Visual Studio](shared-spatial-anchors-in-directx.md#set-up-your-app-to-use-the-spatialperception-capability).

### Setup

The sample code on this page has a few fields that will need to be initialized:
1. *GameObject rootGameObject* is a *GameObject* in Unity that has a *WorldAnchor* Component on it. One user in the shared experience will place this *GameObject* and export the data to the other users.
2. *WorldAnchor gameRootAnchor* is the *UnityEngine.XR.WSA.WorldAnchor* that is on *rootGameObject*.
3. *byte[] importedData* is a byte array for the serialized anchor each client is receiving over the network.

```
public GameObject rootGameObject;
private UnityEngine.XR.WSA.WorldAnchor gameRootAnchor;

void Start ()
{
    gameRootAnchor = rootGameObject.GetComponent<UnityEngine.XR.WSA.WorldAnchor>();

    if (gameRootAnchor == null)
    {
        gameRootAnchor = rootGameObject.AddComponent<UnityEngine.XR.WSA.WorldAnchor>();
    }
}
```

### Exporting

To export, we just need a *WorldAnchor* and to know what we will call it such that it makes sense for the receiving app. One client in the shared experience will perform these steps to export the shared anchor:
1. Create a *WorldAnchorTransferBatch*
2. Add the *WorldAnchors* to transfer
3. Begin the export
4. Handle the *OnExportDataAvailable* event as data becomes available
5. Handle the *OnExportComplete* event

We create a *WorldAnchorTransferBatch* to encapsulate what we will be transferring and then export that into bytes:

```
private void ExportGameRootAnchor()
{
    WorldAnchorTransferBatch transferBatch = new WorldAnchorTransferBatch();
    transferBatch.AddWorldAnchor("gameRoot", this.gameRootAnchor);
    WorldAnchorTransferBatch.ExportAsync(transferBatch, OnExportDataAvailable, OnExportComplete);
}
```

As data becomes available, send the bytes to the client or buffer as segments of data is available and send through whatever means desired:

```
private void OnExportDataAvailable(byte[] data)
{
    TransferDataToClient(data);
}
```

Once the export is complete, if we have been transferring data and serialization failed, tell the client to discard the data. If the serialization succeeded, tell the client that all data has been transferred and importing can start:

```
private void OnExportComplete(SerializationCompletionReason completionReason)
{
    if (completionReason != SerializationCompletionReason.Succeeded)
    {
        SendExportFailedToClient();
    }
    else
    {
        SendExportSucceededToClient();
    }
}
```

### Importing

After receiving all of the bytes from the sender, we can import the data back into a *WorldAnchorTransferBatch* and lock our root game object into the same physical location. Note: import will sometimes transiently fail and needs to be retried:

```
// This byte array should have been updated over the network from TransferDataToClient
private byte[] importedData;
private int retryCount = 3;

private void ImportRootGameObject()
{
    WorldAnchorTransferBatch.ImportAsync(importedData, OnImportComplete);
}

private void OnImportComplete(SerializationCompletionReason completionReason, WorldAnchorTransferBatch deserializedTransferBatch)
{
    if (completionReason != SerializationCompletionReason.Succeeded)
    {
        Debug.Log("Failed to import: " + completionReason.ToString());
        if (retryCount > 0)
        {
            retryCount--;
            WorldAnchorTransferBatch.ImportAsync(importedData, OnImportComplete);
        }
        return;
    }

    this.gameRootAnchor = deserializedTransferBatch.LockObject("gameRoot", this.rootGameObject);
}
```

After a *GameObject* is locked via the *LockObject* call, it will have a *WorldAnchor* which will keep it in the same physical position in the world, but it may be at a different location in the Unity coordinate space than other users.

## Example: MixedRealityToolkit Sharing

You can use the [Sharing](https://github.com/Microsoft/MixedRealityToolkit-Unity/tree/htk_release/Assets/HoloToolkit/Sharing) prefab from the MixedRealityToolkit-Unity repository on GitHub to implement shared experiences in your applications.


## See also
* [Shared experiences in mixed reality](shared-experiences-in-mixed-reality.md)
* [Azure Spatial Anchors](https://docs.microsoft.com/azure/spatial-anchors)
* [Azure Spatial Anchors SDK for Unity](https://docs.microsoft.com/dotnet/api/spatial-anchors/)