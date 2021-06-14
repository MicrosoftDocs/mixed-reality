@echo off
wmic os get osarchitecture | find /i "64-bit" >NUL
if not errorlevel 1 ( 
    set archfolder=win64 
) else ( 
    set archfolder=win32 
)

set wmrdriverpath="%cd%\MixedRealityVRDriver"

if not exist %wmrdriverpath% (
    echo Could not find: %wmrdriverpath%
    echo Please place the Windows Mixed Reality for SteamVR driver files at the above path.
    pause
    exit -1 
)

set vrpathregexe=".\SteamVR\bin\%archfolder%\vrpathreg.exe"

%vrpathregexe% adddriver %wmrdriverpath%

if errorlevel 0 (
    echo Successfully added the Windows Mixed Reality for SteamVR driver to the list of SteamVR runtime search paths.
    %vrpathregexe% show
) else (
    echo Failed to add the Windows Mixed Reality for SteamVR driver to the list of SteamVR runtime search paths.
    echo Attempted to add path: %wmrdriverpath%
    echo See above for errors.
)

pause