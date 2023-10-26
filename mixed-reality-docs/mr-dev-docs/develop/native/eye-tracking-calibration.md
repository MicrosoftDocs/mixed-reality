# Managing Eye Tracking Permissions and Calibration
Eye tracking on HoloLens 2 provides powerful capabilities for supercharging user interactions.  However, there are two user checkpoints that must complete successfully in order for everything to work.  This includes approving eye tracking access for your app, and having completed eye tracking calibration on the device.  The system will automatically prompt the user to complete these as needed, but it is all too easy to accidentally decline and get stuck. This document outlines development best practices for navigating the eye tracking checkpoints, ensuring a smooth and quality experience with your application.

## Permission request
In order to utilize eye tracking, your app must first request access. This is done through a call to [EyesPose::RequestAccessAsync](/uwp/api/windows.perception.people.eyespose.requestaccessasync#Windows_Perception_People_EyesPose_RequestAccessAsync), which is  documented in the [eye gaze development guide](gaze-in-directx.md#requesting-access-to-eye-gaze-input). This function triggers a system check to see whether the user approved your app for eye gaze access. On the first access request after install, the user will be prompted with a dialog to approve. If they press "Yes", the function will return [GazeInputAccessStatus::Allowed](/uwp/api/windows.ui.input.gazeinputaccessstatus), and you can move on with your experience. However, if the user selects "No", the function will return [GazeInputAccessStatus::DeniedByUser](/uwp/api/windows.ui.input.gazeinputaccessstatus).

<center><img src="images/gaze-access-request.jpg" width="50%" /> </center>

The access request dialog appears only once - the first time your app launches on a new device.  If the user declines, they can get stuck in a state where they don't have access to eye tracking in your application.  Once the permissions dialog has been declined, the only way to enable eye tracking for your app is in the settings app. The user must navigate to 'App permissions' section of the  'Privacy' page and manually enable eye tracking for your specific application.

Manually enabling eye tracking for an app can be tricky for a user to do.  Therefore, if eye tracking is an important part of your app experience, and you detect that eye tracking has been denied, you can help the user directly launch the settings app to the correct page.  This is done through a call to [Launcher::LaunchUriAsync](https://learn.microsoft.com/en-us/uwp/api/windows.system.launcher.launchuriasync) with the string "ms-settings:privacy-eyetracker".

```cpp
using namespace winrt::Windows::System::Launcher;
using namespace winrt::Windows::Foundation;

LaunchUriAsync(Uri(L"ms-settings:privacy-eyetracker"));
```

You should never launch the settings app automatically or prompt the user repeatedly. Instead, find a tasteful location in your UI where you can explain the value of eye tracking and provide a button for the user to launch settings themselves.

### Delaying the permission request
Talk about the best practice of not popping the access request dialog when the app first launches.  Especially because, for the first few second of app launch, the user can't actually push the buttons themselves.  Instead, wait until the point in your application where you are first going to use eye tracking.

### Considerations for OpenXR
If you are using OpenXR, the same rules apply, but the meshanism to request permissions is a little different. Instead of 

## User calibration
Once your app has access to eye tracking, the next checkpoint is user calibration. Similar to the permission request, there is a specific API that triggers a UI prompt the first time you call it.  This API is [SpatialPointerPose::Eyes](/uwp/api/windows.ui.input.spatial.spatialpointerpose.eyes).  Note that is the same API used to retrieve eye gaze pose data on each frame, so in effect, accessing the eye tracking data triggers the calibration prompt. Because of this, applications should wait until they actually intend to use the eye tracking pose data before calling this API and triggering the prompt.

<center><img src="images/gaze-calibration-prompt.jpg" width="50%" /> </center>

HoloLens caches and auto-swaps calibration based on the current user in the device. So if a user has previously calibrated their eye gaze, they won't see this prompt.  This makes jumping into a gaze-enabled experience super easy, as most users will only need to calibrate one time per device.  However, if a user presses "Cancel" at the promt and declines eye gaze calibration, their eye gaze will not be available to any applications on the device.  In this case, HoloLens remembers their selection and will not prompt again until the device is removed.  While important for privacy purposes, this can create some confusion for users if they accidentally cancel the prompt are then not able to use eye tracking in your application.

To check whether the current user is calibrated, call [EyesPose::IsCalibrationValid](/uwp/api/windows.perception.people.eyespose.iscalibrationvalid#Windows_Perception_People_EyesPose_IsCalibrationValid).  If the current user is not calibrated, you should seamlessly fall back to interactions that are not dependent on eye gaze.  If eye gaze is critical for your experience and you need to ensure that all of your users are calibrated, you can manually invoke the calibration app using [Launcher::LaunchUriForResultsAsync](https://learn.microsoft.com/en-us/uwp/api/windows.system.launcher.launchuriforresultsasync) with the string "ms-hololenssetup://EyeTracking".

```cpp
using namespace winrt::Windows::System::Launcher;
using namespace winrt::Windows::Foundation;

LaunchUriForResultsAsync(Uri(L"ms-hololenssetup://EyeTracking"));
```

LaunchUriForResultsAsync is a sister API to the more well-known LaunchUriAsync used in the first part of this document. Both methods will launch the calibration app, however the "ForResults" version ensures that focus will be returned to your application after calibration completes.

Apps should not launch calibration automatically and without user interaction. Instead, we recommend a dialog explaining how eye gaze is used by the application and allowing the user calibrate or cancel.

## Considerations for OpenXR
OpenXR applications follow the same pattern in terms of when the user calibration prompt is triggered.  It's just the APIs are a little different.  OpenXR applications can use the same LaunchUriForResultsAsync API to launch the calibration dialog.