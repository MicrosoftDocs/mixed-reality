---
title: Accounts on HoloLens
description: How to set up and manage user accounts on HoloLens.
author: 
ms.author: toddly
ms.date: 2/28/2018
ms.topic: article
keywords: HoloLens, user, account, aad, adfs, microsoft account, msa, credentials
---



# Accounts on HoloLens

During initial HoloLens setup, users are required to sign in with the account they want to use on the device. This account can be either a consumer Microsoft account or an enterprise account that has been configured in Azure Active Directory (AAD) or Active Directory Federation Services (ADFS).

HoloLens is a single user device and signing into this account during setup creates a user profile on the device which the user can use to sign-in, and against which all apps will store their data. This same account also provides Single Sign On for apps such as Edge or Skype via the Windows Account Manager APIs.

Additionally, when signing into an enterprise or organizational account on the device, it may also apply Mobile Device Management (MDM) policy, if configured by your IT Admin.

Whenever the device restarts or resumes from standby, the credentials for this account are used to sign-in again. If the option enforcing an explicit sign-in is enabled in Settings, the user will be required to type in their credentials again. Anytime the device restarts after receiving and applying an OS update, an explicit sign-in is required.

Note: To remove the account used in initial setup from a HoloLens you will need to reset the device from Settings or use Windows Device Recovery Tool.

## Linked Accounts

Although HoloLens is a single user device, users can link additional accounts for the purpose of the easier access within apps (such as the Store) or to combine access to personal and work resources, similar to the Desktop version of Windows. Signing into an additional account does not separate the user data created on the device, such as images or downloads. Once an account has been connected to a device, apps can make use of it with your permission to reduce having to sign into each app individually.

## Using Single Sign On within an App

As an app developer, you can take advantage of having a connected identity on HoloLens with the [Windows Account Manager APIs](https://msdn.microsoft.com/en-us/library/windows/apps/xaml/windows.security.authentication.web.core.aspx), just as you would on other Windows devices. Some code samples for these APIs are available [here](http://go.microsoft.com/fwlink/p/?LinkId=620621).

Any account interrupts that may occur such as requesting user consent for account information, two-factor authentication etc. must be handled when the app requests an authentication token.

If your app requires a specific account type that hasn't been linked previously, your app can ask the system to prompt the user to add one. This will trigger the account settings pane to be launched as a modal child of your app. For 2D apps, this window will render directly over the center of your app and for Unity apps, this will briefly take the user out of your holographic app so that this child window can be rendered. Customizing the commands and actions on this pane is described [here](https://msdn.microsoft.com/en-us/library/windows/apps/windows.ui.applicationsettings.webaccountcommand.aspx).

## Enterprise and Other Authentication

If your app makes use of other types of authentication, such as NTLM, Basic, or Kerberos, you can use [Windows Credential UI](https://msdn.microsoft.com/en-us/library/windows/apps/windows.security.credentials.ui.aspx) to collect, process, and store the user's credentials. The user experience for collecting these credentials is very similar to other cloud driven account interrupts and will appear as a child app on top of your 2D app or briefly suspend a Unity app to show the UI.

## Deprecated APIs

One difference for developing on HoloLens from Desktop is that [OnlineIDAuthenticator](https://msdn.microsoft.com/en-us/library/windows/apps/windows.security.authentication.onlineid.onlineidauthenticator.aspx) API is not fully supported. Although it will return a token if the primary account is in good-standing, interrupts such as those described above will not display any UI for the user, and will fail to correctly authenticate the account.

## Roaming App Data

While HoloLens does not currently support roaming of app data and user settings, we encourage developers to continue making use of the [roamed settings](https://msdn.microsoft.com/en-us/windows/uwp/app-settings/store-and-retrieve-app-data#Roaming_data) feature in their cross-platform apps. This will allow us to light up more functionality in your apps in the future.
