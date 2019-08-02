---
title: QR code tracking
description: Learn how to turn on QR code tracking for your Windows Mixed Reality immersive (VR) headset and implement the feature in your VR apps.
author: yoyozilla
ms.author: yoyoz
ms.date: 11/06/2018
ms.topic: article
keywords: vr, lbe, location based entertainment, vr arcade, arcade, immersive, qr, qr code
---

# QR code tracking

QR code tracking is implemented in the Windows Mixed Reality driver for immersive (VR) headsets. By enabling the QR code tracker in the headset driver, the headset scans for QR codes and they are reported to interested apps. This feature is only available as of the [Windows 10 October 2018 Update (also known as RS5)](release-notes-october-2018.md).

>[!NOTE]
>The code snippets in this article currently demonstrate use of C++/CX rather than C++17-compliant C++/WinRT as used in the [C++ holographic project template](creating-a-holographic-directx-project.md).  The concepts are equivalent for a C++/WinRT project, though you will need to translate the code.

## Device support

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><strong>Feature</strong></td>
        <td><a href="hololens-hardware-details.md"><strong>HoloLens</strong></a></td>
        <td><a href="immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>QR code tracking</td>
        <td>❌</td>
        <td>✔️</td>
    </tr>
</table>

## Enabling and disabling QR code tracking for your headset
Note: This section is only valid for [Windows 10 October 2018 Update (also known as RS5)](release-notes-october-2018.md). From 19h1 builds onwards you will not have to do this.
Whether you're developing a mixed reality app that will leverage QR code tracking, or you're a customer of one of these apps, you'll need to manually turn on QR code tracking in your headset's driver.

In order to **turn on QR code tracking** for your immersive (VR) headset:

1. Close the Mixed Reality Portal app on your PC.
2. Unplug the headset from your PC.
3. Run the following script in the Command Prompt:<br>
    `reg add "HKLM\SOFTWARE\Microsoft\HoloLensSensors" /v  EnableQRTrackerDefault /t REG_DWORD /d 1 /F`
4. Reconnect your headset to your PC.

In order to **turn off QR code tracking** for your immersive (VR) headset:

1. Close the Mixed Reality Portal app on your PC.
2. Unplug the headset from your PC.
3. Run the following script in the Command Prompt:<br>
    `reg add "HKLM\SOFTWARE\Microsoft\HoloLensSensors" /v  EnableQRTrackerDefault /t REG_DWORD /d 0 /F`
4. Reconnect your headset to your PC. This will make any discovered QR codes "non-locatable."

## Printing codes

First and foremost, the [spec for QR codes](https://www.qrcode.com/en/howto/code.html) says "The QR Code symbol area requires a margin or "quiet zone" around it to be used. The margin is a clear area around a symbol where nothing is printed. QR Code requires a four-module wide margin at all sides of a symbol." This needs to have a width, on every side, of four times the size of a module - a single black square in the code. The spec page contains advice on how to print QR codes and figure out the area required to make a certain sized QR code.

Currently QR code detection quality is susceptible to varying illumination and backdrop. To combat this, note your illumination and print the appropriate code. In a scene with particularly bright lighting, print a code that is black on a gray background. Under a low-light scene, black on white works. Likewise, if the backdrop to the code is particularly dark, try a black on gray code if your detection rate is low. Otherwise, if the backdrop is lighter, a regular code should work fine.

## QRTracking API

The QRTracking plugin exposes the APIs for QR code tracking. To use the plugin, you will need to use the following types from the *QRCodesTrackerPlugin* namespace.

```cs
 // QRTracker plugin namespace
 namespace QRCodesTrackerPlugin
 {
    // Encapsulates information about a labeled QR code element.
    public class QRCode
    {        
        // Unique id that identifies this QR code for this session.
        public Guid Id { get; private set; }
           
        // Version of this QR code.
        public Int32 Version { get; private set; }
        
        // PhysicalSizeMeters of this QR code.
        public float PhysicalSizeMeters { get; private set; }
        
        // QR code Data.
        public string Code { get; private set; }
        
        // QR code DataStream this is the error corrected data stream
        public Byte[] CodeStream { get; private set; }
        
        // QR code last detected QPC ticks.
        public Int64 LastDetectedQPCTicks { get; private set; }
    };
    
    // The type of a QR Code added event.
    public class QRCodeAddedEventArgs
    {   
        // Gets the QR Code that was added
        public QRCode Code { get; private set; }
    };
    
    // The type of a QR Code removed event.
    public class QRCodeRemovedEventArgs
    {
        // Gets the QR Code that was removed.
        public QRCode Code { get; private set; }
    };
    
    // The type of a QR Code updated event.
    public class QRCodeUpdatedEventArgs
    {
        // Gets the QR Code that was updated.
        public QRCode Code { get; private set; }
    };
    
    // A callback for handling the QR Code added event.
    public delegate void QRCodeAddedHandler(QRCodeAddedEventArgs args);
    
    // A callback for handling the QR Code removed event.
    public delegate void QRCodeRemovedHandler(QRCodeRemovedEventArgs args);
    
    // A callback for handling the QR Code updated event.
    public delegate void QRCodeUpdatedHandler(QRCodeUpdatedEventArgs args);
    
    // Enumerates the possible results of a start of QRTracker.
    public enum QRTrackerStartResult
    {
        // The start has succeeded.
        Success = 0,
        
        //  The currently no device is connected.
        DeviceNotConnected = 1,
        
        // The QRTracking Feature is not supported by the current HMD driver
        // systems
        FeatureNotSupported = 2,
        
        // The access is denide. Administrator needs to enable QR tracker feature.
        AccessDenied = 3,
    };
    
    // QRTracker
    public class QRTracker
    {
        // Constructs a new QRTracker.
        public QRTracker(){}
        
        // Gets the QRTracker.
        public static QRTracker Get()
        {
            return new QRTracker();
        }
        
        // Start the QRTracker. Returns QRTrackerStartResult.
        public QRTrackerStartResult Start()
        {
            throw new NotImplementedException();
        }
        
        // Stops tracking QR codes.
        public void Stop() {}

        // Not Implemented
        Windows.Foundation.Collections.IVector<QRCode> GetList() { throw new NotImplementedException(); }
        
        // Event representing the addition of a QR Code.
        public event QRCodeAddedHandler Added = delegate { };
        
        // Event representing the removal of a QR Code.
        public event QRCodeRemovedHandler Removed = delegate { };
        
        // Event representing the update of a QR Code.
        public event QRCodeUpdatedHandler Updated = delegate { };
    };
}
```

## Implementing QR code tracking in Unity

### Sample Unity scenes in MRTK (Mixed Reality Toolkit)

You can find an example for how to use the QR Tracking API in the Mixed Reality Toolkit [GitHub site](https://github.com/Microsoft/MixedRealityToolkit-Unity/tree/htk_release/Assets/HoloToolkit-Preview/QRTracker).

MRTK has implemented the needed scripts to simpilify the QR tracking usage. All necessary assets to develop QR tracking apps are in the "QRTracker" folder. There are two scenes: the first is a sample to simply show details of the QR codes as they are detected, and the second demonstrates how to use the coordinate system attached to the QR code to display holograms.
There is a prefab "QRScanner" which added all the necessary scripts to the scenes to use QRCodes. The script QRCodeManager is a singleton class that implements the QRCode API. This needs to be added to your scene. The script "AttachToQRCode" is used to attach holograms to the QR Code coordinate systems, this script can be added to any of your holograms. The "SpatialGraphCoordinateSystem" shows how to use the QRCode coordinate system. These scripts can be used as-is in your project scenes or you can write your own directly using the plugin as described above.

### Implementing QR code tracking in Unity without MRTK

You can also use the QR Tracking API in Unity without taking a dependency on MRTK. In order to use the API, you will need to prepare your project with the following instruction:

1. Create a new folder in the assets folder of your unity project with the name: "Plugins".
2. Copy all the required files from [this folder](https://github.com/Microsoft/MixedRealityToolkit-Unity/tree/htk_release/Assets/HoloToolkit-Preview/QRTracker/Plugins) into the local "Plugins" folder you just created.
3. You can use the QR tracking scripts in the [MRTK scripts folder](https://github.com/Microsoft/MixedRealityToolkit-Unity/tree/htk_release/Assets/HoloToolkit-Preview/QRTracker/Scripts) or write your own.
Note: These plugins are only for [Windows 10 October 2018 Update (also known as RS5)](release-notes-october-2018.md) builds. The plugins will be updated with the next windows release. The current plugins were experimental and will not work for future version of the windows. New plugins will be published which can be used from next windows release and they will not be backwards compatable and will not work with RS5).

## Implementing QR code tracking in DirectX

To use the QRTrackingPlugin in Visual Studio, you will need to add reference of the QRTrackingPlugin to the .winmd. You can find the [required files for supported platforms here](https://github.com/Microsoft/MixedRealityToolkit-Unity/tree/htk_release/Assets/HoloToolkit-Preview/QRTracker/Plugins/WSA).

```cpp
// MyClass.h
public ref class MyClass
{
    private:
      QRCodesTrackerPlugin::QRTracker^ m_qrtracker;
      // Handlers
      void OnAddedQRCode(QRCodesTrackerPlugin::QRCodeAddedEventArgs ^args);
      void OnUpdatedQRCode(QRCodesTrackerPlugin::QRCodeUpdatedEventArgs ^args);
      void OnRemovedQRCode(QRCodesTrackerPlugin::QRCodeRemovedEventArgs ^args);
    ..
};
```

```cpp
// MyClass.cpp
MyClass::MyClass()
{
    // Create the tracker and register the callbacks
    m_qrtracker = ref new QRCodesTrackerPlugin::QRTracker();
    m_qrtracker->Added += ref new QRCodesTrackerPlugin::QRCodeAddedHandler(this, &OnAddedQRCode);
    m_qrtracker->Updated += ref new QRCodesTrackerPlugin::QRCodeUpdatedHandler(this, &OnUpdatedQRCode);
    m_qrtracker->Removed += ref new QRCodesTrackerPlugin::QRCodeRemovedHandler(this, &QOnRemovedQRCode);

    // Start the tracker
    if (m_qrtracker->Start() != QRCodesTrackerPlugin::QRTrackerStartResult::Success)
    {
      // Handle the failure
      // It can fail for multiple reasons and can be handled properly 
    }
}

void MyClass::OnAddedQRCode(QRCodesTrackerPlugin::QRCodeAddedEventArgs ^args)
{
    // use args->Code add to own list  
}

void MyClass::OnUpdatedQRCode(QRCodesTrackerPlugin::QRCodeUpdatedEventArgs ^args)
{
    // use args->Code update the existing one with the new one in own list 
}

void MyClass::OnRemovedQRCode(QRCodesTrackerPlugin::QRCodeRemovedEventArgs ^args)
{
    // use args->Code remove from own list.
}
```

## Getting a coordinate system

We define a right-hand coordinate system aligned with the QR code at the top left corner of the fast detection square in the top left. The coordinate system is shown below. The Z-axis is pointing into the paper (not shown), but in Unity the z-axis is out of the paper and left-handed.

A SpatialCoordinateSystem is defined that is aligned as shown. This coordinate system can be obtained from the platform using the API *Windows::Perception::Spatial::Preview::SpatialGraphInteropPreview::CreateCoordinateSystemForNode*.

![QR code coordinate system](images/Qr-coordinatesystem.png) 

From QRCode^ Code object, the following code shows how to create a rectangle and put it in QR coordinate system:

```cpp
// Creates a 2D rectangle in the x-y plane, with the specified properties.
std::vector<float3> SpatialStageManager::CreateRectangle(float width, float height)
{
    std::vector<float3> vertices(4);

    vertices[0] = { 0,  0, 0 };
    vertices[1] = { width,  0, 0 };
    vertices[2] = { width,  height, 0 };
    vertices[3] = { 0,  height, 0 };

    return vertices;
}
```

You can use the physical size to create the QR rectangle:

```cpp
std::vector<float3> qrVertices = CreateRectangle(Code->PhysicalSizeMeters, Code->PhysicalSizeMeters); 
```

The coordinate system can be used to draw the QR code or attach holograms to the location:

```cpp
Windows::Perception::Spatial::SpatialCoordinateSystem^ qrCoordinateSystem = Windows::Perception::Spatial::Preview::SpatialGraphInteropPreview::CreateCoordinateSystemForNode(Code->Id);
```

Altogether, your *QRCodesTrackerPlugin::QRCodeAddedHandler* may look something like this:

```cpp
void MyClass::OnAddedQRCode(QRCodesTrackerPlugin::QRCodeAddedEventArgs ^args)
{
    std::vector<float3> qrVertices = CreateRectangle(args->Code->PhysicalSizeMeters, args->Code->PhysicalSizeMeters);
    std::vector<unsigned short> qrCodeIndices = TriangulatePoints(qrVertices);
    XMFLOAT3 qrAreaColor = XMFLOAT3(DirectX::Colors::Aqua);

    Windows::Perception::Spatial::SpatialCoordinateSystem^ qrCoordinateSystem =  Windows::Perception::Spatial::Preview::SpatialGraphInteropPreview::CreateCoordinateSystemForNode(args->Code->Id);
    std::shared_ptr<SceneObject> m_qrShape =
        std::make_shared<SceneObject>(
            m_deviceResources,
            reinterpret_cast<std::vector<XMFLOAT3>&>(qrVertices),
            qrCodeIndices,
            qrAreaColor,
            qrCoordinateSystem);

    m_sceneController->AddSceneObject(m_qrShape);
}
```

## Troubleshooting and FAQ

**General troubleshooting**

* Is your PC running the Windows 10 October 2018 Update?
* Have you set the reg key? Restarted the device afterwards?
* Is the QR code version a supported version? Current API supports up to QR Code Version 20. We recommend using version 5 for general usage. 
* Are you close enough to the QR code? The closer the camera is to the QR code, the higher the QR code version the API can support.  

**How close do I need to be to the QR code to detect it?**

This will depend on the size of the QR code, and also what version it is. For a version 1 QR code varying from 5 cm sides to 25 cm sides, the minimum detection distance ranges from 0.15 meters to 0.5 meters. The farthest away these can be detected from goes from about 0.3 meters for the smaller QR code targets to 1.4 meters for the bigger. For QR codes bigger than that, you can estimate; the detection distance for size increases linearly. Our tracker does not work with QR codes with sides smaller than 5 cm.

**Do QR codes with logos work?**

QR codes with logos have not been tested and are currently unsupported.

**How do I clear QR codes from my app so they don't persist?**

* QR codes are only persisted in the boot session. Once you reboot (or restart the driver), they will be gone and detected as new objects next time.
* QR code history is saved at the system level in the driver session, but you can configure your app to ignore QR codes older than a specific timestamp if you want. Currently the API does support clearing QR code history, as multiple apps might be interested in the data.

**The plugins for RS5 and future versions are not compatable**
RS5 version of the plugin only works for RS5 and will not work for future versions. The expermental plugin will be replaced with the real plugin and should be the one that we can use in future versions of the windows.
