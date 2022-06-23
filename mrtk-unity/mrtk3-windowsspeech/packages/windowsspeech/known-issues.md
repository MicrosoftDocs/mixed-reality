---
title: Known Issues with Windows Speech
description: Known Issues - Windows Speech
author: MaxWang-MS
ms.author: wangmax
ms.date: 6/5/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, known issues, windows speech, speech, phrase, phrase recognition, speech recognition, Mixed Reality Toolkit
---

# Known Issues with Windows Speech &#8212; MRTK3

Currently the `select` keyword can't trigger `UnityAction`s/select events correctly on HoloLens 2. Saying the keyword will cause a system tooltip with the word `select` to show up but `WindowsPhraseRecognitionSubsystem` will not fire any event. The issue is being addressed and a fix is expected soon.
