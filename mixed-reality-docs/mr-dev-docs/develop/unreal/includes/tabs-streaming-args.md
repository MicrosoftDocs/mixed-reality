# [Windows Mixed Reality](#tab/wmr)

| Option | Description |
| ------ | ----------- |
| `-HoloLensRemoting=<IP address:port>` | Takes the IP address (and optional port) of the HoloLens 2 device to connect to. If no port is provided, default to 8265. |
| `-RemotingBitrate=<bitrate>` | (optional) Default 8000. Max network transfer rate (kb/s). |
| `-HoloLensRemotingListen` | (optional) Start a listen server |
| `-HoloLensRemotingListenPort=<port>` | (optional) Takes the port to listen on. Used for connecting to a PC or VM from a HoloLens device. |
| `-HoloLens1Remoting=<IP address>` | (deprecated in 4.26) Takes the IP address of the HoloLens 1 device to connect to |
| `-eyetracking=WindowsMixedRealityEyeTracker` | (optional) Use the Windows Mixed Reality eye tracker |

# [OpenXR](#tab/openxr)

| Option | Description |
| ------ | ----------- |
| `-HoloLensRemoting=<IP address:port or port>` | Takes the IP address (and optional port, default 8265) of the HoloLens 2 device to connect to, or the port on which the app should listen on for connections. |
| `-EnableAudio` | (optional) Use audio from PC when remoting  |
| `-Listen` | (optional) Start a listen server |
| `-RemotingBitrate=<bitrate>` | (optional) Default 8000. Max network transfer rate (kb/s). |
| `-RemotingCodec=<codec>` | (optional) Connection codec  |
| `-eyetracking=OpenXREyeTracker` | (optional) Use the OpenXR eye tracker |