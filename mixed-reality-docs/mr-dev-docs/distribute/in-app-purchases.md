---
title: In-app purchases
description: Learn how to use in-app purchases in your mixed reality apps with a 2D XAML view and stock Windows OS popup.
author: thetuvix
ms.author: alexturn
ms.date: 05/03/2022
ms.topic: how-to
keywords: in-app purchases, hololens, XAML, mixed reality headset, windows mixed reality headset, virtual reality headset
ms.custom: kr2b-contr-experiment
---

# In-app purchases

HoloLens supports in-app purchases (IAPs), but there's some work to set them up.

To use the in app-purchase functionality:

1. Create a XAML [2D view](../design/app-views.md) to appear as a slate.
1. Switch to the XAML view to activate placement, which leaves the [immersive view](../design/app-views.md#immersive-views).
1. Call the [RequestProductPurchaseAsync](/uwp/api/windows.applicationmodel.store.currentapp.requestproductpurchaseasync#windows-applicationmodel-store-currentapp-requestproductpurchaseasync(system-string)) API:

   `await CurrentApp.RequestProductPurchaseAsync("DurableItemIAPName");`

   The `RequestProductPurchaseAsync` API brings up the stock Windows OS popup that shows the in-app purchase name, description, and price. The user can then choose purchase options.

1. Once the user completes the purchase, present UI that lets the user switch back to the app's immersive view.

Apps that target desktop-based Windows Mixed Reality immersive headsets don't need to manually switch to a XAML view before they call the `RequestProductPurchaseAsync` API.
