# Managing Eye Tracking Access and Calibration
Eye tracking on HoloLens 2 provides powerful capabilities for supercharging user interactions.  However, there are two user checkpoints that must complete successfully in order for everything to work.  This includes approving eye tracking access for your app, and having completed eye tracking calibration on the device.  The system will automatically prompt the user to complete these as needed, but it is all too easy to accidentally decline and get stuck. This document outlines development best practices for navigating the eye tracking checkpoints, ensuring a smooth and quality experience with your application.

## Eye Tracking App Access
In order to utilize eye tracking, your app needs to request access to the eye tracking system when it starts up.

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
