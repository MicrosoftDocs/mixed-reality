---
title: Editor extensions in Unreal
description: Learn how to extend the Unreal engine editor with custom scripts, scripted actions, and utility widgets.
author: hferrone
ms.author: safarooq
ms.date: 01/08/2021
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, editor extensions, Unreal editor, UE4, HoloLens, HoloLens 2, mixed reality, development, documentation, guides, features, mixed reality headset, windows mixed reality headset, virtual reality headset, porting, upgrading
---

# Editor extensions in Unreal

Unreal provides an extensive set of features that allow you to customize the engine to your needs. The features range from simple but limited, to very powerful but complex. The following steps are listed in order of increasing complexity. In general, you should reach for simpler solutions to your problem, and exhausting its options, before moving to a more complex option. As an example, we have found that the basic Construction Script can be used in lieu of plugins most of the time. 

<!-- Also, engine modification should be a last resort, as it is not only complex, but integrating changes back into the engine for simple work-around can take a disproportionately long time. -->

## Construction scripts

You can use construction scripts to perform initialization actions, which run when Blueprint instance are created.

* [User Constructions script](https://docs.unrealengine.com/ProgrammingAndScripting/Blueprints/UserGuide/UserConstructionScript/index.html)
* [Blueprint example](https://docs.unrealengine.com/Resources/ContentExamples/Blueprints/1_4/index.html)
* [Video tutorial](https://www.youtube.com/watch?v=z1SD-d9yJmQ&ab_channel=UnrealEngine)

## Scripted actions

Scripted Actions are Editor Utility Blueprints. You can launch them in the Unreal Editor by:
* Right-clicking **Assets** in the Content Browser
* Or by right-clicking **Actors** either in the Level Viewport or in the World Outliner

Scripted Actions are uniquely suited for times when you need your Blueprint logic to have contextual awareness about sets of Assets or Actors. Typically, a Scripted Action gets a list of Assets or Actors that you've selected when the action is executed, then modifies those objects or considers them in its graph.

* [Scripted Actions](https://docs.unrealengine.com/ProductionPipelines/ScriptingAndAutomation/Blueprints/ScriptedActions/index.html)
* [Running scripted actions on project startup](https://docs.unrealengine.com/ProductionPipelines/ScriptingAndAutomation/Blueprints/StartupObjects/index.html)

## Editor utility widgets

You can use [Editor Utility Widgets](https://docs.unrealengine.com/InteractiveExperiences/UMG/UserGuide/EditorUtilityWidgets/index.html) anytime you want to add new UI elements to modify the User Interface (UI) of the Unreal Editor. Editor Utility Widgets are based on Unreal Motion Graphics (UMG), so you can set up Widgets in a Blueprint like you would for any other UMG Widget Blueprint.

These Widgets are specifically for the Editor UI, and you can use them to create custom Editor tabs. You can then select these custom tabs from the Windows menu, like you would select existing Editor tabs.

## Plugins

Unreal lets you develop and manage your own custom [plugins](https://docs.unrealengine.com/ProductionPipelines/Plugins/index.html) for use with UE4 tools and runtime. You can enable or disable your plugins at any time in the Unreal Editor. Plugins can add runtime gameplay functionality, modify built-in Engine features, create new file types, and extend the capabilities of the Editor.

<!-- ## Engine modifications -->

