---
title: WebViewMouseEventData Class
description: Class Definition with the WebViewMouseEventData class used by the WebView2 plugin.
author: michaelfarnsworth
ms.author: mifarnsworth
ms.date: 5/9/2023
ms.topic: article
keywords: HoloLens, WebView2, Unity
---
# WebViewMouseEventData Class

The `WebViewMouseEventData` class is used by the [IWithMouseEvents.MouseEvent Method](webview2-unity-plugin.md#iwithmouseeventsmouseevent-method) to send input events to the WebView control.

```c#
public class WebViewMouseEventData
{
    public enum TertiaryAxisDevice
    {
        None = -1,
        PointingDevice = 0,
        Dpad
    }

    public enum EventType
    {
        MouseMove = 0,
        MouseDown = 1,
        MouseUp = 2,
        MouseWheel = 3,
    }

    public enum MouseButton
    {
        ButtonNone = -1,
        ButtonLeft = 0,
        ButtonMiddle = 1,
        ButtonRight = 2,
    }

    public enum WheelBehaviorHint
    {
        RelativeAndButtonDown = 0,
        Absolute = 1
    }

    public MouseButton Button { get; set; }

    public WebViewEventModifiersState Modifiers { get; set; }

    public WebViewEventMouseModifiersState MouseModifiers { get; set; }

    public EventType Type { get; set; }

    public float WheelX { get; set; }

    public float WheelY { get; set; }

    public int X { get; set; }

    public int Y { get; set; }

    public WheelBehaviorHint WheelHint { get; set; } = WheelBehaviorHint.RelativeAndButtonDown;

    public TertiaryAxisDevice TertiaryAxisDeviceType { get; set; }
}

public class WebViewEventMouseModifiersState
{
    public bool IsLeftButtonDown { get; set; }

    public bool IsMiddleButtonDown { get; set; }

    public bool IsRightButtonDown { get; set; }
}
```

## See also

* [WebView plugin for Unity API Reference (Preview)](webview2-unity-plugin.md)