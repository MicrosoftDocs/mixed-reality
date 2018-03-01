---
title: In App Purchases
description: 
author: 
ms.author: alexturn
ms.date: 2/28/2018
ms.topic: article
keywords: 
---



# In App Purchases

In App Purchases are supported in HoloLens, but there is some work to set them up.

In order to leverage the In App Purchase functionality, you must:
* Create a XAML [2D view](app-views.md) to appear as a slate
* Switch to it to activate placement, which leaves the immersive view
* Call the API: await [CurrentApp.RequestProductPurchaseAsync("DurableItemIAPName");](https://docs.microsoft.com/en-us/uwp/api/windows.applicationmodel.store.currentapp#Windows_ApplicationModel_Store_CurrentApp_RequestProductPurchaseAsync_System_String_)

This API will bring up the stock Windows OS popup that shows the IAP name, description and price. The user can then choose purchase options. Once the action is completed, the app will need to present UI which allows the user to switch back to its [immersive view](app-views.md).

For apps targeting desktop Mixed Reality headsets, it is not required to manually switch to a XAML view before calling the RequestProductPurchaseAsync API.