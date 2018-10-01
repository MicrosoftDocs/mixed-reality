---
title: QR code tracking
description: Matt will write description.
author: yoyozilla
ms.author: yoyoz
ms.date: 10/02/2018
ms.topic: article
keywords: matt will fill these in
---

# QR code tracking

Write introductory paragraph describing at a high-level what this feature is, how it works, and which devices it supports.

## Enabling and disabling QR code tracking in the driver

In order to turn '''ON''' QR Tracking, run the following script in cmd and then replug in your headset.
<syntaxhighlight lang="bash">
reg add "HKLM\SOFTWARE\Microsoft\HoloLensSensors" /v  EnableQRTrackerDefault /t REG_DWORD /d 1 /F
</syntaxhighlight>

In order to turn '''OFF''' QR Tracking, run the following script in cmd and then replug in your headset. This will make any currently found QR codes ''Non-locatable''.
<syntaxhighlight lang="bash">
reg add "HKLM\SOFTWARE\Microsoft\HoloLensSensors" /v  EnableQRTrackerDefault /t REG_DWORD /d 0 /F
</syntaxhighlight>'''Baraboo''':

For this to work on Baraboo, you need the undocked version of the driver, which currently is in an unreleased branch, RS_ANALOG_RUNTIME_UNDOCK. Note that this branch is not the most stable, and if your build doesn't work, try going back a few days and getting an older one. 

Plug in your device and connect with TShell, and set the reg key as above but with '''regd''' instead of '''reg'''. Run <syntaxhighlight lang="bash">
restartd
</syntaxhighlight>

afterwards to restart the device.

Update: From builds later than 09/06/2018 you will no longer need to set the reg key the velocity feature is turned on for this branch by default.
== Where ==
All the required files and documentation can be found in the build (after 180627)

 \\winbuilds\release\RS_ANALOG_RUNTIME\<latestbuild>\amd64fre\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\

The following files need to be copied into your Unity Assets folder: 

 \\winbuilds\release\RS_ANALOG_RUNTIME\<latestbuild>\amd64fre\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\QRCodesTrackerPlugin.dll
 \\winbuilds\release\RS_ANALOG_RUNTIME\<latestbuild>\amd64fre\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\QRCodesTrackerPlugin.pdb
 \\winbuilds\release\RS_ANALOG_RUNTIME\<latestbuild>\amd64fre\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\QRCodesTrackerPlugin.Placeholder.dll
 \\winbuilds\release\RS_ANALOG_RUNTIME\<latestbuild>\amd64fre\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\QRCodesTrackerPlugin.Placeholder.pdb
 \\winbuilds\release\RS_ANALOG_RUNTIME\<latestbuild>\amd64fre\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\QRCodesTrackerPlugin.winmd
'''Baraboo:'''

For Baraboo, the above applies EXCEPT:
* 
* You need to change the architecture to x86
* You need the following binaries, ensuring they are tagged for x86 WSAPlayer only (the above x64 binaries will need to be marked x64 WSAPlayer only except for the placeholder, which needs to be marked for the Editor).
 \\winbuilds\release\'''RS_ANALOG_RUNTIME'''\<latestbuild>\x86fre\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\QRCodesTrackerPlugin.dll
 \\winbuilds\release\'''RS_ANALOG_RUNTIME'''\<latestbuild>\x86fre\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\QRCodesTrackerPlugin.pdb
 \\winbuilds\release\'''RS_ANALOG_RUNTIME'''\<latestbuild>\x86fre\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\QRCodesTrackerPlugin.winmd

== Preparing Unity with the QRTrackingPlugin ==
Create a folder plugins in your assets folder

Plugins\

QRCodesTrackerPlugin.Placeholder.dll           : get from  \\winbuilds\release\'''RS_ANALOG_RUNTIME'''\<latestbuild>\x86fre\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\QRCodesTrackerPlugin.Placeholder.dll

QRCodesTrackerPlugin.Placeholder.pdb         : get from  \\winbuilds\release\'''RS_ANALOG_RUNTIME'''\<latestbuild>\x86fre\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\QRCodesTrackerPlugin.Placeholder.pdb

WSA\

x64\

QRCodesTrackerPlugin.dll     : get from  \\winbuilds\release\'''RS_ANALOG_RUNTIME'''\<latestbuild>\'''amd64fre'''\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\QRCodesTrackerPlugin.dll

QRCodesTrackerPlugin.pdb     : get from  \\winbuilds\release\'''RS_ANALOG_RUNTIME'''\<latestbuild>\'''amd64fre'''\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\QRCodesTrackerPlugin.pdb

x86\

QRCodesTrackerPlugin.dll     : get from  \\winbuilds\release\'''RS_ANALOG_RUNTIME'''\<latestbuild>\'''x86fre'''\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\QRCodesTrackerPlugin.dll

QRCodesTrackerPlugin.pdb     : get from  \\winbuilds\release\'''RS_ANALOG_RUNTIME'''\<latestbuild>\'''x86fre'''\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\QRCodesTrackerPlugin.pdb

QRCodesTrackerPlugin.winmd :   get from  \\winbuilds\release\'''RS_ANALOG_RUNTIME'''\<latestbuild>\'''x86fre'''\bin\Analog\bin\Input\HeadTracker\QRTrackerAPI\QRCodesTrackerPlugin.winmd

== RS5 SDK ==
To access the new RS5 API Windows::Perception::Spatial::Preview::SpatialGraphInteropPreview::CreateCoordinateSystemForNode, the windows SDK need to be installed the SDK can be found in the following location in the build

\\winbuilds\release\RS_ANALOG\<latestbuild>\Other\kit_bundles\windowssdk

The app can be developed even on RS4 machine but the above SDK need to be installed on the dev machine. make sure your device has that particular SDK this usually might take couple of days for child branches. you can safely install few days older sdk on the dev machine.

== QRTrackingPlugin (Native API) ==
The plugin wraps the APIs for the QR tracking implemented through the RS5 HMD driver. To use the plugin, you will need to use the following types from the QRCodesTrackerPlugin namespace.
<syntaxhighlight lang="c#">
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
</syntaxhighlight>

See the following file for verbose details: 
 os\src\analog\Input\HeadTracker\Unity\QRTrackerAPI\QRTrackerPlugin.Placeholder\QRCodesTracker.cs

== Using the Plugin in Windows UWP ==
C++/CX

<syntaxhighlight lang="cpp">
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
</syntaxhighlight>

<syntaxhighlight lang="cpp">
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
</syntaxhighlight>

== Getting a coordinatesystem ==
We define a right-hand coordinate system aligned with the QR code at the top left of the top left fast detection square. The coordinate system is shown below. The Z-axis is pointing into the paper (not shown) ( When in unity the z-axis is out of the paper and left handed). A SpatialCoordinateSystem is defined that is aligned as shown. This coordinate system can be obtained from the platform using the new '''RS5''' API Windows::Perception::Spatial::Preview::SpatialGraphInteropPreview::CreateCoordinateSystemForNode.

[[File:qr-coordinatesystem.png.png|400px]]


From QRCode^ Code object the following code shows how to create a rectangle and put it in QR coordinate system
<syntaxhighlight lang="cpp">
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
</syntaxhighlight>

You can use the physical size to create the QR rectangle
<syntaxhighlight lang="cpp">
std::vector<float3> qrVertices = CreateRectangle(Code->PhysicalSizeMeters, Code->PhysicalSizeMeters); 
</syntaxhighlight>

Use the platform API (available only from RS5)
The coordinate system can be used to draw the QR code or attaching holograms to the location.

<syntaxhighlight lang="cpp">
Windows::Perception::Spatial::SpatialCoordinateSystem^ qrCoordinateSystem = Windows::Perception::Spatial::Preview::SpatialGraphInteropPreview::CreateCoordinateSystemForNode(Code->Id);
</syntaxhighlight>


All together, your QRCodesTrackerPlugin::QRCodeAddedHandler may look something like this:
<syntaxhighlight lang="cpp">
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
</syntaxhighlight>

The TriangulatePoints function, m_sceneController, and SceneObject are all based off of this [https://github.com/Microsoft/Windows-universal-samples/blob/c2aeaa588d9b134466bbd2cc387c8ff4018f151e/Samples/HolographicSpatialStage/cpp/SpatialStageManager.cpp sample project].

== Sample App ==
We developed a sample test app that just displays a holographic square over the QR code, along with the data associated with it - GUID, physical size, timestamp, and decoded data. It is located at file://\\AnalogFS\Private\Scratch\CHGATLA\QRTracking\QRUnitySample_1.1.11.0_Test\QRUnitySample_1.1.11.0_x86_x64.appxbundle

To install for Oasis, navigate to that folder and run the powershell script. 

To install for Baraboo, connect to your device with TShell and run 

<syntaxhighlight lang="cpp">
Install-AppDevice "\\analogfs\private\Scratch\CHGATLA\QRTracking\QRUnitySample_1.1.11.0_Test\QRUnitySample_1.1.11.0_x86_x64.appxbundle"
</syntaxhighlight>

== Troubleshooting and FAQ ==
'''If it doesn't work on your Oasis device:'''
* Do you have an RS5 build? 
'''If it doesn't work on your Baraboo device:''' 
* Are you running the right branch? Baraboos must be running RS_ANALOG_RUNTIME_UNDOCK to use the QR Tracking API

'''In general, if it doesn't work:'''
* Have you set the reg key? Restarted the device afterwards?
* Is the version a supported version? We don't support the really high density versions like version 40. 
* Are you close enough to the QR code?
'''How close do I need to be to the QR code to detect it?'''

This obviously depends on the size of the QR code, and also what version it is. 
* On Baraboo, for a version 1 QR code varying from 5cm sides to 25 cm sides, the minimum detection distance ranges from 0.25 metres to 0.5 metres. The furthest these can be detected from goes from about 0.5m for the smallest code to 2 metres for the bigger. 
* On Oasis, these distances for the sizes are approximately halved.
* For any codes bigger, extrapolate - the detection distance for size increases linearly. For any code smaller, detection simply will not occur - 4-5cm is the smallest we can detect.
'''QR codes with logos was not reading?'''
* QR codes with logos have not been tested and supported, currently we could do these at some time in future. I got your QR codes I can do some testing.
QR codes encoded in 

'''I want to know how to clear the codes from my app? It seems once you find a code, they are persisted.'''   
* QR codes are only persisted in the boot session. Once you reboot (or restart the driver) they will be gone and detected as new objects next time. They are unique and persisted within the driver session.
# '''How does that work at the underlying platform ?? where are they persisted?'''  They are only persisted in memory (asic/soc). 
# '''How do I clear them.. during testing it is most useful to clear them?''' You can ignore the QR codes older than a timestamp if you want. Currently the API does not have a way to clear them as multiple apps might be interested in them. At app level you can ignore the QR codes not updated recently and a logic can be added to ignore the ones not updated since time t say. It is all app specific and apps an do any thing.
# '''Are these saved at the ‘space’ level or app level?  It seems to me it is beyond app?''' Saved at a system level in driver session. ( or boot session on hololens).

'''From a plugin standpoint, what should I do. My plugin right now is configured for x64.   Is the DLL OK to just reconfigure in Unity as x86?''' 
* Look at the preparing unity section above.
'''Is the rs_analog_runtime_undock  is the only branch that works for QR tracking API in Baraboo?'''  
* Yes, for now it is still in rs_analog_runtime_undock branch. Soon this will RI and we will have it available in other branches, until then only this branch works.
'''Do I need the registry entry in Hololens? If so, how do I add it?  [not familiar w/ editing registry in HoloLens]''' 
* Since 09/08/2018 you will no longer need the reg key on '''HoloLens''' and should be able to use it directly in '''AOC''' or '''AOCT''' builds of the branch '''rs_analog_runtime_undock'''.
