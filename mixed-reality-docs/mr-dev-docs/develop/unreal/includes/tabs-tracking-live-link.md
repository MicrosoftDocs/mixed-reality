# [4.25](#tab/425)

Hand poses are exposed to Animation using the [Live Link plugin](https://docs.unrealengine.com/Engine/Animation/LiveLinkPlugin/index.html).

If the Windows Mixed Reality and Live Link plugins are enabled:
1. Select **Window > Live Link** to open the Live Link editor window.
2. Select **Source** and enable **Windows Mixed Reality Hand Tracking Source**

![Live Link Source](../images/unreal/live-link-source.png)

After you enable the source and open an animation asset, expand the **Animation** section in the **Preview Scene** tab too see additional options.

![Live Link Animation](../images/unreal/live-link-animation.png)

The hand animation hierarchy is the same as in `EWMRHandKeypoint`. Animation can be retargeted using **WindowsMixedRealityHandTrackingLiveLinkRemapAsset**:

![Live Link Animation 2](../images/unreal/live-link-animation2.png)

It can also be subclassed in the editor:

![Live Link Remap](../images/unreal/live-link-remap.png)

# [4.26](#tab/426)

Deprecated in Unreal 4.26 and above.