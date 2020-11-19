# [HoloLens](#tab/hololens)

If you have a HoloLens application ready to go, you can proceed to adding [In-app purchases](../distribute-overview.md#integrating-in-app-purchases) or head straight to [Microsoft Store submissions](../distribute-overview.md#submitting-to-the-microsoft-store) section.

# [Windows Mixed Reality](#tab/wmr)

### Designing a 3D app launcher 

The first step to releasing your apps is the creation of a 3D app launcher. 3D app launchers appear as objects in the Windows Mixed Reality home environment that appears whenever a user puts on an immersive headset. These objects are yours to create and customize however you like, but it's recommended that you start with our [design guidance](../3d-app-launcher-design-guidance.md) article to get the hang of good design practices, including scaling, type, color choice, texturing, and above all making it stand out in a virtual environment.

### Modeling and exporting 3D app launchers

Once you're set on the idea for your 3D app launcher, you need to make sure it meets the Microsoft Store requirements, including asset file format, triangle count, texture sizes, animation length, and asset optimization. This process can be highly technical, so we recommend using our [3D model creation](../creating-3d-models-for-use-in-the-windows-mixed-reality-home.md) article to check all the boxes. Assets that don't to meet this authoring specification won't be rendered in the Windows Mixed Reality home.

### Adding 3D app launchers in your apps

After you've ensured that your 3D app launcher meets the Windows Mixed Reality authoring guidelines, it can be used to override the default 2D launcher for your application in the Windows Mixed Reality home environment. The process for integrating a 3D app launcher into your application depends on the type of application you're developing:

* [UWP apps](../implementing-3d-app-launchers.md)
* [Win32 apps](../implementing-3d-app-launchers-win32.md)

### [Optional] Placing 3D models in the Windows Mixed Reality home

As an added bonus, some 2D applications let you place 3D models directly into the Windows Mixed Reality home as decorations or for further inspection in full 3D. The add model protocol lets you to send a 3D model from your website or application to the Windows Mixed Reality home, where it'll persist like 3D app launchers, 2D apps, and holograms. Check out [how to place 3D models in the Windows Mixed Reality home](../enable-placement-of-3d-models-in-the-home.md) to find more details and instructions on how to liven up your own apps.

