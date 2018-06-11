---
title: Device portal API reference
description: API reference for the Windows Device Portal on HoloLens
author: JonMLyons
ms.author: JLyons
ms.date: 03/21/2018
ms.topic: article
keywords: HoloLens, Windows Device Portal, API
---



# Device portal API reference

Everything in the [Windows Device Portal](using-the-windows-device-portal.md) is built on top of REST API's that you can use to access the data and control your device programmatically.

## App deloyment

**/api/app/packagemanager/package (DELETE)**

Uninstalls an app

Parameters
* package : File name of the package to be uninstalled.

**/api/app/packagemanager/package (POST)**

Installs an App

Parameters
* package : File name of the package to be installed.

Payload
* multi-part conforming http body

**/api/app/packagemanager/packages (GET)**

Retrieves the list of installed apps on the system, with details

Return data
* List of installed packages with details

**/api/app/packagemanager/state (GET)**

Gets the status of in progress app installation

## Dump collection

**/api/debug/dump/usermode/crashcontrol (DELETE)**

Disables crash dump collection for a sideloaded app

Parameters
* packageFullname : package name

**/api/debug/dump/usermode/crashcontrol (GET)**

Gets settings for sideloaded apps crash dump collection

Parameters
* packageFullname : package name

**/api/debug/dump/usermode/crashcontrol (POST)**

Enables and sets dump control settings for a sideloaded app

Parameters
* packageFullname : package name

**/api/debug/dump/usermode/crashdump (DELETE)**

Deletes a crash dump for a sideloaded app

Parameters
* packageFullname : package name
* fileName : dump file name

**/api/debug/dump/usermode/crashdump (GET)**

Retrieves a crash dump for a sideloaded app

Parameters
* packageFullname : package name
* fileName : dump file name

Return data
* Dump file. Inspect with WinDbg or Visual Studio

**/api/debug/dump/usermode/dumps (GET)**

Returns list of all crash dumps for sideloaded apps

Return data
* List of crash dumps per side loaded app

## ETW

**/api/etw/providers (GET)**

Enumerates registered providers

Return data
* List of providers, friendly name and GUID

**/api/etw/session/realtime (GET/WebSocket)**

Creates a realtime ETW session; managed over a websocket.

Return data
* ETW events from the enabled providers

## Holographic OS

**/api/holographic/os/etw/customproviders (GET)**

Returns a list of HoloLens specific ETW providers that are not registered with the system

**/api/holographic/os/services (GET)**

Returns the states of all services running.

**/api/holographic/os/settings/ipd (GET)**

Gets the stored IPD (Interpupillary distance) in millimeters

**/api/holographic/os/settings/ipd (POST)**

Sets the IPD

Parameters
* ipd : New IPD value to be set in millimeters

**/api/holographic/os/webmanagement/settings/https (GET)**

Get HTTPS requirements for the Device Portal

**/api/holographic/os/webmanagement/settings/https (POST)**

Sets HTTPS requirements for the Device Portal

Parameters
* required : yes, no or default

## Holographic Perception

**/api/holographic/perception/client (GET/WebSocket)**

Accepts websocket upgrades and runs a perception client that sends updates at 30 fps.

Parameters
* clientmode: "active" forces visual tracking mode when it can't be established passively

## Holographic Thermal

**/api/holographic/thermal/stage (GET)**

Get the thermal stage of the device (0 normal, 1 warm, 2 critical)

## Perception Simulation Control

**/api/holographic/simulation/control/mode (GET)**

Get the simulation mode

**/api/holographic/simulation/control/mode (POST)**

Set the simulation mode

Parameters
* mode : simulation mode: default, simulation, remote, legacy

**/api/holographic/simulation/control/stream (DELETE)**

Delete a control stream.

**/api/holographic/simulation/control/stream (GET/WebSocket)**

Open a web socket connection for a control stream.

**/api/holographic/simulation/control/stream (POST)**

Create a control stream (priority is required) or post data to a created stream (streamId required). Posted data is expected to be of type 'application/octet-stream'.

## Perception Simulation Playback

**/api/holographic/simulation/playback/file (DELETE)**

Delete a recording.

Parameters
* recording : Name of recording to delete.

**/api/holographic/simulation/playback/file (POST)**

Upload a recording.

**/api/holographic/simulation/playback/files (GET)**

Get all recordings.

**/api/holographic/simulation/playback/session (GET)**

Get the current playback state of a recording.

Parameters
* recording : Name of recording.

**/api/holographic/simulation/playback/session/file (DELETE)**

Unload a recording.

Parameters
* recording : Name of recording to unload.

**/api/holographic/simulation/playback/session/file (POST)**

Load a recording.

Parameters
* recording : Name of recording to load.

**/api/holographic/simulation/playback/session/files (GET)**

Get all loaded recordings.

**/api/holographic/simulation/playback/session/pause (POST)**

Pause a recording.

Parameters
* recording : Name of recording.

**/api/holographic/simulation/playback/session/play (POST)**

Play a recording.

Parameters
* recording : Name of recording.

**/api/holographic/simulation/playback/session/stop (POST)**

Stop a recording.

Parameters
* recording : Name of recording.

**/api/holographic/simulation/playback/session/types (GET)**

Get the types of data in a loaded recording.

Parameters
* recording : Name of recording.

## Perception Simulation Recording

**/api/holographic/simulation/recording/start (POST)**

Start a recording. Only a single recording can be active at once. One of head, hands, spatialMapping or environment must be set.

Parameters
* head : Set to 1 to record head data.
* hands : Set to 1 to record hand data.
* spatialMapping : Set to 1 to record spatial mapping.
* environment : Set to 1 to record environment data.
* name : Name of the recording.
* singleSpatialMappingFrame : Set to 1 to record only a single spatial mapping frame.

**/api/holographic/simulation/recording/status (GET)**

Get recording state.

**/api/holographic/simulation/recording/stop (GET)**

Stop the current recording. Recording will be returned as a file.

## Mixed Reality Capture

**/api/holographic/mrc/file (DELETE)**

Deletes a mixed reality recording from the device.

Parameters
* filename : Name, hex64 encoded, of the file to delete

**/api/holographic/mrc/settings (GET)**

Gets the default mixed reality capture settings

**/api/holographic/mrc/file (GET)**

Downloads a mixed reality file from the device. Use op=stream query parameter for streaming.

Parameters
* filename : Name, hex64 encoded, of the video file to get
* op : stream

**/api/holographic/mrc/thumbnail (GET)**

Gets the thumbnail image for the specified file.

Parameters
* filename: Name, hex64 encoded, of the file for which the thumbnail is being requested

**/api/holographic/mrc/status (GET)**

Gets the status of the mixed reality recorded (running, stopped)

**/api/holographic/mrc/files (GET)**

Returns the list of mixed reality files stored on the device

**/api/holographic/mrc/settings (POST)**

Sets the default mixed reality capture settings

**/api/holographic/mrc/video/control/start (POST)**

Starts a mixed reality recording

Parameters
* holo : capture holograms: true or false
* pv : capture PV camera: true or false
* mic : capture microphone: true or false
* loopback : capture app audio: true or false

**/api/holographic/mrc/video/control/stop (POST)**

Stops the current mixed reality recording

**/api/holographic/mrc/photo (POST)**

Takes a mixed reality photo and creates a file on the device

Parameters
* holo : capture holograms: true or false
* pv : capture PV camera: true or false

Mixed Reality Streaming

**/api/holographic/stream/live.mp4 (GET)**

Initiates a chunked download of a fragmented mp4

Parameters
* holo : capture holograms: true or false
* pv : capture PV camera: true or false
* mic : capture microphone: true or false
* loopback : capture app audio: true or false

**/api/holographic/stream/live_high.mp4 (GET)**

Initiates a chunked download of a fragmented mp4

Parameters
* holo : capture holograms: true or false
* pv : capture PV camera: true or false
* mic : capture microphone: true or false
* loopback : capture app audio: true or false

**/api/holographic/stream/live_low.mp4 (GET)**

Initiates a chunked download of a fragmented mp4

Parameters
* holo : capture holograms: true or false
* pv : capture PV camera: true or false
* mic : capture microphone: true or false
* loopback : capture app audio: true or false

**/api/holographic/stream/live_med.mp4 (GET)**

Initiates a chunked download of a fragmented mp4

Parameters
* holo : capture holograms: true or false
* pv : capture PV camera: true or false
* mic : capture microphone: true or false
* loopback : capture app audio: true or false

## Networking

**/api/networking/ipconfig (GET)**

Gets the current ip configuration

## OS Information

**/api/os/info (GET)**

Gets operating system information

**/api/os/machinename (GET)**

Gets the machine name

**/api/os/machinename (POST)**

Sets the machine name

Parameters
* name : New machine name, hex64 encoded, to set to

## Performance data

**/api/resourcemanager/processes (GET)**

Returns the list of running processes with details

Return data
* JSON with list of processes and details for each process

**/api/resourcemanager/systemperf (GET)**

Returns system perf statistics (I/O read/write, memory stats etc.

Return data
* JSON with system information: CPU, GPU, Memory, Network, IO

## Power

**/api/power/battery (GET)**

Gets the current battery state

**/api/power/state (GET)**

Checks if the system is in a low power state

## Remote Control

**/api/control/restart (POST)**

Restarts the target device

**/api/control/shutdown (POST)**

Shuts down the target device

## Task Manager

**/api/taskmanager/app (DELETE)**

Stops a modern app

Parameters
* package : Full name of the app package, hex64 encoded
* forcestop : Force all processes to stop (=yes)

**/api/taskmanager/app (POST)**

Starts a modern app

Parameters
* appid : PRAID of app to start, hex64 encoded
* package : Full name of the app package, hex64 encoded

## WiFi Management

**/api/wifi/interfaces (GET)**

Enumerates wireless network interfaces

Return data
* List of wireless interfaces with details (GUID, description etc.)

**/api/wifi/network (DELETE)**

Deletes a profile associated with a network on a specified interface

Parameters
* interface : network interface guid
* profile : profile name

**/api/wifi/networks (GET)**

Enumerates wireless networks on the specified network interface

Parameters
* interface : network interface guid

Return data
* List of wireless networks found on the network interface with details

**/api/wifi/network (POST)**

Connects or disconnects to a network on the specified interface

Parameters
* interface : network interface guid
* ssid : ssid, hex64 encoded, to connect to
* op : connect or disconnect
* createprofile : yes or no
* key : shared key, hex64 encoded

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

Stops a WPR (performance) tracing session

Return data
* Returns the trace ETL file

**/api/wpr/trace (POST)**

Starts a WPR (performance) tracing sessions

Parameters
* profile : Profile name. Available profiles are stored in perfprofiles/profiles.json

Return data
* On start, returns the WPR session status.

## See also
* [Using the Windows Device Portal](using-the-windows-device-portal.md)
* [Device Portal core API reference (UWP)](https://docs.microsoft.com/windows/uwp/debug-test-perf/device-portal-api-core)
