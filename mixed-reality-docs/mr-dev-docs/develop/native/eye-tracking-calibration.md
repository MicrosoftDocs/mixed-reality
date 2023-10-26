# Managing Eye Tracking Permissions and Calibration
Eye tracking on HoloLens 2 provides powerful capabilities for supercharging user interactions.  However, there are two user checkpoints that must complete successfully in order for everything to work.  This includes approving eye tracking access for your app, and having completed eye tracking calibration on the device.  The system will automatically prompt the user to complete these as needed, but it is all too easy to accidentally decline and get stuck. This document outlines development best practices for navigating the eye tracking checkpoints, ensuring a smooth and quality experience with your application.

## Eye Tracking App Access
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

### Considerations for OpenXR
If you are using OpenXR

## Eye Tracking User Calibration

### How to control eye tracking automatic calibration prompt
What APIs trigger the automatic calibration prompt. Talk about how app can wait to call this API and invoke the default to invoke the prompt by waiting to 

### How to detect if current user is calibrated
What APIs can tell you if the current user is calibrated.

### How to force eye tracking calibration if user declines automatic prompt

Other pages that cover eye tracking:

https://learn.microsoft.com/en-us/windows/mixed-reality/design/eye-tracking
https://learn.microsoft.com/en-us/hololens/hololens-calibration
https://learn.microsoft.com/en-us/windows/mixed-reality/develop/native/gaze-in-directx
https://stackoverflow.com/questions/56877610/can-i-trigger-the-hololens-calibration-sequence-from-inside-my-application
