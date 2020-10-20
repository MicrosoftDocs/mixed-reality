---
title: WinRT in Unreal
description: Overview of the spatial audio plugin for Unreal engine.
author: fieldsJacksonG
ms.author: jacksonf
ms.date: 07/08/2020
ms.topic: article
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, streaming, remoting, mixed reality, development, getting started, features, new project, emulator, documentation, guides, features, holograms, game development
---
# WinRT in Unreal

## Overview

Over the course of your HoloLens development you may need to write a feature using WinRT. For example, opening a file dialogue in a HoloLens application would need the FileSavePicker in winrt/Windows.Storage.Pickers.h header file.  Since Unreal doesn't natively compile WinRT code, it's your job to build a separate binary and that can be consumed by Unreal’s build system. This tutorial will walk you through just such a scenario.

## Objectives
- Create a Universal Windows DLL that opens a FileSaveDialogue
- Link that DLL to an Unreal game project
- Save a file on the HoloLens from an Unreal blueprint using the new DLL

## Getting started
1. Check that you have all [required tools](tutorials/unreal-uxt-ch1.md) installed
2. [Create a new Unreal project](tutorials/unreal-uxt-ch2.md#creating-a-new-unreal-project) and name it **Consumewinrt**
3. Enable the [required plugins](tutorials/unreal-uxt-ch2.md#enabling-required-plugins) for HoloLens development
4. [Setup for deployment](tutorials/unreal-uxt-ch6.md) to a device or emulator

## Creating a WinRT DLL 
1. Open a new Visual Studio project and create a **DLL (Universal Windows)** project in the same directory to the Unreal game’s **uproject** file. 

![Creating a DLL](images/unreal-winrt-img-01.png)

2. Name the project **HoloLensWinrtDLL** and set the location as a **ThirdParty** subdirectory to the Unreal game’s uproject file. 
    * Select **Place solution and project in the same directory** to simplify looking for paths later. 

![Configuring the DLL](images/unreal-winrt-img-02.png)

> [!IMPORTANT]
> After the new project compiles, you want to pay special attention to the blank cpp and header files, named **HoloLensWinrtDLL.cpp** and **HoloLensWinrtDLL.h** respectively. The header is the include file that uses the DLL in Unreal, while the cpp holds the body of any functions you export and includes any WinRT code that Unreal wouldn't otherwise be able to compile. 

3. Before you add any code, you need to update the project properties to ensure the WinRT code you need can compile: 
    * Right click on the HoloLensWinrtDLL project and select **properties**  
    * Change the **Configuration** dropdown to **All Configurations** and the **Platform** dropdown to **All Platforms**  
    * Under **Configuration Properties> C/C++> All Options**:
        * Add **await** to **Additional Options** to ensure we can wait on async tasks  
        * Change **C++ Language Standard** to **ISO C++17 Standard (/std:c++17)** to include any WinRT code

![Configuring the DLL](images/unreal-winrt-img-03.png)

Your project is ready to update the DLL’s source with WinRT code that opens a file dialogue and saves a file to the HoloLens disk.  

## Adding the DLL code
1. Open **HoloLensWinrtDLL.h** and add a dll exported function for Unreal to consume: 

```cpp
#pragma once

class HoloLensWinrtDLL
{
public:
    _declspec(dllexport) static void OpenFileDialogue();
};
```

2. Open **HoloLensWinrtDLL.cpp** and add all headers the class will use:  

```cpp
#include "pch.h"
#include "HoloLensWinrtDLL.h"

#include <winrt/Windows.Storage.h>
#include <winrt/Windows.Storage.Streams.h>
#include <winrt/Windows.Storage.Pickers.h>
#include <winrt/Windows.Foundation.h>
#include <winrt/Windows.Foundation.Collections.h>

#include <string>
#include <vector>
#include <thread>
```

> [!NOTE]
> All WinRT code is stored in **HoloLensWinrtDLL.cpp** so Unreal doesn't try to include any WinRT code when referencing the header. 

3. Still in **HoloLensWinrtDLL.cpp**, add a function body for OpenFileDialogue() and all supported code: 

```cpp
// sgm is declared outside of OpenFileDialogue so it doesn't
// get destroyed when OpenFileDialogue goes out of scope.
SaveGameManager sgm;

void HoloLensWinrtDLL::OpenFileDialogue()
{
    sgm.SaveGame();
}
```

4. Add a SaveGameManager class to **HoloLensWinrtDLL.cpp** to handle the file dialogue and saving the file: 

```cpp
class SaveGameManager
{
public:
    SaveGameManager()
    {
    }

    ~SaveGameManager()
    {
        // Wait for currently running thread to complete before terminating.
        if(m_thread.joinable())
        {
            m_thread.join();
        }
    }

    void SaveGame()
    {
        OpenFileDialogueAction();
    }

private:
    winrt::Windows::Storage::StorageFile m_file = winrt::Windows::Storage::StorageFile(nullptr);
    std::thread m_thread;

    winrt::Windows::Foundation::IAsyncAction OpenFileDialogueAction()
    {
        std::vector<winrt::hstring> extensions;
        extensions.push_back(L".txt");

        auto picker = winrt::Windows::Storage::Pickers::FileSavePicker();

        // FileSavePicker needs a file type to open without errors.
        picker.FileTypeChoices().Insert(L"Plain Text",
                                        winrt::single_threaded_vector<winrt::hstring>(
                                        std::move(extensions)));

        // Opening the FilePicker must be done on the Game UI thread.
        // Any other IAsyncOperations should be done on a background thread.
        m_file = co_await picker.PickSaveFileAsync();

        if(m_file)
        {
            // Unreal's game thread is an STA, async tasks need to run on
            // a background MTA thread, or waiting on them will deadlock.    
            std::thread thread([this]() { RunThread(); });
            m_thread = std::move(thread);
        }
    }

    void RunThread()
    {
        // Ensure this thread is an MTA
        winrt::init_apartment();
        Run().get();
    }

    winrt::Windows::Foundation::IAsyncAction Run()
    {
        co_await winrt::Windows::Storage::FileIO::WriteTextAsync(
                m_file, L"Hello WinRT");
    }
};
```

5. Build the solution for **Release > ARM64** to build the DLL to the child directory ARM64/Release/HoloLensWinrtDLL from the DLL solution. 

## Adding the WinRT binary to Unreal 
Linking and using a DLL in Unreal requires a C++ project. If you're using a Blueprint project, it can be easily converted to a C++ project by adding a C++ class:  

1. In the Unreal editor, open **File > New C++ Class…** and create a new **Actor** named **WinrtActor** to run the code in the DLL: 

![Configuring the DLL](images/unreal-winrt-img-04.png)

> [!NOTE]
> A solution has now been created in the same directory as the uproject file along with a new build script named Source/ConsumeWinRT/ConsumerWinRT.Build.cs.

2. Open the solution, browse for the **Games/ConsumeWinRT/Source/ConsumeWinRT** folder, and open **ConsumeWinRT.build.cs**:

![Configuring the DLL](images/unreal-winrt-img-05.png)

### Linking the DLL
1. In **ConsumeWinRT.build.cs**, add a property to find the include path for the DLL (the directory containing HoloLensWinrtDLL.h). The DLL is in a child directory to the include path, so this property will be used as the binary root dir:

```cs
public class ConsumeWinRT : ModuleRules
{
    private string WinrtIncPath
    {
        get 
        {
            string ModulePath = Path.GetDirectoryName(
                   RulesCompiler.GetFileNameFromType(this.GetType()));

            // Third party directory is at the project root,
            // which is two directories up from the game .exe (Binaries/HoloLens)
            return Path.GetFullPath(
                   Path.Combine(ModulePath,
                   "../../ThirddParty/HoloLensWinrtDLL"));
        }
    }
}
```

2. In the class constructor, add the following code to update the include path, link the new lib, and delay-load and copy the DLL to the packaged appx location:

```cs
public ConsumeWinRT(ReadOnlyTargetRules target) : base(Target)
{
    // This is the directory the DLL's include header is in.
    PublicIncludePaths.Add(WinrtIncPath);

    // The code in HoloLensWinrtDLL will only work in a Windows Store app.
    // Only link these binaries for HoloLens.
    // Similar code can be written for desktop and similarly linked 
    // to use the same features when using Holographic Remoting.
    if(Target.Platform == UnrealTargetPlatform.HoloLens)
    {
        // Link the lib
        PublicAdditionalLibraries.Add(Path.Combine(
              WinrtIncPath, "ARM64", "Release",
              "HoloLensWinrtDLL","HoloLensWinrtDLL.lib"));

        string winrtDLL = "HoloLensWinrtDLL.dll";
        // Mark the dll to be DelayLoaded
        PublicDelayLoadDLLs.Add(winrtDLL);
        // RuntimeDependencies are included in packaged builds.
        RuntimeDependencies.Add(Path.Combine(WinrtIncPath,
                "ARM64", "Release", "HoloLensWinrtDLL", winrtDLL));
    }

    // Preserve the original code in build.cs below:
}
```

3. Open **WinrtActor.h** and add two function definitions, one that a blueprint can use and another that uses the DLL code: 
```cpp
public:
    UFUNCTION(BlueprintCallable)
    static void OpenFileDialogue;
```

4. Open **WinrtActor.cpp** and load the DLL in BeginPlay: 

```cpp
void AWinfrtActor::BeginPlay()
{
#if PLATFORM_HOLOLENS
    HoloLensWinrtDLL::OpenFileDialogue();
#endif
}
``` 

>[!CAUTION]
> The DLL must be loaded before calling any of its functions.

### Building the game
1. Build the game solution to launch the Unreal editor opened to the game project: 
    * In the **Place Actors** tab, search for the new **WinrtActor** and drag it into the scene 
    * Open the level blueprint to execute the blueprint callable function in the **WinrtActor** 

![Configuring the DLL](images/unreal-winrt-img-06.png)

2. In the **World Outliner**, find the **WindrtActor** previously dropped into the scene and drag it into the level blueprint: 

![Configuring the DLL](images/unreal-winrt-img-07.png)

3. In the level blueprint, drag the output node from WinrtActor, search for **Open File Dialogue**, then route the node from any user input.  In this case, Open File Dialogue is being called from a speech event: 

![Configuring the DLL](images/unreal-winrt-img-08.png)

4. [Package this game for HoloLens](tutorials/unreal-uxt-ch6.md), deploy it, and run.  

When Unreal calls OpenFileDialogue, a File Dialogue opens on the HoloLens prompting for a .txt file name.  After the file is saved, go to the **File explorer** tab in the device portal to see the contents “Hello WinRT”. 

## Summary 

We encourage you to use the code in this tutorial as a starting point for consuming WinRT code in Unreal.  It allows users to save files to the HoloLens disk using the same file dialogue as Windows.  Follow the same process to export any additional functions from the HoloLensWinrtDLL header and used in Unreal.  Note the DLL code that waits on any async WinRT code in a background MTA thread, which avoids deadlocking the Unreal game thread. 

## Next Development Checkpoint

If you're following the Unreal development checkpoint journey we've laid out, you're in the midst of exploring the Mixed Reality platform capabilities and APIs. From here, you can proceed to any [topic](unreal-development-overview.md#3-platform-capabilities-and-apis) or jump directly to deploying your app on a device or emulator.

> [!div class="nextstepaction"]
> [Deploying to device](unreal-deploying.md)

## See also
* [C++/WinRT APIs](https://docs.microsoft.com/windows/uwp/cpp-and-winrt-apis/)
* [FileSavePicker class](https://docs.microsoft.com/uwp/api/Windows.Storage.Pickers.FileSavePicker) 
* [Unreal Third-Party Libraries](https://docs.unrealengine.com/Programming/BuildTools/UnrealBuildTool/ThirdPartyLibraries/index.html) 
