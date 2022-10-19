---
title: Perception simulation - standalone package (Preview)
description: A guide to using the Perception Simulation standalone package release
author: pbarnettms
ms.author: pbarnett
ms.date: 10/19/2022
ms.topic: article
keywords: HoloLens, simulation, testing
---

# Perception simulation (Preview)

This standalone package release of Perception Simulation allows for more frequent updates independent of operating system releases and brings new features, including: 

* **Recording and playback:** The ability to record actions performed with Perception Simulation for playback in an automated fashion with minimal code. 

* **Validators:** During playback of recordings, Perception Simulation can call back into your test code, where you can validate state using metadata embedded in the recording.

* **Video streaming:** The Perception Simulation Control user interface can display a live view of HoloLens 2 device or Emulator and allow direct control using keyboard, mouse, or gamepad, which is similar to the HoloLens 2 Emulator. A video client API is also provided to allow automated tests to capture screenshots. 

* **Full native API:** In addition to continuing to provide a managed code client API, this release includes headers and libraries for extended Perception Simulation or writing tests in C++. 

* **New REST client:** When connecting to a remote device, the new native REST client provides increased robustness and allows access from both native and managed code. 

## System requirements 

* Approximately 60MB of disk space 

* Windows 10 version 2004 or newer 

>[!Note] 
>This version of Perception Simulation installs and runs side-by-side with the version contained in the Windows 10 and 11 operating systems.  The shortcut to **Perception Simulation Control** on the **Start** menu will launch and use this preview version, which is stored in `\Program Files\Microsoft Perception Simulation`.  If you launch developer tools from within the **Mixed Reality Portal**, the **HoloLens 2 Emulator**, or from `\Windows\System32\PerceptionSimulation`, you will be running the older version.  To use this preview version, be sure to build any test code using the reference assemblies or headers and libraries under `\Program Files\Microsoft Perception Simulation`. 

>[!Note] 
>This release is compatible with HoloLens 2 without installing anything new onto the HoloLens 2 headset.  A future update to HoloLens 2 will enable the Scene Understanding feature in this preview release. 

## Installation 

The preview installer will install the following components: 

* **The Perception Simulation Control app:** This app is the user interface for manually controlling simulation and creating recordings. 

* **The Perception Simulation drivers:**  This includes the Perception Simulation Headset driver and the Perception Simulation 6-DOF Controller driver. Both drivers are used for Windows Mixed Reality. 

* **Spatial Mapping recordings for use with HoloLens 2:**  These are the same recordings that are provided with the HoloLens 2 Emulator. 

* **Scene Understanding room captures:** These will be enabled in a future HoloLens 2 update.

* **The Perception Simulation Native SDK:** This includes C++ headers and libraries that enable writing tools, apps and test automation that drive Perception Simulation programmatically from native code. 

* **The Perception Simulation Managed SDK:** This includes managed reference assemblies that enable writing tools, apps, and test automation that drive Perception Simulation programmatically from managed code.

## Manual control

To control Windows Mixed Reality or HoloLens 2 using keyboard, mouse, or gamepad: 

1. Launch the **Perception Simulation Control** app. 

2. Select the target product from the dropdown at the top of the window.  For this release, use **HoloLens 2 (Legacy)** for existing HoloLens 2 devices. 

3. For a remote device, such as HoloLens, enter the IP address of the HoloLens device or emulator. 

    Ensure that **Device Portal** is enabled on the target device.  This is enabled by default in the HoloLens 2 Emulator, but will need to be enabled manually on a physical HoloLens device, or on the target PC when using **Windows Mixed Reality (Remote)**. 

4. Toggle the Headset switch to **On**. 

## Creating a recording 

You can create a recording of manual Perception Simulation actions using the **Perception Simulation Control** app and then play back the recording manually or in an automated test: 

1. Connect to the target device. 

2. Scroll down the window until you see the **Recordings** section. 

3. Press the **Record** button. 

4. Select a folder and give the recording a filename. 

5. Perform your actions in the UX manually using **Perception Simulation Control** - look around, interact, etc. 

    During recording, you can optionally insert a validation step into your recording: click the **Add Validation** button and then fill in the popup UI that appears.

6. Click the **Stop** button.  The new recording will be saved to disk and loaded automatically.  Hit **Play** to playback the actions. 

## Creating test automation 

To create test automation using managed code: 

1. Create a new .NET Frame 4.7 managed code project in Visual Studio. 

1. Add references to `PerceptionSimulation.Interop`, `PerceptionSimulationManager.Interop` and `SimulationStream.Interop`.  You'll find these in the managed SDK folder (`%ProgramFiles%\Microsoft Perception Simulation\Sdk\References`) or in the `Sdk\References` folder in the **Universal Package**. 

1. Add an existing item link in your managed code project to `PerceptionSimulationManager.dll` and set it to **Copy if newer**. 

1. Add `using Microsoft.PerceptionSimulation`. 

Here is the basic sample C# code that connects to a remote HoloLens, executes a **Home** (System) gesture, then plays a recording: 

```csharp
using Microsoft.PerceptionSimulation; 
using System; 
 
namespace SimulationManagedTestApp 
{ 
    internal class Program 
    { 
        static void Main(string[] args) 
        { 
            string server = "http://192.168.0.1"; 
            ISimulationRestClient client = PerceptionSimulationManager.CreatePerceptionSimulationRestClient(server, null, null, StreamDataTypes.All, null); 
            client.Connect(); 
 
            ISimulationStreamSink sink = ((ISimulationStreamSinkFactory)client).CreateSimulationStreamSink(); 
            IPerceptionSimulationManager manager = PerceptionSimulationManager.CreatePerceptionSimulationManager(sink); 
 
            manager.Human.LeftHand.Activated = true; 
            manager.Human.LeftHand.PerformGesture(SimulatedGesture.Home); 
 
            ISimulationRecording recording = PerceptionSimulationManager.LoadPerceptionSimulationRecording("C:\\Tools\\Recordings\\test.xef", ((ISimulationStreamSinkFactory)client), null); 
            recording.Play(); 
            // Instead of just sleeping here, you probably want to register an ISimulationRecordingCallback object to get state changes of the recording, and perhaps a callback to 
            // get validation request callbacks by implementing ISimulationRecordingCallback2 and providing that object to the LoadPerceptionSimulationRecording call. 
            System.Threading.Thread.Sleep(2500); 
 
            client.Disconnect(); 
 
            Console.ReadLine(); 
        } 
    } 
} 
```

>[!Note]
>This is similar to the existing sample code, but uses the new `ISimulationRestClient` in v3.  This client implements `ISimulationStreamSinkFactory` and so is suitable for getting sinks for methods that require them.

The next example does the same thing as the previous one, but connects to Windows Mixed Reality on the local machine: 

```csharp
using Microsoft.PerceptionSimulation; 
using System; 
 
namespace SimulationManagedTestApp 
{ 
    internal class Program 
    { 
        static void Main(string[] args) 
        { 
            string platformId = "B1DE8CAA-898F-474F-811A-F041FE3FD40D"; 
            string headsetId = PerceptionSimulationManager.InstallSimulatedHeadset(platformId, string.Empty); 
            ISimulationStreamSink sink = PerceptionSimulationManager.CreateControlStreamForDevice(headsetId); 
 
            IPerceptionSimulationManager manager = PerceptionSimulationManager.CreatePerceptionSimulationManager(sink); 
 
            manager.Human.LeftHand.Activated = true; 
            manager.Human.LeftHand.PerformGesture(SimulatedGesture.Home); 
 
            // Instead of just sleeping here, you probably want to register an ISimulationRecordingCallback object to get state changes of the recording, and perhaps a callback to 
            // get validation request callbacks by implementing ISimulationRecordingCallback2 and providing that object to the LoadPerceptionSimulationRecording call. 
            System.Threading.Thread.Sleep(2500); 
 
            client.Disconnect(); 
 
            Console.ReadLine(); 
        } 
    } 
} 
```

Platform IDs are stored in the registry under `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Perception Simulation\Platforms`.  The key names are not used, but the ID value inside is.  For example, the platform ID for Windows Mixed Reality is at `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Perception Simulation\Platforms\WMR  (ID = "B1DE8CAA-898F-474F-811A-F041FE3FD40D")`.  You can enumerate platforms in code by using `PerceptionSimulationManager.GetAvailablePlatforms()` which returns an array of `SimulationPlatform` structs.  Each `SimulationPlatform` provides various details about the platform, including the `PlatformId`.  For native code, `PerceptionSimulationSettings::GetAvailablePlatforms()` can be used.  The native version of the API returns a count and optionally fills in the caller-provided array.  You can call the API once to get the count, then call it again to have your array populated. 

You can browse the `PerceptionSimulationManager.Interop` library to see available classes and methods.  This includes: 

* `IPerceptionSimulationManager2`, which allows you to add additional sinks to receive simulation data, load Scene Understanding data, send audio data, and programmatically inject validation requests.  

    >[!Note]
    >Some features are not currently supported on HoloLens and Windows Mixed Reality. 

* `ISimulatedSixDofController3`, which allows setting the position of analog buttons on motion controllers. 

* `ISimulationAudioVideoClient`, which includes methods for saving textures to disk.  

    >[!Note]
    >For video streaming to work on HoloLens, you must be using a physical device, or you must have hardware graphics acceleration enabled in the HoloLens 2 Emulator.  The emulator tries to enable hardware graphics acceleration by default. 

* `ISimulationRecordingCallback2`, which your test or application can implement to handle validation requests during playback of recordings. 

For native C++ code: 

1. Include the correct headers - `PerceptionSimulationSettings.h` and `PerceptionSimulationManager.h` 

1. Link the appropriate libraries - `PerceptionSimulationSettings.lib` and `PerceptionSimulationManager.lib` at a minimum.  If using the Validators feature, you'll also need PerceptionSimulationValidators.lib.  If using the audio/video features, you'll need PerceptionSimulationOutput.lib 

1. Create a `PerceptionSimulationRestClient` for a HoloLens or remote Windows Mixed Reality PC, or call `InstallSimulatedHeadset` for a local device.  The `InstallSimulatedHeadset` function will return a headset ID that you can use when creating the control stream to talk to the device. 

1. Create a control stream for the device. 

1. Create an instance of **Perception Simulation Manager**. 

Basic example code for initializing simulation: 

```cpp
// Simulation headers 
#include <perceptionsimulation.h> 
#include <perceptionsimulationmanager.h> 
#include <PerceptionSimulationSettings.h> 
 
// These would most likely be placed in a header and exist within a class scope 
winrt::com_ptr<IPerceptionSimulation2> m_spSimulation; 
winrt::com_ptr<IPerceptionSimulationManager> m_spSimulationManager; 
winrt::com_ptr<ISimulationStreamSink> m_spStreamSink; 
// The following are not needed if you intend to play back .xef files 
winrt::com_ptr<ISimulatedHuman> m_spHuman; 
winrt::com_ptr<ISimulatedHead2> m_spHead; 
winrt::com_ptr<ISimulatedHand3> m_spLeftHand; 
winrt::com_ptr<ISimulatedHand3> m_spRightHand; 
winrt::com_ptr<ISimulatedEyes> m_spEyes; 
 
std::string platformId = L"B1DE8CAA-898F-474F-811A-F041FE3FD40D"; // Windows Mixed Reality 
 
// This would most likely be in a setup/initialization function.  This can be done from any thread. 
winrt::com_ptr<IPerceptionSimulation> spSimulation; 
 
WCHAR deviceId[MAX_PATH] = { 0 }; 
winrt::check_hresult(PerceptionSimulationSettings::InstallSimulatedHeadset(platformId, nullptr, MAX_PATH, deviceId, m_spHeadset.put())); 
 
winrt::check_hresult(CoCreateInstance(__uuidof(PerceptionSimulation), nullptr, CLSCTX_LOCAL_SERVER, IID_PPV_ARGS(spSimulation.put()))); 
 
m_spSimulation = spSimulation.as<IPerceptionSimulation2>(); 
 
// Create a control stream for the device 
wil::unique_bstr path(devicePath); 
winrt::check_hresult(m_spSimulation->CreateControlStreamForDevice(deviceId, STREAM_PRIORITY_LOW, m_spStreamSink.put())); 
 
// Create the main Perception Simulation Manager object from which we'll get control of the simulated human and devices like controllers 

winrt::check_hresult(CreatePerceptionSimulationManager(m_spStreamSink.get(), m_spSimulationManager.put())); 
 
// If you intend to play .xef files instead of 'script' a test in code, stop here. 
 
winrt::check_hresult(m_spSimulationManager->get_Human(m_spHuman.put())); 
 
winrt::com_ptr<ISimulatedHead> spHead; 
winrt::check_hresult(m_spHuman->get_Head(spHead.put())); 
spHead.as(m_spHead); 
 
winrt::check_hresult(m_spHead->get_Eyes(m_spEyes.put())); 
 
winrt::com_ptr<ISimulatedHand> spHand; 
winrt::check_hresult(m_spHuman->get_RightHand(spHand.put())); 
spHand.as(m_spRightHand); 
 
// This code would most likely be part of a single test case 
 
// Activate the right hand 
m_spRightHand->put_Activated(TRUE); 
 
// Perform the system gesture. 
spHand->PerformGesture(SIMULATED_GESTURE::SIMULATED_GESTURE_HOME); 
 
// In your cleanup/shutdown path, you should remove the simulated headset (or ideally remove it only if it wasn't already present at the start of the test) 
// so you leave the machine in the same state that you found it. 
PerceptionSimulationSettings::RemoveSimulatedHeadset(deviceId); 
```