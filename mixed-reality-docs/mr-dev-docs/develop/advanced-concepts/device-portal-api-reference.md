---
title: Device portal API reference
description: Stay up to date on the Windows Device Portal API for HoloLens development.
author: hamalawi
ms.author: moelhama
ms.date: 08/03/2020
ms.topic: article
keywords: HoloLens, Windows Device Portal, API, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Device portal API reference

Everything in the [Windows Device Portal](using-the-windows-device-portal.md) is built on top of REST API's that you can use to access the data and control your device programmatically.

## App deployment

**/api/app/packagemanager/package (DELETE)**

Uninstalls an app.

Parameters
* package: File name of the package to be uninstalled.

**/api/app/packagemanager/package (POST)**

Installs an App.

Parameters
* package: File name of the package to be installed.

Payload
* multi-part conforming http body

**/api/app/packagemanager/packages (GET)**

Retrieves the list of installed apps on the system. Includes details.

Return data
* List of installed packages with details

**/api/app/packagemanager/state (GET)**

Gets the status of in-progress app installation.

## Dump collection

**/api/debug/dump/usermode/crashcontrol (DELETE)**

Disables crash dump collection for a sideloaded app.

Parameters
* packageFullname: package name

**/api/debug/dump/usermode/crashcontrol (GET)**

Gets settings for sideloaded apps crash dump collection.

Parameters
* packageFullname: package name

**/api/debug/dump/usermode/crashcontrol (POST)**

Enables and sets dump control settings for a sideloaded app.

Parameters
* packageFullname: package name

**/api/debug/dump/usermode/crashdump (DELETE)**

Deletes a crash dump for a sideloaded app.

Parameters
* packageFullname: package name
* fileName: dump file name

**/api/debug/dump/usermode/crashdump (GET)**

Retrieves a crash dump for a sideloaded app.

Parameters
* packageFullname: package name
* fileName: dump file name

Return data
* Dump file. Inspect with WinDbg or Visual Studio.

**/api/debug/dump/usermode/dumps (GET)**

Returns list of all crash dumps for sideloaded apps.

Return data
* List of crash dumps per side loaded app

## ETW

**/api/etw/providers (GET)**

Enumerates registered providers.

Return data
* List of providers, friendly name and GUID

**/api/etw/session/realtime (GET/WebSocket)**

Creates a real-time ETW session; managed over a websocket.

Return data
* ETW events from the enabled providers

## Holographic OS

**/api/holographic/os/etw/customproviders (GET)**

Returns a list of HoloLens-specific ETW providers that aren't registered with the system.

**/api/holographic/os/services (GET)**

Returns the states of all services running.

**/api/holographic/os/settings/ipd (GET)**

Gets the stored IPD (Interpupillary distance) in millimeters.

**/api/holographic/os/settings/ipd (POST)**

Sets the IPD.

Parameters
* ipd: New IPD value to be set in millimeters

**/api/holographic/os/webmanagement/settings/https (GET)**

Gets HTTPS requirements for the Device Portal.

**/api/holographic/os/webmanagement/settings/https (POST)**

Sets HTTPS requirements for the Device Portal.

Parameters
* required: yes, no or default

## Holographic Perception

**/api/holographic/perception/client (GET/WebSocket)**

Accepts WebSocket upgrades and runs a perception client that sends updates at 30 fps.

Parameters
* clientmode: "active" forces visual tracking mode when it can't be established passively

## Holographic Thermal

When using these thermal APIs reference [managing power and thermals](..\unity\managing-power-and-thermals)

**/api/holographic/thermal/stage (GET)**

Get the thermal stage of the device (0 normal, 1 warm, 2 critical).

**/api/holographic/thermal/getMitigationLevels (GET/websocket)**

Open a websocket (or do a single query) providing a list of objects containing

* IsSuppressed - Identifying if a given peripheral has mitigations suppressed
* Level - Latest thermal mitigation level for this peripheral
* Mask - Mask of this peripheral
* ThermalScore - Latest thermal score for this peripheral

Objects are named by peripheral name (Example: Battery)

**/api/holographic/thermal/setMitigationLevel (POST)**

Change the mitigation level being reported for a given peripheral

Parameters

* mask: bitmask with single bit set for the peripheral of interest
* level: new level to use (0-3)

**/api/holographic/thermal/setThermalScore (POST)**

Change the thermal score being reported for a given peripheral

Parameters

* mask: bitmask with single bit set for the peripheral of interest
* thermalScore: new thermal score to use (100-0)

## Map Manager

**/api/holographic/mapmanager/mapFiles (GET)**

Gets the list of the available map files (.mapx).

**/api/holographic/mapmanager/anchorFiles (GET)**

Gets the list of available anchor files (.ancx).

**/api/holographic/mapmanager/srdbFiles (GET)**

Gets the list of available spatial reconstruction database files (.srdb).

**/api/holographic/mapmanager/getanchors (GET)**

Gets the list of persisted anchors for the current user.

### Download/Upload/Delete Files
**/api/holographic/mapmanager/download (GET)**

Downloads a map, anchor, or spatial reconstruction database file. The file must've been previously uploaded or exported.

Parameters
* FileName: Name of file to download.

Example: 
```
$.post("/api/holographic/mapmanager/download?FileName=" + spaceID)
```

**/api/holographic/mapmanager/upload (POST)**

Uploads a map, anchor, or spatial reconstruction database file. Once a file is uploaded, it can later be imported and used by the system.

Parameters
* file: Name of the file to upload.

Example:
```
var form_data = new FormData();
form_data.append("file", file_data);

$.ajax({
    url: "/api/holographic/mapmanager/upload",
    dataType: 'json',
    cache: false,
    contentType: false,
    processData: false,
    data: form_data,
    type: 'post'
})
```

**/api/holographic/mapmanager/delete (POST)**

Deletes a map, anchor, or spatial reconstruction database file. The file must've been previously uploaded or exported.

Parameters
* FileName: Name of file to delete.

Example: 
```
$.post("/api/holographic/mapmanager/delete?FileName=" + spaceID)
```

### Export

**/api/holographic/mapmanager/export (POST)**

Exports the map currently in use by the system. Once exported, it can be downloaded.

Example: 
```
$.post("/api/holographic/mapmanager/export")
```

**/api/holographic/mapmanager/exportanchors (POST)**

Exports the map currently in use by the system. Once exported, it can be downloaded. 
Example: 
```
$.post("/api/holographic/mapmanager/exportanchors")
```

**/api/holographic/mapmanager/exportmapandanchors (POST)**

Exports the map and anchors currently in use by the system. Once exported, they can be downloaded. 
Example: 
```
$.post("/api/holographic/mapmanager/exportmapandanchors")
```

**/api/holographic/mapmanager/exportmapandspatialmappingdb (POST)**

Exports the map and spatial reconstruction database currently in use by the system. Once exported, they can be downloaded. 

Example: 
```
$.post("/api/holographic/mapmanager/exportmapandspatialmappingdb")
```

### Import

**/api/holographic/mapmanager/import (POST)**

Indicates to the system which map should be used. Can be called on files that have been exported or uploaded.

Parameters
* FileName: Name of the map to be used. 

Example: 
```
$.post("/api/holographic/mapmanager/import?FileName=" + spaceID, function() { alert("Import was successful!"); })
```

**/api/holographic/mapmanager/importanchors (POST)**

Indicates to the system which anchors should be used. Can be called on files that have been exported or uploaded.

Parameters
* FileName: Name of the anchors to be used. 

Example: 
```
$.post("/api/holographic/mapmanager/import?FileName=" + spaceID, function() { alert("Import was successful!"); })
```

**/api/holographic/mapmanager/importspatialmappingdb (POST)**

Indicates to the system which spatial reconstruction database should be used. Can be called on files that have been exported or uploaded.

Parameters
* FileName: Name of the spatial mapping db to be used. 

Example: 
```
$.post("/api/holographic/mapmanager/import?FileName=" + spaceID, function() { alert("Import was successful!"); })
```

### Other

**/api/holographic/mapmanager/resetmapandanchorsandsrdb (POST)**

Reset the system the map, anchors and spatial reconstruction database.

Example: 
```
$.post("/api/holographic/mapmanager/resetmapandanchorsandsrdb")
```

**/api/holographic/mapmanager/status (GET)**

Gets the status of the system, including which map, anchors, and spatial reconstruction database files were last imported. 


## Mixed Reality Capture

**/api/holographic/mrc/file (GET)**

Downloads a mixed reality file from the device. Use the op=stream query parameter for streaming.

Parameters
* filename: Name, hex64 encoded, of the video file to get
* op: stream

**/api/holographic/mrc/file (DELETE)**

Deletes a mixed reality recording from the device.

Parameters
* filename: Name, hex64 encoded, of the file to delete

**/api/holographic/mrc/files (GET)**

Returns the list of mixed reality files stored on the device.

**/api/holographic/mrc/photo (POST)**

Takes a mixed reality photo and creates a file on the device.

Parameters
* holo: capture holograms: true or false (defaults to false)
* pv: capture PV camera: true or false (defaults to false)
* RenderFromCamera: (HoloLens 2 only) render from perspective of photo/video camera: true or false (defaults to true)

**/api/holographic/mrc/settings (GET)**

Gets the default mixed reality capture settings.

**/api/holographic/mrc/settings (POST)**

Sets the default mixed reality capture settings.  Some of these settings are applied to the system's MRC photo and video capture.

**/api/holographic/mrc/status (GET)**

Gets the state of mixed reality capture within the Windows Device Portal.

***Response***

The response contains a JSON property that indicates if Windows Device Portal is recording video or not.

``` javascript
{"IsRecording": boolean}
```

**/api/holographic/mrc/thumbnail (GET)**

Gets the thumbnail image for the specified file.

Parameters
* filename: Name, hex64 encoded, of the file for which the thumbnail is being requested

**/api/holographic/mrc/video/control/start (POST)**

Starts a mixed reality recording.

Parameters
* holo: capture holograms: true or false (defaults to false)
* pv: capture PV camera: true or false (defaults to false)
* mic: capture microphone: true or false (defaults to false)
* loopback: capture app audio: true or false (defaults to false)
* RenderFromCamera: (HoloLens 2 only) render from perspective of photo/video camera: true or false (defaults to true)
* vstab: (HoloLens 2 only) enable video stabilization: true or false (defaults to true)
* vstabbuffer: (HoloLens 2 only) video stabilization buffer latency: 0 to 30 frames (defaults to 15 frames)

**/api/holographic/mrc/video/control/stop (POST)**

Stops the current mixed reality recording.

## Mixed Reality Streaming

> [!CAUTION]
> Because of loopback isolation, you can't connect to mixed reality streaming from inside an app on a device.

HoloLens supports live preview of mixed reality via chunked download of a fragmented mp4.

Mixed reality streams share the same set of parameters to control what's captured:
* holo: capture holograms: true or false
* pv: capture PV camera: true or false
* mic: capture microphone: true or false
* loopback: capture app audio: true or false

If none of these are specified, then holograms, photo/video camera, and app audio will be captured.

If any are specified, the unspecified parameters will default to false

Optional parameters (HoloLens 2 only)
* RenderFromCamera: render from perspective of photo/video camera: true or false (defaults to true)
* vstab: enable video stabilization: true or false (defaults to false)
* vstabbuffer: video stabilization buffer latency: 0 to 30 frames (defaults to 15 frames)

**/api/holographic/stream/live.mp4 (GET)**

A 1280x720p 30fps 5Mbit stream.

**/api/holographic/stream/live_high.mp4 (GET)**

A 1280x720p 30fps 5Mbit stream.

**/api/holographic/stream/live_med.mp4 (GET)**

A 854x480p 30fps 2.5Mbit stream.

**/api/holographic/stream/live_low.mp4 (GET)**

A 428x240p 15fps 0.6Mbit stream.

## Networking

**/api/networking/ipconfig (GET)**

Gets the current IP configuration.

## OS Information

**/api/os/info (GET)**

Gets operating system information.

**/api/os/machinename (GET)**

Gets the machine name.

**/api/os/machinename (POST)**

Sets the machine name.

Parameters
* name: New machine name, hex64 encoded, to set to

## Perception Simulation Control

**/api/holographic/simulation/control/mode (GET)**

Gets the simulation mode.

**/api/holographic/simulation/control/mode (POST)**

Sets the simulation mode.

Parameters
* mode: simulation mode: default, simulation, remote, legacy

**/api/holographic/simulation/control/stream (DELETE)**

Delete a control stream.

**/api/holographic/simulation/control/stream (GET/WebSocket)**

Open a WebSocket connection for a control stream.

**/api/holographic/simulation/control/stream (POST)**

Create a control stream (priority is required) or post data to a created stream (streamId required). Posted data is expected to be of type 'application/octet-stream'.

**/api/holographic/simulation/display/stream (GET/WebSocket)**

Request a simulation video stream containing the content rendered to the system display when in 'Simulation' mode.  A simple format descriptor header will be sent initially, followed by H.264-encoded textures, with each preceded by a header indicating the eye index and texture size.

## Perception Simulation Playback

**/api/holographic/simulation/playback/file (DELETE)**

Delete a recording.

Parameters
* recording: Name of recording to delete.

**/api/holographic/simulation/playback/file (POST)**

Upload a recording.

**/api/holographic/simulation/playback/files (GET)**

Get all recordings.

**/api/holographic/simulation/playback/session (GET)**

Get the current playback state of a recording.

Parameters
* recording: Name of recording.

**/api/holographic/simulation/playback/session/file (DELETE)**

Unload a recording.

Parameters
* recording: Name of recording to unload.

**/api/holographic/simulation/playback/session/file (POST)**

Load a recording.

Parameters
* recording: Name of recording to load.

**/api/holographic/simulation/playback/session/files (GET)**

Get all loaded recordings.

**/api/holographic/simulation/playback/session/pause (POST)**

Pause a recording.

Parameters
* recording: Name of recording.

**/api/holographic/simulation/playback/session/play (POST)**

Play a recording.

Parameters
* recording: Name of recording.

**/api/holographic/simulation/playback/session/stop (POST)**

Stop a recording.

Parameters
* recording: Name of recording.

**/api/holographic/simulation/playback/session/types (GET)**

Get the types of data in a loaded recording.

Parameters
* recording: Name of recording.

## Perception Simulation Recording

**/api/holographic/simulation/recording/start (POST)**

Start a recording. Only a single recording can be active at once. One of these must be set: head, hands, spatialMapping or environment.

Parameters
* head: Set to 1 to record head data.
* hands: Set to 1 to record hand data.
* spatialMapping: Set to 1 to record spatial mapping.
* environment: Set to 1 to record environment data.
* name: Name of the recording.
* singleSpatialMappingFrame: Set to 1 to record only a single spatial mapping frame.

**/api/holographic/simulation/recording/status (GET)**

Get recording state.

**/api/holographic/simulation/recording/stop (GET)**

Stop the current recording. Recording will be returned as a file.

## Performance data

**/api/resourcemanager/processes (GET)**

Returns the list of running processes with details.

Return data
* JSON with list of processes and details for each process

**/api/resourcemanager/systemperf (GET)**

Returns system perf statistics (I/O read/write, memory stats, etc.

Return data
* JSON with system information: CPU, GPU, Memory, Network, IO

## Power

**/api/power/battery (GET)**

Gets the current battery state.

**/api/power/state (GET)**

Checks if the system is in a low power state.

## Remote Control

**/api/control/restart (POST)**

Restarts the target device.

**/api/control/shutdown (POST)**

Shuts down the target device.

## Task Manager

**/api/taskmanager/app (DELETE)**

Stops a modern app.

Parameters
* package: Full name of the app package, hex64 encoded
* forcestop: Force all processes to stop (=yes)

**/api/taskmanager/app (POST)**

Starts a modern app

Parameters
* appid: PRAID of app to start, hex64 encoded
* package: Full name of the app package, hex64 encoded

## WiFi Management

**/api/wifi/interfaces (GET)**

Enumerates wireless network interfaces.

Return data
* List of wireless interfaces with details (GUID, description etc.)

**/api/wifi/network (DELETE)**

Deletes a profile associated with a network on a specified interface.

Parameters
* interface: network interface guid
* profile: profile name

**/api/wifi/networks (GET)**

Enumerates wireless networks on the specified network interface.

Parameters
* interface: network interface guid

Return data
* List of wireless networks found on the network interface with details

**/api/wifi/network (POST)**

Connects or disconnects to a network on the specified interface.

Parameters
* interface: network interface guid
* ssid: ssid, hex64 encoded, to connect to
* op: connect or disconnect
* createprofile: yes or no
* key: shared key, hex64 encoded

## Windows Performance Recorder

**/api/wpr/customtrace (POST)**

Uploads a WPR profile and starts tracing using the uploaded profile.

Payload
* multi-part conforming http body

Return data
* Returns the WPR session status.

**/api/wpr/status (GET)**

Retrieves the status of the WPR session

Return data
* WPR session status.

**/api/wpr/trace (GET)**

Stops a WPR (performance) tracing session.

Return data
* Returns the trace ETL file

**/api/wpr/trace (POST)**

Starts a WPR (performance) tracing session.

Parameters
* profile: Profile name. Available profiles are stored in perfprofiles/profiles.json

Return data
* On start, returns the WPR session status.

## See also
* [Using the Windows Device Portal](using-the-windows-device-portal.md)
* [Device Portal core API reference (UWP)](/windows/uwp/debug-test-perf/device-portal-api-core)