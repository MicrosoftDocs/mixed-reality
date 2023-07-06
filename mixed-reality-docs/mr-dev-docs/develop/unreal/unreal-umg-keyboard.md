---
title: UMG and keyboard in Unreal
description: Learn how to use Unrealm Motion Graphics to create a UI system out of widgets.
author: sean-kerawala
ms.author: sekerawa
ms.date: 11/25/2020
ms.topic: article
keywords: Windows Mixed Reality, holograms, HoloLens 2, eye tracking, gaze input, head mounted display, Unreal engine, mixed reality headset, windows mixed reality headset, virtual reality headset, widgets, UI, UMG, Unreal Motion Graphics, Unreal Engine, UE, UE4
---


# UMG and keyboard in Unreal

Unreal Motion Graphics (UMG) is Unreal Engine’s built-in UI system, used to create interfaces such as menus and text boxes. User interfaces built with UMG consist of widgets. We'll guide you through creating a new widget, adding it to world space, and enabling interaction using the system keyboard as an example. You can learn more about UMG in the official Unreal Engine [documentation](https://docs.unrealengine.com/en-US/Engine/UMG/index.html). 

## Create a new widget

- Create a Widget Blueprint to lay out the game’s UI:

![Screenshot of adding a widget blueprint from the Unreal menu](images/unreal-umg-img-01.png)

- Open the new blueprint and add components from the Palette to the canvas.  In this case, we've added two Text Box components from the “Input” section:

![Screenshot of the hierarchy window with text widget component highlighted and expanded](images/unreal-umg-img-02.png)

- Select a widget in the Hierarchy or Designer window and modify parameters in the details panel.  In this case, we’ve added some default “Hint Text” and a tint color that appears when you hover over the text box.  A text box will pop up a virtual keyboard on HoloLens when it's interacted with:

![Screenshot of modified parameters in the hierarchy window](images/unreal-umg-img-03.png)

- Events can also be subscribed to in the details panel:

![Screenshot of the events in the details panel](images/unreal-umg-img-04.png)

## Add a Widget to World Space

- Create a new Actor, add a Widget component, and add the actor to the scene:

![Screenshot of an actor with a widget attached](images/unreal-umg-img-05.png)

- In the details panel for the Widget, set the **Widget Class** to the Widget Blueprint created earlier:

![Screenshot of the blueprint details panel with the widget class set](images/unreal-umg-img-06.png)

- For a text Widget, ensure **Receive Hardware Input** is unchecked so we only update its text from the virtual keyboard:

![Screenshot of the interaction section with receive hardware input is unchecked](images/unreal-umg-img-07.png)

## Widget Interaction

UMG Widgets typically receive input from a mouse.  On HoloLens or VR, we need to simulate a mouse with a Widget Interaction component to get the same events.

- Create a new Actor, add a **Widget Interaction** component, and add the actor to your scene:

![Screenshot of a new actor with a widget interaction component highlighted](images/unreal-umg-img-08.png)

- In the details panel for the Widget Interaction component:
    - Set the interaction distance to the distance value you want
    - Set the **Interaction Source** to **custom**
    - For development, set **Show Debug** to **true**:

![Screenshot of the widget interaction and debugging component properties](images/unreal-umg-img-09.png)

The default for Interaction Source is “World”, which should send raycasts based on the world position of the Widget Interaction component. In AR and VR, that's not the case.  Enabling “Show Debug” and adding a hover tint to widgets is important to check the widget interaction component is doing what you expect.  The workaround is to use a custom source and set the raycast in the event graph from the hand ray.  

Here we're calling this from Event Tick:

![Blueprint of event tick](images/unreal-umg-img-10.png)

Then add virtual mouse pointer events to the widget interaction component reacting to HoloLens input.  In this case, send a Left Mouse press event when the hand is grasped, and a Left Mouse release event when not grasped:

![Blueprint with added virtual mouse pointer events](images/unreal-umg-img-13.png)

Now, when you deploy the app to the HoloLens 2, you’ll see a hand ray extending from your right hand. If you direct it at one of the editable text boxes and air tap, the system keyboard will appear in front of you and allow you to enter text. 
 
> [!NOTE]
> The HoloLens system keyboard requires Unreal Engine 4.26 or later. Additionally, the keyboard will not appear when your app is being streamed from the Unreal editor to the headset, only when the app is running on device.

## See Also:
* [Unreal's UMG documentation](https://docs.unrealengine.com/Engine/UMG/index.html)
* [Unreal's UMG tutorials](https://docs.unrealengine.com/Programming/Tutorials/UMG/index.html)
