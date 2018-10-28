---
title: Commercial features
description: The Microsoft HoloLens Commercial Suite includes features that make it easier for businesses to manage HoloLens devices.
author: xerxesb85
ms.author: xerxesb
ms.date: 03/21/2018
ms.topic: article
keywords: HoloLens, commercial, features, mdm, mobile device management, kiosk mode
---



# Commercial features

The Microsoft HoloLens Commercial Suite includes features that make it easier for businesses to manage HoloLens devices. Commercial features are included in the Windows operating system, but they are enabled by a license. In nearly all cases, the license is enabled by Microsoft Device Management when HoloLens enrolls in an organization. Contact your local Microsoft account manager to purchase the Microsoft HoloLens Commercial Suite.

&nbsp;

>[!VIDEO https://www.youtube.com/embed/tNd0e2CiAkE]

## Key commercial features

* **Kiosk mode.** With HoloLens kiosk mode, you can limit which apps to run to enable demo or showcase experiences.

  ![With kiosk mode, HoloLens launches directly into the app of your choice.](images/201608-kioskmode-400px.png)

* **Mobile Device Management (MDM) for HoloLens.** Your IT department can manage multiple HoloLens devices simultaneously using solutions like Microsoft Intune. You will be able to manage settings, select apps to install and set security configurations tailored to your organization's need.

  ![Mobile Device Management on HoloLens provides enterprise grade device management across multiple devices.](images/201608-enterprisemanagement-400px.png)
  
* **Windows Update for Business.** Controlled operating system updates to devices and support for long term servicing branch.
* **Data security.** BitLocker data encryption is enabled on HoloLens to provide the same level of security protection as any other Windows device.
* **Work access.** Anyone in your organization can remotely connect to the corporate network through virtual private network on a HoloLens. HoloLens can also access Wi-Fi networks that require credentials.
* **Microsoft Store for Business.** Your IT department can also set up an enterprise private store, containing only your company’s apps for your specific HoloLens usage. Securely distribute your enterprise software to selected group of enterprise users.

## Development Edition vs. Commercial Suite

<table>
<tr>
<th>Features</th><th>Development Edition</th><th>Commercial Suite</th>
</tr><tr>
<td>Device Encryption (Bitlocker)</td><td></td><td style="text-align: center;">✔️</td>
</tr><tr>
<td>Virtual Private Network (VPN)</td><td></td><td style="text-align: center;">✔️</td>
</tr><tr>
<td><a href="using-the-windows-device-portal.md#kiosk-mode">Kiosk mode</a></td><td></td><td style="text-align: center;">✔️</td>
</tr><tr>
<th colspan="3" style="text-align: left;"> Management and deployment</th>
</tr><tr>
<td>Mobile Device Management (MDM)</td><td style="text-align: center;"></td><td style="text-align: center;">✔️</td>
</tr><tr>
<td>Ability to block un-enrollment</td><td></td><td style="text-align: center;">✔️</td>
</tr><tr>
<td>Cert Based Corporate Wi-Fi Access</td><td></td><td style="text-align: center;">✔️</td>
</tr><tr>
<td>Microsoft Store (Consumer)</td><td style="text-align: center;">Consumer</td><td style="text-align: center;">Filtering via MDM</td>
</tr><tr>
<td><a href="https://technet.microsoft.com/itpro/windows/manage/working-with-line-of-business-apps">Business Store Portal</a></td><td></td><td style="text-align: center;">✔️</td>
</tr><tr>
<th colspan="3" style="text-align: left;"> Security and Identity</th>
</tr><tr>
<td>Login with Azure Active Directory (AAD)</td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td>
</tr><tr>
<td>Login with Microsoft Account (MSA)</td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td>
</tr><tr>
<td>Next Generation Credentials with PIN unlock</td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td>
</tr><tr>
<td><a href="https://msdn.microsoft.com/windows/hardware/commercialize/manufacture/desktop/secure-boot-overview">Secure boot</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td>
</tr><tr>
<th colspan="3" style="text-align: left;"> Servicing and Support</th>
</tr><tr>
<td>Automatic system updates as they arrive</td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td>
</tr><tr>
<td><a href="https://technet.microsoft.com/itpro/windows/plan/windows-update-for-business">Windows Update for Business</a></td><td></td><td style="text-align: center;">✔️</td>
</tr><tr>
<td>Long term servicing branch</td><td></td><td style="text-align: center;">✔️</td>
</tr>
</table>



## Enabling commercial features

Commercial features like Microsoft Store for Business, kiosk mode, and enterprise Wi-Fi access are setup by an organization's IT admin. The [Windows IT Center for HoloLens](https://technet.microsoft.com/itpro/hololens/index) provides step by step instructions for device enrollment and installing apps from Microsoft Store for Business.

## See also
* [IT Pro Guide for HoloLens](https://technet.microsoft.com/itpro/hololens/index)
* [Kiosk mode](using-the-windows-device-portal.md#kiosk-mode)
* [Supported CSPs in Windows Holographic for enterprise](https://msdn.microsoft.com/library/windows/hardware/dn920025(v=vs.85).aspx#HoloLens)
* [Microsoft Store For Business and line of business applications](https://blogs.technet.microsoft.com/sbucci/2016/04/13/windows-store-for-business-and-line-of-business-applications/)
* [Working with line-of-business apps](https://technet.microsoft.com/itpro/windows/manage/working-with-line-of-business-apps)
