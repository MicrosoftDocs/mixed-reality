---
title: QR code tracking
description: Learn how to turn on QR code tracking for your Windows Mixed Reality headset and implement the feature in your apps.
author: dorreneb
ms.author: dobrown
ms.date: 05/15/2019
ms.topic: article
keywords: vr, lbe, location based entertainment, vr arcade, arcade, immersive, qr, qr code, hololens2
---

# QR Code Tracking

Specific Windows Mixed Reality devices can use QR codes to track in an environment. When enabled, the headset reports instances of QR codes found in an environment to your app.

>[!NOTE]
>The code snippets in this article currently demonstrate the use of C++/CX rather than C++17-compliant C++/WinRT as used in the [C++ holographic project template](creating-a-holographic-directx-project.md). The concepts are equivalent for a C++/WinRT project, though you need to translate the code.

## Device Compatibility for QR Code Tracking

### HoloLens (1st gen)
HoloLens (1st gen) cannot natively track QR codes.

### HoloLens 2
HoloLens 2 can track QR codes by default. 

Apps that use this feature must request the webcam capability to read QR codes in a space.

### Windows Mixed Reality (VR) Headsets
Windows Mixed Reality (VR) headsets running Windows 10 version 1809 can track QR codes if the `HKLM\SOFTWARE\Microsoft\HoloLensSensors` registry key is enabled.

#### To turn on QR tracking:

1. Close the Mixed Reality Portal app on your PC.
2. Unplug the headset from your PC.
3. Open Command Prompt as administrator and run the following script: <br>
    `reg add "HKLM\SOFTWARE\Microsoft\HoloLensSensors" /v  EnableQRTrackerDefault /t REG_DWORD /d 1 /F`
4. Reconnect your headset to your PC.

#### To turn off QR tracking:

1. Close the Mixed Reality Portal app on your PC.
2. Unplug the headset from your PC.
3. Open Command Prompt as administrator and run the following script:<br>
    `reg add "HKLM\SOFTWARE\Microsoft\HoloLensSensors" /v  EnableQRTrackerDefault /t REG_DWORD /d 0 /F`

Completing these steps makes any discovered QR codes non-locatable.

>[!NOTE]
> Note that the version of QR tracking on Windows 10 version 1809 does not work on future versions of Windows, such as the version of Windows running on Hololens 2. If you migrate your app from VR to Hololens 2, you must update your QR tracking DLL.

## Getting the QR Code APIs
Please download the NuGet package for the QR APIs [here](https://github.com/dorreneb/mixed-reality/releases).

## QRTracking API

The QRTracking plugin exposes the APIs for QR code tracking.

```cs
namespace Microsoft.MixedReality.QR
{
    /// <summary>
    /// QR Code Version Information.
    /// </summary>
    public enum VersionInfo
    {
        /// <summary>
        /// QR Code Version 1.
        /// </summary>
        QR1 = 1,
        /// <summary>
        /// QR Code Version 2.
        /// </summary>
        QR2 = 2,
        /// <summary>
        /// QR Code Version 3.
        /// </summary>
        QR3 = 3,
        /// <summary>
        /// QR Code Version 4.
        /// </summary>
        QR4 = 4,
        /// <summary>
        /// QR Code Version 5.
        /// </summary>
        QR5 = 5,
        /// <summary>
        /// QR Code Version 6.
        /// </summary>
        QR6 = 6,
        /// <summary>
        /// QR Code Version 7.
        /// </summary>
        QR7 = 7,
        /// <summary>
        /// QR Code Version 8.
        /// </summary>
        QR8 = 8,
        /// <summary>
        /// QR Code Version 9.
        /// </summary>
        QR9 = 9,
        /// <summary>
        /// QR Code Version 10.
        /// </summary>
        QR10 = 10,
        /// <summary>
        /// QR Code Version 11.
        /// </summary>
        QR11 = 11,
        /// <summary>
        /// QR Code Version 12.
        /// </summary>
        QR12 = 12,
        /// <summary>
        /// QR Code Version 13.
        /// </summary>
        QR13 = 13,
        /// <summary>
        /// QR Code Version 14.
        /// </summary>
        QR14 = 14,
        /// <summary>
        /// QR Code Version 15.
        /// </summary>
        QR15 = 15,
        /// <summary>
        /// QR Code Version 16.
        /// </summary>
        QR16 = 16,
        /// <summary>
        /// QR Code Version 17.
        /// </summary>
        QR17 = 17,
        /// <summary>
        /// QR Code Version 18.
        /// </summary>
        QR18 = 18,
        /// <summary>
        /// QR Code Version 19.
        /// </summary>
        QR19 = 19,
        /// <summary>
        /// QR Code Version 20.
        /// </summary>
        QR20 = 20,
        /// <summary>
        /// QR Code Version 21.
        /// </summary>
        QR21 = 21,
        /// <summary>
        /// QR Code Version 22.
        /// </summary>
        QR22 = 22,
        /// <summary>
        /// QR Code Version 23.
        /// </summary>
        QR23 = 23,
        /// <summary>
        /// QR Code Version 24.
        /// </summary>
        QR24 = 24,
        /// <summary>
        /// QR Code Version 25.
        /// </summary>
        QR25 = 25,
        /// <summary>
        /// QR Code Version 26.
        /// </summary>
        QR26 = 26,
        /// <summary>
        /// QR Code Version 27.
        /// </summary>
        QR27 = 27,
        /// <summary>
        /// QR Code Version 28.
        /// </summary>
        QR28 = 28,
        /// <summary>
        /// QR Code Version 29.
        /// </summary>
        QR29 = 29,
        /// <summary>
        /// QR Code Version 30.
        /// </summary>
        QR30 = 30,
        /// <summary>
        /// QR Code Version 31.
        /// </summary>
        QR31 = 31,
        /// <summary>
        /// QR Code Version 32.
        /// </summary>
        QR32 = 32,
        /// <summary>
        /// QR Code Version 33.
        /// </summary>
        QR33 = 33,
        /// <summary>
        /// QR Code Version 34.
        /// </summary>
        QR34 = 34,
        /// <summary>
        /// QR Code Version 35.
        /// </summary>
        QR35 = 35,
        /// <summary>
        /// QR Code Version 36.
        /// </summary>
        QR36 = 36,
        /// <summary>
        /// QR Code Version 37.
        /// </summary>
        QR37 = 37,
        /// <summary>
        /// QR Code Version 38.
        /// </summary>
        QR38 = 38,
        /// <summary>
        /// QR Code Version 39.
        /// </summary>
        QR39 = 39,
        /// <summary>
        /// QR Code Version 40.
        /// </summary>
        QR40 = 40,
        /// <summary>
        /// Micro QR Code Version M1.
        /// </summary>
        MicroQRM1 = 41,
        /// <summary>
        /// Micro QR Code Version M2.
        /// </summary>
        MicroQRM2 = 42,
        /// <summary>
        /// Micro QR Code Version M3.
        /// </summary>
        MicroQRM3 = 43,
        /// <summary>
        /// Micro QR Code Version M4.
        /// </summary>
        MicroQRM4 = 44,
    };

    /// <summary>
    /// Encapsulates information about a labeled spatial anchored element.
    /// </summary>
    /// <remarks>
    /// This type if the 'glue' between spatial anchors (which have no meaning attached to them) and App Holograms.
    /// SpatialEntity are designed to work as 'spatial labels' in the world. Proximity can be used to discover content attached to SpatialAnchors.
    /// In addition, SpatialEntities can be shared across devices/users.
    /// </remarks>
    public class QRCode
    {
        /// <summary>
        /// Unique id that identifies this QR code for this session.
        /// </summary>
        public Guid Id { get; private set; }

        /// <summary>
        /// Spatial graph node id for this QR code to create a coordinate system.
        /// </summary>
        public Guid SpatialGraphNodeId { get; private set; }

        /// <summary>
        /// Version of this QR code. Version 1 -40 are regular QRCodes and 41-44 are the Micro QRCode 1-4
        /// </summary>
        public VersionInfo Version { get; private set; }

        /// <summary>
        /// Physical width or height of this QR code in Meters.
        /// </summary>
        public float PhysicalSideLength { get; private set; }

        /// <summary>
        /// QR code Data.
        /// </summary>
        public String Data { get; private set; }

        /// <summary>
        /// Size of the RawData of this QR code.
        /// </summary>
        public UInt32 RawDataSize { get; private set; }

        /// <summary>
        /// QR code Get the CodeRawData copy, this is the error corrected raw data bytes.
        /// Used when the platform is unable to decode the encoding and user can
        /// decode as needed.
        /// </summary>
        public void GetRawData(byte[] buffer) { }

        /// <summary>
        /// QR code last detected system relative time in 100ns ticks.
        /// </summary>
        public System.TimeSpan SystemRelativeLastDetectedTime { get; private set; }

        /// <summary>
        /// QR code last detected time.
        /// </summary>
        public System.DateTimeOffset LastDetectedTime { get; private set; }
    }

    /// <summary>
    /// The type of a QR Code added event.
    /// </summary>
    public class QRCodeAddedEventArgs
    {
        /// <summary>
        /// Gets the QR Code that was added
        /// </summary>
        public QRCode Code { get; private set; }
    };

    /// <summary>
    /// The type of a QR Code removed event.
    /// </summary>
    public class QRCodeRemovedEventArgs
    {
        /// <summary>
        /// Gets the QR Code that was removed.
        /// </summary>
        public QRCode Code { get; private set; }
    };

    /// <summary>
    /// The type of a QR Code updated event.
    /// </summary>
    public class QRCodeUpdatedEventArgs
    {
        /// <summary>
        /// Gets the QR Code that was updated.
        /// </summary>
        public QRCode Code { get; private set; }
    };

    /// <summary>
    /// Enumerates the possible results of a request access.
    /// </summary>
    public enum QRCodeWatcherAccessStatus
    {
       /// <summary>
        /// DeniedBySystem.
        /// </summary>
        DeniedBySystem = 0,
        /// <summary>
        /// NotDeclaredByApp.
        /// </summary>
        NotDeclaredByApp = 1,
        /// <summary>
        /// DeniedByUser.
        /// </summary>
        DeniedByUser = 2,
        /// <summary>
        /// UserPromptRequired.
        /// </summary>
        UserPromptRequired = 3,
        /// <summary>
        /// Allowed.
        /// </summary>
        Allowed = 4,
    };

    /// <summary>
    /// QRTracker
    /// </summary>
    public class QRCodeWatcher
    {
        /// <summary>
        /// Is QR Codes feature supported.
        /// </summary>
        /// <remarks>
        /// </remarks>
        public static bool IsSupported() { return false; }

#if false // Not available in placeholder
        /// <summary>
        /// Request the required access permissions to use QR Codes feature.
        /// </summary>
        /// <remarks>
        /// </remarks>
        public static Windows.Foundation.IAsyncOperation<Microsoft.MixedReality.QR.QRCodeWatcherAccessStatus> RequestAccessAsync()
        {
            return null;
        }
#endif

        /// <summary>
        /// Constructs a new QRTracker.
        /// </summary>
        public QRCodeWatcher()
        {
        }

        /// <summary>
        /// Starts tracking QR codes
        /// Start should only be called once the RequestAccessAsync has succeeded.
        /// Should not be called if the feature is not supported, check the IsSupported to see 
        ///  if this feature is supported.
        /// Raises exceptions E_ACCESSDENIED, E_NOT_VALID_STATE, ERROR_NOT_SUPPORTED
        /// </summary>
        /// <remarks>
        /// </remarks>
        public void Start()
        {
        }

        /// <summary>
        /// Stops tracking QR codes.
        /// </summary>
        /// <remarks>
        /// </remarks>
        public void Stop()
        {

        }

        /// <summary>
        /// Get the list of QR codes detected.
        /// </summary>
        /// <remarks>
        /// </remarks>
        public System.Collections.Generic.IList<QRCode> GetList() { return new System.Collections.Generic.List<QRCode>(); }

        /// <summary>
        /// Event representing the addition of a QR Code.
        /// </summary>
        public event EventHandler<QRCodeAddedEventArgs> Added = delegate { };

        /// <summary>
        /// Event representing the removal of a QR Code.
        /// </summary>
        public event EventHandler<QRCodeRemovedEventArgs> Removed = delegate { };


        /// <summary>
        /// Event representing the update of a QR Code.
        /// </summary>
        public event EventHandler<QRCodeUpdatedEventArgs> Updated = delegate { };

        /// <summary>
        /// Event representing the Enumeration of QR Codes completed.
        /// </summary>
        public event EventHandler<Object> EnumerationCompleted = delegate { };

    };
```

## Using QR Code Tracking

### Capabilities for the QR Code API
You will need the capability `webcam` added to your manifest. Permission can be requested by calling `QRCodeWatcher.RequestAccessAsync()`.

```
#if WINDOWS_UWP 
async QRCodeWatcher.RequestAccessAsync(); 
#endif 
```

Permission should be requested before you construct a QRCodeWatcher object. 

### Implementing QR code tracking in Unity

You can use the QR Tracking API in Unity without taking a dependency on MRTK. To do so, you must:

1. Create a new folder in the assets folder of your unity project with the name *Plugins*.
2. Copy all the required files from this folder into the local "Plugins" folder you just created.

You can find an example of QR tracking in Unity [on Github here](
https://github.com/chgatla-microsoft/QRTracking/tree/master/AppPackages/SampleQRCodes_1.0.23.0_Master_Test).

### Implementing QR code tracking in Windows UWP

```
using namespace Microsoft.MixedReality.QR

   public ref class QRListHelper sealed
    {
    public:
        QRListHelper()
        {

        }

        void setApp(SpatialStageManager* pStage)
        {
            m_pStage = pStage;
        }

        void SetUpQRCodes()
        {
            if (QRCodeWatcher::IsSupported())
            {
                auto operation = QRCodeWatcher::RequestAccessAsync();

                WeakReference weakThis(this);

                operation->Completed = ref new AsyncOperationCompletedHandler<QRCodeWatcherAccessStatus>(
                    [weakThis](IAsyncOperation< QRCodeWatcherAccessStatus>^ operaion, AsyncStatus status)
                {
                    QRListHelper^ QRListHelper = weakThis.Resolve<QRListHelper>();
                    if (status == AsyncStatus::Completed)
                    {
                        QRListHelper->InitializeQR( operaion->GetResults());
                    }
                }
                );
            }
        }

    private:
        void OnAddedQRCode(QRCodeWatcher^ , QRCodeAddedEventArgs ^args)
        {
            m_pStage->OnAddedQRCode(args);
        }
        void OnUpdatedQRCode(QRCodeWatcher^, QRCodeUpdatedEventArgs ^args)
        {
            m_pStage->OnUpdatedQRCode(args);
        }
        void OnEnumerationComplete(QRCodeWatcher^, Object^)
        {
            m_pStage->OnEnumerationComplete();
        }

        SpatialStageManager* m_pStage;
        Microsoft::MixedReality::QR::QRCodeWatcher^ m_qrWatcher;



        void InitializeQR(QRCodeWatcherAccessStatus status)
        {
            if (status == QRCodeWatcherAccessStatus::Allowed)
            {
                m_qrWatcher = ref new QRCodeWatcher();

                m_qrWatcher->Added += ref new TypedEventHandler<QRCodeWatcher^, QRCodeAddedEventArgs^>(this, &QRListHelper::OnAddedQRCode);
                m_qrWatcher->Updated += ref new TypedEventHandler<QRCodeWatcher^, QRCodeUpdatedEventArgs^>(this, &QRListHelper::OnUpdatedQRCode);
                m_qrWatcher->EnumerationCompleted += ref new TypedEventHandler<QRCodeWatcher^, Object^>(this, &QRListHelper::OnEnumerationComplete);
                try
                {
                    m_qrWatcher->Start();
                }
                catch (...)
                {

                }
            }
            else
            {
                // Permission denied by system or user
                // Handle the failures
            }
        }
    }; 
```    

### Sample App

There is a sample app that displays a holographic square over QR codes, along with the associated data such as GUID, physical size, timestamp, and decoded data. This app can be located at https://github.com/chgatla-microsoft/QRTracking/tree/master/SampleQRCodes.

## Getting a coordinate system

We define a right-hand coordinate system aligned with the QR code at the top left corner of the fast detection square in the top left as seen below. The Z-axis is pointing into the paper (not shown), but in Unity, the z-axis is out of the paper and left-handed.

A SpatialCoordinateSystem aligns as shown. This coordinate system can be obtained from the platform using the API `Windows::Perception::Spatial::Preview::SpatialGraphInteropPreview::CreateCoordinateSystemForNode`.

![QR code coordinate system](images/Qr-coordinatesystem.png) 

From QRCode^ Code object, the following code shows how to create a rectangle and put it in the QR coordinate system:

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

## Considerations when creating tracking QR Codes

### Quiet zones around QR Codes

To be read correctly, QR codes require a margin around all sides of the code. This margin must not contain and printed content and should be four modules (a single black square in the code) wide. 

The [QR spec](https://www.qrcode.com/en/howto/code.html) contains more information about quiet zones.

### Lighting and backdrop
QR code detection quality is susceptible to varying illumination and backdrop. 

In a scene with particularly bright lighting, print a code that is black on a gray background. Otherwise, print a black QR code on a white background.

If the backdrop to the code is particularly dark, try a black on gray code if your detection rate is low. If the backdrop is relatively light, a regular code should work fine.

### Size of QR codes
WMR does not work with QR codes with sides smaller than 5 cm each.

For QR codes between 5 and 10 cm length sides, you must be fairly close to detect the code. It will also take longer to detect codes at this size. 

The exact time to detect codes depends not only on the size of the QR codes, but how far you are away from the code. Moving closer to the code will help offset issues with size.

### Distance and angular position from the QR code
The tracking cameras can only detect a certain level of detail. For really small codes - < 10cm along the sides - you must be fairly close. For a version 1 QR code varying from 10 to 25 cm wide, the minimum detection distance ranges from 0.15 meters to 0.5 meters. 

The detection distance for size increases linearly. 

QR detection works with a range of angles += 45deg. This is to ensure we have proper resolution to detect the code.

### QR codes with logos
QR codes with logos have not been tested and are currently unsupported.

### Managing QR code data
WMR devices save QR codes in the boot session. Once you reboot the device or restart the driver, they are gone and will be re-detected as new objects next time. QR code history is saved at the system level in the driver session. It is recommended to configure your app to ignore QR codes older than a specific timestamp.

Currently, the API does not support clearing QR code history.
