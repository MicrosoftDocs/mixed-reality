# [4.25](#tab/4.25)

The HoloLens has a Photo/Video (PV) Camera that is used for both Mixed Reality Capture (MRC) and can be used by an app to access real-world visuals. 

> [!IMPORTANT]
> The PV Camera isn't supported with Holographic Remoting, but it's possible to use a webcam attached to your PC to simulate the HoloLens PV Camera functionality.

## Render from the PV Camera for MRC

> [!NOTE]
> This requires **Unreal Engine 4.25** or newer.

The system, and custom MRC recorders, create mixed reality captures by combining the PV Camera with holograms rendered by the immersive app.

By default, mixed reality capture uses the right eye's holographic output. If an immersive app chooses to [render from the PV Camera](../../platform-capabilities-and-apis/mixed-reality-capture-for-developers.md#render-from-the-pv-camera-opt-in) then that will be used instead. This improves the mapping between the real world and the holograms in the MRC video.

To opt-in to rendering from the PV Camera:

1. Call **SetEnabledMixedRealityCamera** and **ResizeMixedRealityCamera**
    * Use the **Size X** and **Size Y** values to set the video dimensions.

![Camera 3rd](../../platform-capabilities-and-apis/images/unreal-camera-3rd.PNG)

Unreal will then handle requests from MRC to render from the PV Camera's perspective.

> [!NOTE]
> Only when [Mixed Reality Capture](../../../mixed-reality-capture.md) is triggered will the app be asked to render from the photo/video camera's perspective.

## Using the PV Camera

The webcam texture can be retrieved in the game at runtime, but it needs to be enabled in the editor's **Edit > Project Settings**:
1. Go to **Platforms > HoloLens > Capabilities** and check **Webcam**.
    * Use the **StartCameraCapture** function to use the webcam at runtime and the **StopCameraCapture** function to stop recording.

![Camera Start Stop](../images/unreal-camera-startstop.PNG)

## Rendering an image
To render the camera image:
1. Create a dynamic material instance based on a material in the project, which is named **PVCamMat** in the screenshot below.  
2. Set the dynamic material instance to a **Material Instance Dynamic Object Reference** variable.  
3. Set the material of the object in the scene that will render the camera feed to this new dynamic material instance.
    * Start a timer that will be used to bind the camera image to the material.

![Camera Render](../images/unreal-camera-render.PNG)

4. Create a new function for this timer, in this case **MaterialTimer**, and call **GetARCameraImage** to get the texture from the webcam.  
5. If the texture is valid, set a texture parameter in the shader to the image.  Otherwise, start the material timer again.

![Camera Texture from webcam](../images/unreal-camera-texture.PNG)

5. Make sure the material has a parameter matching the name in **SetTextureParameterValue** that's bound to a color entry. Without this, the camera image can't be properly displayed.

![Camera Texture](../images/unreal-camera-material.PNG)

# [4.26](#tab/4.26)

The HoloLens has a PV camera on the visor which can be rendered in the Unreal scene, or used to locate objects in Unreal world space from pixel coordinates in the camera frame. 

## PV Camera Feed Setup

> [!IMPORTANT]
> The camera feed from the HoloLens will only work on device and not over remoting.

- In **Project Settings > HoloLens**, enable the **Webcam** capability:

![Screenshot of the HoloLens project settings with the Webcam property highlighted](../images/unreal-pvc-img-01.png)

- Create a new actor called “CamCapture” and add a plane to render the camera feed:

![Screenshot of the an actor with an added plane](../images/unreal-pvc-img-02.png)

- Add the actor to your scene, create a new material called CamTextureMaterial with a Texture Object Parameter, and a texture sample.  Send the texture’s rgb data to the output emissive color:

![Blueprint of a material and texture sample](../images/unreal-pvc-img-03.png)

## Rendering the PV Camera Feed

- In the CamCapture blueprint, turn the PV Camera on:

![Blueprint of the Toggle ARCapture function with the PV Camera turned on](../images/unreal-pvc-img-04.png)

- Create a dynamic material instance from CamTextureMaterial and assign this material to the actor’s plane:

![Blueprint of the Create Dynamic Material Instance function](../images/unreal-pvc-img-05.png)

- Get the texture from the camera feed and assign it to the dynamic material if it is valid.  If the texture is not valid, start a timer and try again after the timeout:

![Blueprint of camera feed texture assigned to the dynamic material](../images/unreal-pvc-img-06.png)

- Finally, scale the plane by the camera image’s aspect ratio:

![Blueprint of plane scaled relative to the camera images aspect ratio](../images/unreal-pvc-img-07.png)

## Find Camera Positions in World Space

The camera on the HoloLens 2 is offset vertically from the device’s head tracking.  To account for this, a few functions exist to locate the camera in world space.

GetPVCameraToWorldTransform gets the transform in world space of the PVCamera.  This will be positioned on the camera lens:

![Blueprint of the Get PVCamera to World Transform function](../images/unreal-pvc-img-08.png)

GetWorldSpaceRayFromCameraPoint casts a ray from the camera lens into the scene in Unreal world space to find what is on a particular pixel in the camera frame:

![Blueprint of the Get World Space Ray from Camera Point](../images/unreal-pvc-img-09.png)

GetPVCameraIntrinsics returns the camera intrinsic values, which can be used when doing computer vision processing on a camera frame:

![Blueprint of Get PVCamera Intrinsics functions](../images/unreal-pvc-img-10.png)

To find what exists in world space at a particular pixel coordinate, you can use a line trace with the world space ray:

![Blueprint of the world space ray being used to find out what exists in the world space at a particular coordinate](../images/unreal-pvc-img-11.png)

Here we cast a 2-meter ray from the camera lens to the camera-space position ¼ from the top left of the frame.  Then use the hit result to render something where the object exists in world space:

![Blueprint of a 2-meter ray cast from the camera lens to the camera-space position 1/4 from the top left of the frame](../images/unreal-pvc-img-12.png)

When using spatial mapping, this hit position will match the surface that the camera is seeing.

## Rendering the PV Camera Feed in C++

- Create a new C++ actor called CamCapture
- In the project’s build.cs, add “AugmentedReality” to the PublicDependencyModuleNames list:

```cpp
PublicDependencyModuleNames.AddRange(
    new string[] {
        "Core",
        "CoreUObject",
        "Engine",
        "InputCore",
        "AugmentedReality"
});
```

- In CamCapture.h, include ARBlueprintLibrary.h

```cpp
#include "ARBlueprintLibrary.h"
```

- You also need to add local variables for the mesh and material:

```cpp
private:
    UStaticMesh* StaticMesh;
    UStaticMeshComponent* StaticMeshComponent;
    UMaterialInstanceDynamic* DynamicMaterial;
    bool IsTextureParamSet = false;
```

- In CamCapture.cpp, update the constructor to add a static mesh to the scene:

```cpp
ACamCapture::ACamCapture()
{
    PrimaryActorTick.bCanEverTick = true;

    // Load a mesh from the engine to render the camera feed to.
    StaticMesh = LoadObject<UStaticMesh>(nullptr, TEXT("/Engine/EngineMeshes/Cube.Cube"), nullptr, LOAD_None, nullptr);

    // Create a static mesh component to render the static mesh
    StaticMeshComponent = CreateDefaultSubobject<UStaticMeshComponent>(TEXT("CameraPlane"));
    StaticMeshComponent->SetStaticMesh(StaticMesh);

    // Scale and add to the scene
    StaticMeshComponent->SetWorldScale3D(FVector(0.1f, 1, 1));
    this->SetRootComponent(StaticMeshComponent);
}
```

In BeginPlay create a dynamic material instance from the project’s camera material, apply it to the static mesh component, and start the HoloLens camera. 
 
In the editor, right click on the CamTextureMaterial in the content browser and select “Copy Reference” to get the string for CameraMatPath.

```cpp
void ACamCapture::BeginPlay()
{
    Super::BeginPlay();

    // Create a dynamic material instance from the game's camera material.
    // Right-click on a material in the project and select "Copy Reference" to get this string.
    FString CameraMatPath("Material'/Game/Materials/CamTextureMaterial.CamTextureMaterial'");
    UMaterial* BaseMateriall = (UMaterial*)StaticLoadObject(UMaterial::StaticClass(), nullptr, *CameraMatPath, nullptr, LOAD_None, nullptr);
    DynamicMaterial = UMaterialInstanceDynamic::Create(BaseMaterial, this);

    // Use the dynamic material instance when rendering the camera mesh.
    StaticMeshComponent->SetMaterial(0, DynamicMaterial);

    // Start the webcam.
    UARBlueprintLibrary::ToggleARCapture(true, EARCaptureType::Camera);
}
```

In Tick get the texture from the camera, set it to the texture parameter in the CamTextureMaterial material, and scale the static mesh component by the camera frame’s aspect ratio:

```cpp
void ACamCapture::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);

    // Dynamic material instance only needs to be set once.
    if(IsTextureParamSet)
    {
        return;
    }

    // Get the texture from the camera.
    UARTexture* ARTexture = UARBlueprintLibrary::GetARTexture(EARTextureType::CameraImage);
    if(ARTexture != nullptr)
    {
        // Set the shader's texture parameter (named "Param") to the camera image.
        DynamicMaterial->SetTextureParameterValue("Param", ARTexture);
        IsTextureParamSet = true;

        // Get the camera instrincs
        FARCameraIntrinsics Intrinsics;
        UARBlueprintLibrary::GetCameraIntrinsics(Intrinsics);

        // Scale the camera mesh by the aspect ratio.
        float R = (float)Intrinsics.ImageResolution.X / (float)Intrinsics.ImageResolution.Y;
        StaticMeshComponent->SetWorldScale3D(FVector(0.1f, R, 1));
    }
}
```

