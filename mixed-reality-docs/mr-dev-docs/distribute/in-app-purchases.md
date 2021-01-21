---
title: In-app purchases
description: Learn how to use in-app purchases in your mixed reality apps with 2D XAML views and stock Windows OS popup.
author: thetuvix
ms.author: alexturn
ms.date: 03/21/2018
ms.topic: article
keywords: in-app purchases, hololens, XAML, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# In-app purchases

In-app purchases are supported in HoloLens, but there's some work to set them up.

To use the in app-purchase functionality, you must:
* Create a XAML [2D view](../design/app-views.md) to appear as a slate
* Switch to it to activate placement, which leaves the immersive view
* Call the API: await [CurrentApp.RequestProductPurchaseAsync("DurableItemIAPName");](/uwp/api/windows.applicationmodel.store.currentapp#Windows_ApplicationModel_Store_CurrentApp_RequestProductPurchaseAsync_System_String_)

This API will bring up the stock Windows OS popup that shows the in-app purchase name, description, and price. The user can then choose purchase options. Once the action is completed, the app will need to present UI, which allows the user to switch back to its [immersive view](../design/app-views.md).

For apps targeting desktop-based Windows Mixed Reality immersive headsets, it isn't required to manually switch to a XAML view before calling the RequestProductPurchaseAsync API.