---
title: Mixed Reality Spatial Data Packager Documentation
description: The Mixed Reality Spatial Data Packager tool is now deprecated and no longer functions on any platform. The Map Manager tool is recommended instead. 
author: hferrone 
ms.author: v-vtieto
ms.date: 08/03/2020
ms.topic: article
keywords: lbe, MixedRealitySpatialDataPackager.exe, MixedRealitySpatialDataPackager
---
# Mixed Reality Spatial Data Packager Documentation

>[!NOTE]
> DEPRECATED 
> 
> As of 8/1/2020 this tool is now deprecated and no longer functions on any platform. We recommend using the [Map Manager](../develop/advanced-concepts/using-the-windows-device-portal.md#map-manager) tool in the Device Portal instead. 
> 
> This tool and its operation are offered as-is. It is subject to change without any notice and may not be compatible with future Windows or Windows Mixed Reality HMD releases. 


## Download
 Download [MixedRealitySpatialDataPackager here](https://download.microsoft.com/download/A/1/2/A12B8A90-B3F7-4ED9-A4BB-D59DDCDAA125/MixedRealitySpatialDataPackager.zip)

## Device support

<table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tr>
        <td><strong>Feature</strong></td>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens (1st gen)</strong></a></td>
        <td><a href="/hololens/hololens2-hardware"><strong>HoloLens 2</strong></td>
        <td><a href="../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Mixed Reality Spatial Data Packager</td>
        <td>❌</td>
        <td>❌</td>
        <td>✔️</td>
    </tr>
</table>

## Quickstart

The Mixed Reality Spatial Data Packager tool copies the spatial data of a target app from one PC to another through a two step export and import process. The tool must be run with administrator privileges and deletes the existing spatial data on import. Export leaves the existing spatial data intact.

Key requirements and limitations:

1. Tool must be run with administrator privileges 
2. You may have to restart PC if Mixed Reality Portal is unstable after running the tool
3. Tool will not run when encountering spatial data version mismatches or incompatibilities
4. Tool will erase existing spatial data on import
5. If import process fails previous data cannot be restored unless it has been backed up by exporting previously
6. Quality of import functionality contingent on “Read-Only” mode for spatial map data
***

## Mapping Best Practices

1. Clear existing maps from the Control Panel (Settings -> Mixed Reality -> Environment -> Clear environment data)
2. Ensure sufficient lighting for good tracking and if running locked map mode try to maintain the same lighting
3. When possible keep the lighting dynamic range low by avoiding areas of high illumination next to dark, shadowed areas
4. Minimize blank, textureless surfaces e.g. place a range of different posters on white walls
5. Map the space without dynamic objects in the scene such as moving people
6. Lock the map on import (available via Insider Preview)
7. Unlock the map and rescan the environment when tracking quality degrades and/or there are changes in the environment (lighting or changes in object layout)
***

## Running Mixed Reality Spatial Data Packager with Companion Script

We have provided MRSpatialPackagerHelperScript.ps1 that runs the map packager the tools. 


The script parameters are defined below:

```
-AppName <String>
    On export: The spatial anchors from the app of interest
    On import: The target app that spatial anchors should be imported for
    Returns a list of apps containing the input string if a unique app is not found

-UserName <String>
    Target username, will return a list of users if a unique match is not found

-Mode <String>
    import or export

-MapxPath <String>
    On export: Directory to export your mapx files
    On import: Directory where import mapx are stored

-LockMap <Int32>
    0 to unlock map
    1 to lock map

-BinPath <String>
    Path to MixedRealitySpatialDataPackager.exe, default value is current directory
```

### Powershell Script Example Usage and Output

.\MRSpatialPackagerHelperScript.ps1 -AppName holoshell -UserName Administrator -Mode export -MapxPath D:\temp\ -LockMap 0
```
Package Family Name for holoshell: HoloShell_cw5n1h2txyewy
User SID for Administrator: S-1-5-21-1279937937-3984375698-1043392598-499
Lock map value successfully set to 0

Running: C:\bin\MixedRealitySpatialDataPackager.exe export D:\temp\ HoloShell_cw5n1h2txyewy S-1-5-21-1279937937-3984375698-1043392598-499

Attempting to disable Windows MR driver
Driver disabled
Validating spatial data version information...
Device spatial data version OK
External spatial data version OK
Importing spatial anchors for user account phguan
Stopping SPECTRUM
Stopped SPECTRUM
Stopping SHAREDREALITYSVC
Stopped SHAREDREALITYSVC
Space ID is {00000000-4321-0000-0000-000000000000}
SUCCESS: Unpacked Space from D:\temp\map\het.mapx to
C:\ProgramData\WindowsHolographicDevices\SpatialStore\HoloLensSensors\{00000000-4321-0000-0000-000000000000}\
Space ID is {78FA06B5-4416-4815-BB00-B3CB5C983B7D}
SUCCESS: Unpacked Space from D:\temp\map\sa.mapx to
C:\ProgramData\Microsoft\Spectrum\PersistedSpatialAnchors\
Attempting to enable Windows MR driver
Driver enabled
Starting SHAREDREALITYSVC
Started SHAREDREALITYSVC
Starting SPECTRUM
Started SPECTRUM
IMPORT SUCCESS
```

### How to Export using MixedRealitySpatialDataPackager.exe
```
MixedRealitySpatialDataPackager.exe export <folderpath to mapx files> <source package family name>    
```

Exporting maps off device generates two mapx files, het.mapx and sa.mapx. During the export process all spatial anchors are removed except for the specified app and the user-created boundary (if it exists). The source package family name must match an existing installed app or the exe will fail.

### How to Import using MixedRealitySpatialDataPackager.exe
```
MixedRealitySpatialDataPackager.exe import <folderpath to mapx files> <target package family name> <user SID>
```
Import deletes the existing spatial data and replaces it with the data from the specified directory. The app name input specifies the package name of the target app that like the spatial anchors should be imported for and the target user SID specifies the user that should have access to the imported spatial anchors. The target package family name and user SIDs must match existing values on the PC or the exe will fail.


***
## Error Messages
In addition the error messages below failures will also be accompanied with an HRESULT

### If there was an error invalid arguments
```
Invalid command line parameters
```

### If the executable was not run in administrator mode
```
1. Unable to determine elevation privileges 
2. Please run with administrator privileges 
```

### If there was an error enabling or disabling the driver
```
1. Could not find the specified driver with class GUID {d612553d-06b1-49ca-8938-e39ef80eb16f}
2. Could not find the device instance ID for specified driver with class GUID {d612553d-06b1-49ca-8938-e39ef80eb16f}
3. Could not find the specified driver with device instance ID <INSTANCE ID>
4. Failed to enable/disable driver
```

### If there was an error validating the spatial database version
```
1. Could not read database version
2. This tool is not compatible with the current driver version of Windows Mixed Reality and/or the spatial data provided to replace the existing spatial data is an invalid version.
3. No spatial data is present on the current device please connect your Mixed Reality device to initialize spatial data. If the problem persists please restart your PC.
```

### If there was an error validating the package family name provided for target import/export app
```
The package family name does not correspond to an installed app
```

### If there was an error validating the user SID
```
Failed to find local user for passed in user SID
```

### If there was an error related to the destination or source spatial data files
```
1. Folder path to space store files doesn't exist 
2. het.mapx or sa.mapx file doesn't exist in <PATH> for import
3. Unable to create directory at <PATH> for export
```

### If there was an error related to starting and stopping Spectrum/SharedRealitySvc
```
1. Unable to open service manager <SERVICE>
2. Timed out trying to start/stop <SERVICE>
```