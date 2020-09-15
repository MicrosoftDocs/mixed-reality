---
title: In-app purchases
description: In-app purchases are supported in mixed reality apps, but there is some work to set them up.
author: thetuvix
ms.author: alexturn
ms.date: 03/21/2018
ms.topic: article
keywords: in-app purchases, hololens
---



# In-app purchases

In-app purchases are supported in HoloLens, but there is some work to set them up.

In order to leverage the in app-purchase functionality, you must:
* Create a XAML [2D view](app-views.md) to appear as a slate
* Switch to it to activate placement, which leaves the immersive view
* Call the API: await [CurrentApp.RequestProductPurchaseAsync("DurableItemIAPName");](https://docs.microsoft.com/uwp/api/windows.applicationmodel.store.currentapp#Windows_ApplicationModel_Store_CurrentApp_RequestProductPurchaseAsync_System_String_)

This API will bring up the stock Windows OS popup that shows the in-app purchase name, description, and price. The user can then choose purchase options. Once the action is completed, the app will need to present UI which allows the user to switch back to its [immersive view](app-views.md).

For apps targeting desktop-based Windows Mixed Reality immersive headsets, it is not required to manually switch to a XAML view before calling the RequestProductPurchaseAsync API.
