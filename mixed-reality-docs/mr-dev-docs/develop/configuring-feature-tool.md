# Configuring the Mixed Reality Feature Tool

![Settings](images/FeatureToolSettings.png)

## Download settings

### Overwrite existing package files

Enabling this setting causes package files to be downloaded every time they are acquired. To reduce network bandwidth usage, it is recommended to leave this option disabled.

By default, previously acquired package files are not redownloaded.

### Package cache

This setting indicates the location to which feature packages will be downloaded.

> [!NOTE]
> This setting is read-only in this release. Future releases may make this setting configurable.

## Feature settings

### Include preview releases

By default, preview releases are not shown in the Mixed Reality Feature Tool. Enable this setting to acquire preview releases.

> [!NOTE]
> A preview release is defined as containing the "-preview" designation in the package version.

## Import settings

### Replace existing package files

To reduce the impact of updating packages, by default, the Mixed Reality Feature Tool removes previous copies of the packages being imported. To retain all versions, uncheck this setting.

### Project relative import path

The folder path, within the project, in which feature packages will be copied on import. For example, if the project folder is `C:\GalaxyExplorer`, the fully qualified import path will be `C:\GalaxyExplorer\Packages\MixedReality`.

> [!NOTE]
> The "Package cache" and "Project relative import path are read-only in this release.

## See also

- [Welcome to the Mixed Reality Feature Tool](WelcomeToTheMixedRealityFeatureTool.md)