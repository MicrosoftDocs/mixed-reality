---
title: Local anchor transfers in Unity
description: Learn how to transfer anchors between multiple HoloLens devices in a Unity mixed reality application.
author: fieldsjacksong
ms.author: jacksonf
ms.date: 03/21/2018
ms.topic: article
keywords: Sharing, Anchor, WorldAnchor, MR Sharing 250, WorldAnchorTransferBatch, SpatialPerception, transfer, local anchor transfer, anchor export, anchor import
---

# Local anchor transfers in Unity

In situations where you cannot use <a href="/azure/spatial-anchors" target="_blank">Azure Spatial Anchors</a>, local anchor transfers enable one HoloLens device to export an anchor to be imported by a second HoloLens device.

>[!NOTE]
>Local anchor transfers provide less robust anchor recall than <a href="/azure/spatial-anchors" target="_blank">Azure Spatial Anchors</a>, and iOS and Android devices are not supported by this approach.

### Setting the SpatialPerception capability

In order for an app to transfer spatial anchors, the *SpatialPerception* capability must be enabled.

How to enable the *SpatialPerception* capability:
1. In the Unity Editor, open the **"Player Settings"** pane (Edit > Project Settings > Player)
2. Click on the **"Windows Store"** tab
3. Expand **"Publishing Settings"** and check the **"SpatialPerception"** capability in the **"Capabilities"** list

>[!NOTE]
>If you have already exported your Unity project to a Visual Studio solution, you will need to either export to a new folder or manually [set this capability in the AppxManifest in Visual Studio](local-anchor-transfers-in-directx.md#set-up-your-app-to-use-the-spatialperception-capability).

### Anchor Transfer

**Namespace:** *UnityEngine.XR.WSA.Sharing*<br>
**Type**: *WorldAnchorTransferBatch*

To transfer a [WorldAnchor](../develop/unity/coordinate-systems-in-unity.md), one must establish the anchor to be transferred. The user of one HoloLens scans their environment and either manually or programmatically chooses a point in space to be the Anchor for the shared experience. The data that represents this point can then be serialized and transmitted to the other devices that are sharing in the experience. Each device then de-serializes the anchor data and attempts to locate that point in space. In order for Anchor Transfer to work, each device must have scanned in enough of the environment such that the point represented by the anchor can be identified.

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