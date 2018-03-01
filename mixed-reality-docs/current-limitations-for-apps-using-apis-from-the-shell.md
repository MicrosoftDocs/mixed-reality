---
title: Current limitations for apps using APIs from the shell
description: 
author: 
ms.author: alexturn
ms.date: 2/28/2018
ms.topic: article
keywords: 
---



# Current limitations for apps using APIs from the shell

The HoloLens runs Windows 10, which means it shares the same core operating system as other devices in the Windows 10 family: desktop, mobile, and Xbox. However, because this is the first release of Windows Holographic, there are APIs and features that have not reached the same level of support as they have on desktop or mobile. Below are details on some of the major features that your Universal Windows Platform (UWP) apps may use that do not currently function on HoloLens. All APIs are available and will fail gracefully if they are unavailable. As we flight and service Windows, we will continue implementing, testing, and bug fixing until all of the UWP API surface is fully operational on HoloLens.

## Windows 10 concepts not currently available

|  **Windows 10 concept**  |  More info | 
|----------|----------|
|  **Notifications**  |  Notification, both local and push notifications from Windows Notification Service - WNS, are not completely enabled or functional on HoloLens. This includes the ability to update your app and tiles with WNS pushed events. Apps should take care in handling calls to these APIS; there are no guarantees that apps which have critical functionality depending on WNS will be correctly notified and activated to update data. We care deeply about this scenario and are making the investments to bring a fully functioning notifications story in the future. | 
|  **Tiles**  |  Our [app model](app-model.md) has a limited use of Tiles today. Your app should not need to remove any of the primary or secondary tile functionality. However, we will only use the medium Tile for the Start menu and apps will be represented in the world as secondary tiles drawn with the static splash screen specified in your app. This is an area we will continue to investigate for future flights of HoloLens. Please send your feedback through the **Windows Feedback** app about what scenarios you'd like to enable with your 2D tile from other platforms. | 
|  **Share Contract**  |  The Share Contract is not implemented and has no UI on HoloLens. | 
|  **Localization**  |  Localization within your app will continue to work, however, within the shell and Start Menu, non-English characters are not supported at this time. | 
|  **File Explorer and Local File System **  |  The Windows Holographic [app model](app-model.md) does not currently expose the concept of a file system. There are [known folders](app-model.md#known-folders), but there is no built in, local File Explorer app like on Windows Desktop or Mobile. Apps can save files to their local state folders. Apps can also save files to a registered File Picker app like OneDrive. | 
|  **Toasts**  |  Toast APIs do not function on HoloLens | 
|  **APIs for Contacts and Calendar**  |  These APIs depend on the Contacts and Calendar apps that are currently not available. Until these apps are on HoloLens, these APIs are not completely functional. | 
|  **EmailRT and MessagingRT**  |  Access to email, messages on device. These APIs do not function on HoloLens. | 
|  **App Services**  |  With App Services, store apps can provide services to other store apps. This is not functioning today but will be a part of a future release of Windows Holographic. | 

## Universal APIs not Supported

In the current version of Windows Holographic, there are several APIs that are not supported and may or may not be fully implemented. Even though there is nothing blocking your app from using these APIs, know that until these APIs are fully supported, you may have issues, instability, and unexpected behaviors.

We will update this list as future flights enable APIs.

| **Namespace** | **Classname** | 
| Windows.ApplicationModel.Background | PushNotificationTrigger | 
| Windows.ApplicationModel.Background | ToastNotificationActionTrigger | 
| Windows.ApplicationModel.Background | ToastNotificationHistoryChangedTrigger | 
| Windows.ApplicationModel.DataTransfer | DataTransferManager | 
| Windows.ApplicationModel.DataTransfer | TargetApplicationChosenEventArgs | 
| Windows.ApplicationModel.DataTransfer.ShareTarget | QuickLink | 
| Windows.ApplicationModel.DataTransfer.ShareTarget | ShareOperation | 
| Windows.Graphics.Printing | PrintManager | 
| Windows.Graphics.Printing | PrintTask | 
| Windows.Graphics.Printing | PrintTaskCompletedEventArgs | 
| Windows.Graphics.Printing | PrintTaskOptions | 
| Windows.Graphics.Printing | PrintTaskProgressingEventArgs | 
| Windows.Graphics.Printing | PrintTaskRequest | 
| Windows.Graphics.Printing | PrintTaskRequestedDeferral | 
| Windows.Graphics.Printing | PrintTaskRequestedEventArgs | 
| Windows.Graphics.Printing | PrintTaskSourceRequestedArgs | 
| Windows.Graphics.Printing | PrintTaskSourceRequestedDeferral | 
| Windows.Graphics.Printing | StandardPrintTaskOptions | 
| Windows.Graphics.Printing.OptionDetails | PrintBindingOptionDetails | 
| Windows.Graphics.Printing.OptionDetails | PrintCollationOptionDetails | 
| Windows.Graphics.Printing.OptionDetails | PrintColorModeOptionDetails | 
| Windows.Graphics.Printing.OptionDetails | PrintCopiesOptionDetails | 
| Windows.Graphics.Printing.OptionDetails | PrintCustomItemDetails | 
| Windows.Graphics.Printing.OptionDetails | PrintCustomItemListOptionDetails | 
| Windows.Graphics.Printing.OptionDetails | PrintCustomTextOptionDetails | 
| Windows.Graphics.Printing.OptionDetails | PrintDuplexOptionDetails | 
| Windows.Graphics.Printing.OptionDetails | PrintHolePunchOptionDetails | 
| Windows.Graphics.Printing.OptionDetails | PrintMediaSizeOptionDetails | 
| Windows.Graphics.Printing.OptionDetails | PrintMediaTypeOptionDetails | 
| Windows.Graphics.Printing.OptionDetails | PrintOrientationOptionDetails | 
| Windows.Graphics.Printing.OptionDetails | PrintQualityOptionDetails | 
| Windows.Graphics.Printing.OptionDetails | PrintStapleOptionDetails | 
| Windows.Graphics.Printing.OptionDetails | PrintTaskOptionChangedEventArgs | 
| Windows.Graphics.Printing.OptionDetails | PrintTaskOptionDetails | 
| Windows.Media.Capture | CameraCaptureUI | 
| Windows.Media.Capture | CameraCaptureUIPhotoCaptureSettings | 
| Windows.Media.Capture | CameraCaptureUIVideoCaptureSettings | 
| Windows.Networking.PushNotifications | PushNotificationChannel | 
| Windows.Networking.PushNotifications | PushNotificationChannelManager | 
| Windows.Networking.PushNotifications | PushNotificationReceivedEventArgs | 
| Windows.Networking.PushNotifications | RawNotification | 
| Windows.Networking.ServiceDiscovery.Dnssd | DnssdServiceInstanceCollection | 
| Windows.Networking.ServiceDiscovery.Dnssd | DnssdServiceWatcher | 
| Windows.UI.Notifications | BadgeNotification | 
| Windows.UI.Notifications | BadgeUpdateManager | 
| Windows.UI.Notifications | BadgeUpdater | 
| Windows.UI.Notifications | ScheduledTileNotification | 
| Windows.UI.Notifications | ScheduledToastNotification | 
| Windows.UI.Notifications | TileNotification | 
| Windows.UI.Notifications | TileUpdateManager | 
| Windows.UI.Notifications | TileUpdater | 
| Windows.UI.Notifications | ToastActivatedEventArgs | 
| Windows.UI.Notifications | ToastDismissedEventArgs | 
| Windows.UI.Notifications | ToastFailedEventArgs | 
| Windows.UI.Notifications | ToastNotification | 
| Windows.UI.Notifications | ToastNotificationActionTriggerDetail | 
| Windows.UI.Notifications | ToastNotificationHistory | 
| Windows.UI.Notifications | ToastNotificationHistoryChangedTriggerDetail | 
| Windows.UI.Notifications | ToastNotificationManager | 
| Windows.UI.Notifications | ToastNotifier | 
| Windows.ApplicationModel.Background | DeviceConnectionChangeTrigger | 
| Windows.ApplicationModel.DataTransfer.DragDrop.Core | CoreDragDropManager | 
| Windows.ApplicationModel.DataTransfer.DragDrop.Core | CoreDragInfo | 
| Windows.ApplicationModel.DataTransfer.DragDrop.Core | CoreDragOperation | 
| Windows.ApplicationModel.DataTransfer.DragDrop.Core | CoreDragUIOverride | 
| Windows.ApplicationModel.DataTransfer.DragDrop.Core | CoreDropOperationTargetRequestedEventArgs | 
| Windows.Devices.Enumeration | DeviceDisconnectButtonClickedEventArgs | 
| Windows.Devices.Enumeration | DeviceInformationPairing | 
| Windows.Devices.Enumeration | DevicePicker | 
| Windows.Devices.Enumeration | DevicePickerAppearance | 
| Windows.Devices.Enumeration | DevicePickerFilter | 
| Windows.Devices.Enumeration | DeviceSelectedEventArgs | 
| Windows.Devices.Enumeration | DeviceThumbnail | 
| Windows.System | FolderLauncherOptions | 
| Windows.UI.ApplicationSettings | AccountsSettingsPane | 
| Windows.UI.ApplicationSettings | AccountsSettingsPaneCommandsRequestedEventArgs | 
| Windows.UI.ApplicationSettings | AccountsSettingsPaneEventDeferral | 
| Windows.UI.ApplicationSettings | CredentialCommand | 
| Windows.UI.ApplicationSettings | SettingsCommand | 
| Windows.UI.ApplicationSettings | WebAccountCommand | 
| Windows.UI.ApplicationSettings | WebAccountInvokedArgs | 
| Windows.UI.ApplicationSettings | WebAccountProviderCommand | 
| Windows.UI.ViewManagement | ProjectionManager | 
| Windows.UI.ViewManagement | UISettings | 

## See also
* [App model](app-model.md)
* [Submitting an app to the Windows Store](submitting-an-app-to-the-windows-store.md)
* [Updating your existing universal app for HoloLens](updating-your-existing-universal-app-for-hololens.md)