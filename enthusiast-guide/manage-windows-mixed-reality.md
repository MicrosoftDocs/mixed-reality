---
title: Install Windows Mixed Reality in offline environments and WSUS 
description: Learn how to enable Windows Mixed Reality apps in WSUS or block the Windows Mixed Reality portal in enterprises.
ms.reviewer: 
manager: sekerawa
keyboards: ["mr", "mr portal", "mixed reality portal", "mixed reality"]
ms.mktglfcycl: manage
ms.sitesec: library
ms.localizationpriority: medium
author: qianw211
ms.author: qianwen
ms.topic: article
appliesto:
    - Windows 10 and Windows 11
---

# Install Windows Mixed Reality in offline environments and WSUS

[Windows Mixed Reality](https://www.microsoft.com/en-us/mixed-reality/windows-mixed-reality?rtc=1) was introduced in Windows 10 as a [Windows Feature on Demand (FOD)](/windows-hardware/manufacture/desktop/features-on-demand-v2--capabilities). Features on Demand are Windows feature packages that can be added at any time. When a Windows client needs a new feature, it can request the feature package from Windows Update.

Organizations and businesses that operate in offline environments or use [Windows Server Update Services (WSUS)](/windows-server/administration/windows-server-update-services/get-started/windows-server-update-services-wsus) must take action to [enable Windows Mixed Reality](#enable-windows-mixed-reality-in-offline-environments-and-wsus). Alternatively, any organization that wants to prohibit use of Windows Mixed Reality can [block the installation of the Mixed Reality Portal](#block-the-mixed-reality-portal).

## Enable Windows Mixed Reality in offline environments and WSUS

1. [Check your version of Windows.](https://support.microsoft.com/help/13443/windows-which-operating-system)

   >[!NOTE]
   >You must be on at least Windows 10, version 20H2, or newer to run Windows Mixed Reality.

2. The Windows Mixed Reality FOD file is downloaded from Windows Update. To reach Windows Update, select the **Start** button, then select **Settings > Windows Update**. Select **Check for updates** and if updates are available, install them. 

    If access to Windows Update is blocked, you must manually install the Windows Mixed Reality FOD.

    1. Download the FOD .CAB file that matches the version of Windows you are currently running:

        - [Windows 11, version 22H2](https://software-static.download.prss.microsoft.com/dbazure/988969d5-f34g-4e03-ac9d-1f9786c66749/Microsoft-Windows-Holographic-Desktop-FOD-Package~31bf3856ad364e35~amd64~~.cab)
        - [Windows 11, version 21H2](https://software-download.microsoft.com/download/sg/Microsoft-Windows-Holographic-Desktop-FOD-Package~31bf3856ad364e35~amd_64~~.cab)
        - [Windows 10, Version 20H2](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsoftware-static.download.prss.microsoft.com%2Fpr%2Fdownload%2F6cf73b63%2FMicrosoft-Windows-Holographic-Desktop-FOD-Package~31bf3856ad364e35~amd64~~.cab&data=05%7C01%7Cqianwen%40microsoft.com%7C0be4ebb9d4cc44c4b14f08da851bb7e4%7C72f988bf86f141af91ab2d7cd011db47%7C0%7C0%7C637968651354980121%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=WpKCTq6HFK%2BzYSN6Z0a%2FxqErUeMc7a%2B2gTValRQxJo0%3D&reserved=0)
        - [Windows 10, Version 21H1](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsoftware-static.download.prss.microsoft.com%2Fpr%2Fdownload%2F6cf73b63%2FMicrosoft-Windows-Holographic-Desktop-FOD-Package~31bf3856ad364e35~amd64~~.cab&data=05%7C01%7Cqianwen%40microsoft.com%7C0be4ebb9d4cc44c4b14f08da851bb7e4%7C72f988bf86f141af91ab2d7cd011db47%7C0%7C0%7C637968651354980121%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=WpKCTq6HFK%2BzYSN6Z0a%2FxqErUeMc7a%2B2gTValRQxJo0%3D&reserved=0)
        - [Windows 10, Version 21H2](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsoftware-static.download.prss.microsoft.com%2Fpr%2Fdownload%2F6cf73b63%2FMicrosoft-Windows-Holographic-Desktop-FOD-Package~31bf3856ad364e35~amd64~~.cab&data=05%7C01%7Cqianwen%40microsoft.com%7C0be4ebb9d4cc44c4b14f08da851bb7e4%7C72f988bf86f141af91ab2d7cd011db47%7C0%7C0%7C637968651354980121%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=WpKCTq6HFK%2BzYSN6Z0a%2FxqErUeMc7a%2B2gTValRQxJo0%3D&reserved=0)

    1. Rename the FOD .CAB file to:  **Microsoft-Windows-Holographic-Desktop-FOD-Package~31bf3856ad364e35~amd64~~.cab**.

    1. Open PowerShell and run the following **Dism** command to add the Windows Mixed Reality FOD package to your Windows image.

        ```powershell
        Dism /Online /Add-Package /PackagePath: (FOD package path)
        ```

    1. Open **Settings** > **Windows Update**, then select **Check for updates**.

IT admins can also create [a remote feature file or side-by-side store](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/jj127275(v=ws.11)#create-a-feature-file-or-side-by-side-store) to allow access to the Windows Mixed Reality FOD package.

## Download the latest Windows Mixed Reality device driver 

Like the FOD package, the Windows Mixed Reality device driver is downloaded from Windows Update. To reach Windows Update, select the **Start** button, then select **Settings** > **Windows Update**. Select **Check for updates** and if updates are available, install them. 
 
If access to Windows Update is blocked, you must manually install and update to the latest Windows Mixed Reality device driver: [10.0.19041.2054](https://download.microsoft.com/download/f/7/9/f79c7147-3ec1-4ae8-8d9c-259eb3dec4e5/HoloLensSensors_10.0.19041.2054/HoloLensSensors_10.0.19041.2054.zip).

1. Fully connect your Windows Mixed Reality device to your PC. 

2. Open **Device Manager** by right clicking the **Start** button, then selecting **Device Manager**. 
 
3. Under the category **Mixed reality devices**, locate your device and right click on it, then select **Update driver**. 

4. Select **Browse my computer for driver software**, then select **Let me pick from a list of available drivers on my computer**. 

5. Select **Have Disk** > **Browse...** and then navigate to the path you have the device driver package saved, then click **OK**. 
 
6. The list of device drivers will now be filtered to a single driver. Click **Next** to finish installing the updated device driver. 

## Block the Mixed Reality Portal

You can use the [AppLocker configuration service provider (CSP)](/windows/client-management/mdm/applocker-csp) to block the Mixed Reality Portal software.

In the following example, the **Id** can be any generated GUID and the **Name** can be any name you choose. Note that `BinaryName="*"` allows you to block any app executable in the Mixed Reality Portal package. **Binary/VersionRange**, as shown in the example, will block all versions of the Mixed Reality Portal app.

```xml
<SyncML xmlns="SYNCML:SYNCML1.2">
    <SyncBody>
        <Add>
            <CmdID>$CmdID$</CmdID>
            <Item>
                <Target>
                    <LocURI>./Vendor/MSFT/PolicyManager/My/ApplicationManagement/ApplicationRestrictions</LocURI>
                </Target>
                <Meta>
                    <Format xmlns="syncml:metinf">chr</Format>
                    <Type xmlns="syncml:metinf">text/plain</Type>
                </Meta>
                <Data>
                  <RuleCollection Type="Appx" EnforcementMode="Enabled">
                   <FilePublisherRule Id="a9e18c21-ff8f-43cf-b9fc-db40eed693ba" Name="(Default Rule) All signed packaged apps" Description="Allows members of the Everyone group to run packaged apps that are signed." UserOrGroupSid="S-1-1-0" Action="Allow">
                    <Conditions>
                      <FilePublisherCondition PublisherName="*" ProductName="*" BinaryName="*">
                        <BinaryVersionRange LowSection="0.0.0.0" HighSection="*" />
                      </FilePublisherCondition>
                    </Conditions>
                  </FilePublisherRule>
                  <FilePublisherRule Id="d26da4e7-0b01-484d-a8d3-d5b5341b2d55" Name="Block Mixed Reality Portal" Description="" UserOrGroupSid="S-1-1-0" Action="Deny">
                   <Conditions>
                     <FilePublisherCondition PublisherName="CN=Microsoft Windows, O=Microsoft Corporation, L=Redmond, S=Washington, C=US" ProductName="Microsoft.Windows.HolographicFirstRun" BinaryName="*">
                      <BinaryVersionRange LowSection="*" HighSection="*" />
                      </FilePublisherCondition>
                    </Conditions>
                  </FilePublisherRule>
                 </RuleCollection>>
                </Data>
            </Item>
        </Add>
        <Final/>
    </SyncBody>
</SyncML>
```


## Related topics

* [Features On Demand](/windows-hardware/manufacture/desktop/features-on-demand-v2--capabilities)
* [Get started with Windows Server Update Services (WSUS)](/windows-server/administration/windows-server-update-services/get-started/windows-server-update-services-wsus)
* [AppLocker CSP - Windows Client Management](/windows/client-management/mdm/applocker-csp)

 