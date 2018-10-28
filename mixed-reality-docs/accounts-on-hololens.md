---
title: Accounts on HoloLens
description: How to set up and manage user accounts on HoloLens.
author: 
ms.author: toddly
ms.date: 03/21/2018
ms.topic: article
keywords: HoloLens, user, account, aad, adfs, microsoft account, msa, credentials
---



# Accounts on HoloLens

During initial HoloLens setup, users are required to sign in with the account they want to use on the device. This account can be either a consumer Microsoft account or an enterprise account that has been configured in Azure Active Directory (AAD) or Active Directory Federation Services (ADFS).

Signing into this account during setup creates a user profile on the device which the user can use to sign-in, and against which all apps will store their data. This same account also provides Single Sign On for apps such as Edge or Skype via the Windows Account Manager APIs.

Additionally, when signing into an enterprise or organizational account on the device, it may also apply Mobile Device Management (MDM) policy, if configured by your IT Admin.

Whenever the device restarts or resumes from standby, the credentials for this account are used to sign-in again. If the option enforcing an explicit sign-in is enabled in Settings, the user will be required to type in their credentials again. Anytime the device restarts after receiving and applying an OS update, an explicit sign-in is required.

## Multi-user support

>[!NOTE]
>Multi-user support requires the Commercial Suite, as this is a [Windows Holographic for Business](https://docs.microsoft.com/hololens/hololens-upgrade-enterprise) feature.

Starting with the [Windows 10 April 2018 Update](release-notes-april-2018.md), HoloLens supports multiple users from within the same AAD tenant. To use this you must set up the device initially with an account that belongs to your organization. Subsequently, other users from the same tenant will be able to sign into the device from the sign-in screen or by tapping the user tile on the Start panel to sign out the existing user. 

Apps installed on the device will be available to all other users, but each will have their own app data and preferences. Removing an app will also remove it for all other users though. 

You can remove device users from the device to reclaim space by going to Settings > Accounts > Other people. This will also remove all of the other users' app data from the device. 

## Linked accounts

Within a single device account, users can link additional web account credentials for the purpose of the easier access within apps (such as the Store) or to combine access to personal and work resources, similar to the Desktop version of Windows. Signing into an additional account in this way does not separate the user data created on the device, such as images or downloads. Once an account has been connected to a device, apps can make use of it with your permission to reduce having to sign into each app individually.

## Using single sign-on within an app

As an app developer, you can take advantage of having a connected identity on HoloLens with the [Windows Account Manager APIs](https://msdn.microsoft.com/library/windows/apps/xaml/windows.security.authentication.web.core.aspx), just as you would on other Windows devices. Some code samples for these APIs are available [here](http://go.microsoft.com/fwlink/p/?LinkId=620621).

Any account interrupts that may occur such as requesting user consent for account information, two-factor authentication etc. must be handled when the app requests an authentication token.

If your app requires a specific account type that hasn't been linked previously, your app can ask the system to prompt the user to add one. This will trigger the account settings pane to be launched as a modal child of your app. For 2D apps, this window will render directly over the center of your app and for Unity apps, this will briefly take the user out of your holographic app so that this child window can be rendered. Customizing the commands and actions on this pane is described [here](https://msdn.microsoft.com/library/windows/apps/windows.ui.applicationsettings.webaccountcommand.aspx).

## Enterprise and other authentication

If your app makes use of other types of authentication, such as NTLM, Basic, or Kerberos, you can use [Windows Credential UI](https://msdn.microsoft.com/library/windows/apps/windows.security.credentials.ui.aspx) to collect, process, and store the user's credentials. The user experience for collecting these credentials is very similar to other cloud driven account interrupts and will appear as a child app on top of your 2D app or briefly suspend a Unity app to show the UI.

## Deprecated APIs

One difference for developing on HoloLens from Desktop is that [OnlineIDAuthenticator](https://msdn.microsoft.com/library/windows/apps/windows.security.authentication.onlineid.onlineidauthenticator.aspx) API is not fully supported. Although it will return a token if the primary account is in good-standing, interrupts such as those described above will not display any UI for the user, and will fail to correctly authenticate the account.

