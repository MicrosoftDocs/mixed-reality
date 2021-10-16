---
title: Keyboard, mouse, and controller input (C++)
description: Explains how to create an app for Windows Mixed Reality that uses keyboard, mouse, and game controllers.
author: mikeriches
ms.author: v-vtieto
ms.date: 09/02/2021
ms.topic: article
keywords: Windows Mixed Reality, keyboard, mouse, game controller, xbox controller, HoloLens, desktop, walkthrough, sample code
---

# Keyboard, mouse, and controller input (C++)

This article relates to the legacy WinRT native APIs.  For new native app projects, we recommend using the **[OpenXR API](../native/openxr-getting-started.md)**.

> The code snippets in this article currently demonstrate use of C++/CX rather than C++17-compliant C++/WinRT as used in the [C++ holographic project template](../native/creating-a-holographic-directx-project.md).  The concepts are equivalent for a C++/WinRT project, though you will need to translate the code.

## Subscribe for CoreWindow input events

### Keyboard input

In the Windows Holographic app template, we include an event handler for keyboard input just like any other UWP app. Your app consumes keyboard input data the same way in Windows Mixed Reality.

From AppView.cpp:

```
// Register for keypress notifications.
   window->KeyDown +=
       ref new TypedEventHandler<CoreWindow^, KeyEventArgs^>(this, &AppView::OnKeyPressed);

    …

   // Input event handlers

   void AppView::OnKeyPressed(CoreWindow^ sender, KeyEventArgs^ args)
   {
       //
       // TODO: Respond to keyboard input here.
       //
   }
```

### Virtual keyboard input
For immersive desktop headsets, you can support virtual keyboards rendered by Windows over your immersive view by implementing **CoreTextEditContext**. This lets Windows understand the state of your own app-rendered text boxes, so the virtual keyboard can correctly contribute to the text there.

For more information on implementing CoreTextEditContext support, see the [CoreTextEditContext sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/CustomEditControl).

### Mouse Input

You can also use mouse input, again via the UWP CoreWindow input event handlers. Here's how to modify the Windows Holographic app template to support mouse clicks in the same way as pressed gestures. After making this modification, a mouse click while wearing an immersive headset device will reposition the cube.

> [!NOTE]
> UWP apps can also get raw XY data for the mouse by using the [MouseDevice](/uwp/api/Windows.Devices.Input.MouseDevice) API.

Start by declaring a new OnPointerPressed handler in AppView.h:

```
protected:
       void OnPointerPressed(Windows::UI::Core::CoreWindow^ sender, Windows::UI::Core::PointerEventArgs^ args);
```

In AppView.cpp, add this code to SetWindow:

```
// Register for pointer pressed notifications.
   window->PointerPressed +=
       ref new TypedEventHandler<CoreWindow^, PointerEventArgs^>(this, &AppView::OnPointerPressed);
```

Then put this definition for OnPointerPressed at the bottom of the file:

```
void AppView::OnPointerPressed(CoreWindow^ sender, PointerEventArgs^ args)
   {
       // Allow the user to interact with the holographic world using the mouse.
       if (m_main != nullptr)
       {
           m_main->OnPointerPressed();
       }
   }
```

The event handler we just added is a pass-through to the template main class. Let's modify the main class to support this pass-through. Add this public method declaration to the header file:

```
// Handle mouse input.
       void OnPointerPressed();
```

You'll need this private member variable, as well:

```
// Keep track of mouse input.
       bool m_pointerPressed = false;
```

Finally, we'll update the main class with new logic to support mouse clicks. Start by adding this event handler. Make sure to update the class name:

```
void MyHolographicAppMain::OnPointerPressed()
   {
       m_pointerPressed = true;
   }
```

Now, in the Update method, replace the existing logic for getting a pointer pose with this:

```
SpatialInteractionSourceState^ pointerState = m_spatialInputHandler->CheckForInput();
   SpatialPointerPose^ pose = nullptr;
   if (pointerState != nullptr)
   {
       pose = pointerState->TryGetPointerPose(currentCoordinateSystem);
   }
   else if (m_pointerPressed)
   {
       pose = SpatialPointerPose::TryGetAtTimestamp(currentCoordinateSystem, prediction->Timestamp);
   }
   m_pointerPressed = false;
```

Recompile and redeploy. Notice that the mouse click will now reposition the cube in your immersive headset - or HoloLens with bluetooth mouse attached.

### Game controller support

Game controllers can be a fun and convenient way of allowing the user to control an immersive Windows Mixed Reality experience.

 add the following private member declarations to the header class for your main file:

```
// Recognize gamepads that are plugged in after the app starts.
       void OnGamepadAdded(Platform::Object^, Windows::Gaming::Input::Gamepad^ args);
```

```
// Stop looking for gamepads that are unplugged.
       void OnGamepadRemoved(Platform::Object^, Windows::Gaming::Input::Gamepad^ args);
```

```
Windows::Foundation::EventRegistrationToken                     m_gamepadAddedEventToken;
       Windows::Foundation::EventRegistrationToken                     m_gamepadRemovedEventToken;
```

```
// Keeps track of a gamepad and the state of its A button.
       struct GamepadWithButtonState
       {
           Windows::Gaming::Input::Gamepad^ gamepad;
           bool buttonAWasPressedLastFrame = false;
       };
       std::vector<GamepadWithButtonState>                             m_gamepads;
```

Initialize gamepad events, and any gamepads that are currently attached, in the constructor for your main class:

```
// If connected, a game controller can also be used for input.
   m_gamepadAddedEventToken = Gamepad::GamepadAdded +=
       ref new EventHandler<Gamepad^>(
           bind(&$safeprojectname$Main::OnGamepadAdded, this, _1, _2)
           );
```

```
m_gamepadRemovedEventToken = Gamepad::GamepadRemoved +=
       ref new EventHandler<Gamepad^>(
           bind(&$safeprojectname$Main::OnGamepadRemoved, this, _1, _2)
           );
```

```
for (auto const& gamepad : Gamepad::Gamepads)
   {
       OnGamepadAdded(nullptr, gamepad);
   }
```

Add these event handlers to your main class. Make sure to update the class name:

```
void MyHolographicAppMain::OnGamepadAdded(Object^, Gamepad^ args)
   {
       for (auto const& gamepadWithButtonState : m_gamepads)
       {
           if (args == gamepadWithButtonState.gamepad)
           {
               // This gamepad is already in the list.
               return;
           }
       }
       m_gamepads.push_back({ args, false });
   }
```

```
void MyHolographicAppMain::OnGamepadRemoved(Object^, Gamepad^ args)
   {
       m_gamepads.erase(
           std::remove_if(m_gamepads.begin(), m_gamepads.end(), [&](GamepadWithButtonState& gamepadWithState)
               {
                   return gamepadWithState.gamepad == args;
               }),
           m_gamepads.end());
   }
```

Finally, update the input logic to recognize changes in controller state. Here, we use the same m_pointerPressed variable discussed in the section above for adding mouse events. Add this to the Update method, just before where it checks for the SpatialPointerPose:

```
// Check for new input state since the last frame.
   for (auto& gamepadWithButtonState : m_gamepads)
   {
       bool buttonDownThisUpdate = ((gamepadWithButtonState.gamepad->GetCurrentReading().Buttons & GamepadButtons::A) == GamepadButtons::A);
       if (buttonDownThisUpdate && !gamepadWithButtonState.buttonAWasPressedLastFrame)
       {
           m_pointerPressed = true;
       }
       gamepadWithButtonState.buttonAWasPressedLastFrame = buttonDownThisUpdate;
   }
```

```
// For context.
   SpatialInteractionSourceState^ pointerState = m_spatialInputHandler->CheckForInput();
   SpatialPointerPose^ pose = nullptr;
   if (pointerState != nullptr)
   {
       pose = pointerState->TryGetPointerPose(currentCoordinateSystem);
   }
   else if (m_pointerPressed)
   {
       pose = SpatialPointerPose::TryGetAtTimestamp(currentCoordinateSystem, prediction->Timestamp);
   }
   m_pointerPressed = false;
```

Don't forget to unregister the events when cleaning up the main class:

```
if (m_gamepadAddedEventToken.Value != 0)
   {
       Gamepad::GamepadAdded -= m_gamepadAddedEventToken;
   }
   if (m_gamepadRemovedEventToken.Value != 0)
   {
       Gamepad::GamepadRemoved -= m_gamepadRemovedEventToken;
   }
```

Recompile, and redeploy. You can now attach, or pair, a game controller and use it to reposition the spinning cube.

## See also
* [Hardware accessories](../../discover/hardware-accessories.md)
