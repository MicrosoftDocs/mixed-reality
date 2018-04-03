---
title: Rendering in DirectX
description: Explains holographic rendering for Windows Mixed Reality.
author: MikeRiches
ms.author: mriches
ms.date: 03/21/2018
ms.topic: article
keywords: Windows Mixed Reality, holograms, rendering, 3D graphics, HolographicFrame, render loop, update loop, walkthrough, sample code
---



# Rendering in DirectX

Windows Mixed Reality is built on DirectX to produce rich, 3D graphical experiences for users. The rendering abstraction sits just above DirectX and lets an app reason about the position and orientation of one or more observers of a holographic scene, as predicted by the system. The developer can then locate their holograms relative to each camera, letting the app render these holograms in various spatial coordinate systems as the user moves around.

## Update for the current frame

To update the application state for holograms, once per frame the app will:
* Get a [HolographicFrame](https://msdn.microsoft.com/en-us/library/windows/apps/windows.graphics.holographic.holographicframe.aspx) from the display management system.
* Update the scene with the current prediction of where the camera view will be when render is completed. Note, there can be more than one camera for the holographic scene.

To render to holographic camera views, once per frame the app will:
* For each camera, render the scene for the current frame, using the camera view and projection matrices from the system.

### Create a new holographic frame and get its prediction

The [HolographicFrame](https://msdn.microsoft.com/en-us/library/windows/apps/windows.graphics.holographic.holographicframe.aspx) has information that the app needs in order to update and render the current frame. The app begins each new frame by calling the **CreateNextFrame** method. When this method is called, predictions are made using the latest sensor data available, and encapsulated in **CurrentPrediction** object.

A new frame object must be used for each rendered frame as it is only valid for an instant in time. The **CurrentPrediction** property contains information such as the camera position. The information is extrapolated to the exact moment in time when the frame is expected to be visible to the user.

The following code is excerpted from the AppMain::Update() method: 

```cpp
HolographicFrame^ holographicFrame = m_holographicSpace->CreateNextFrame();

// Get a prediction of where holographic cameras will be when this frame is presented.
HolographicFramePrediction^ prediction = holographicFrame->CurrentPrediction;
```

### Process camera updates

Back buffers can change from frame to frame. Your app needs to validate the back buffer for each camera, and release and recreate resource views and depth buffers as needed. Notice that the set of poses in the prediction is the authoritative list of cameras being used in the current frame. Usually, you use this list to iterate on the set of cameras.


From **AppMain::Update**

```
m_deviceResources->EnsureCameraResources(holographicFrame, prediction);
```


From **DeviceResources::EnsureCameraResources**

```
for (HolographicCameraPose^ pose : prediction->CameraPoses)
{
    HolographicCameraRenderingParameters^ renderingParameters = frame->GetRenderingParameters(pose);
    CameraResources* pCameraResources = cameraResourceMap[pose->HolographicCamera->Id].get();
    pCameraResources->CreateResourcesForBackBuffer(this, renderingParameters);
}
```

### Get the coordinate system to use as a basis for rendering

Windows Mixed Reality uses a coordinate system from the attached reference frame that's associated with the current frame to render. Later, this coordinate system is used for creating the stereo view matrices when rendering the sample content.


From **AppMain::Update**

```
SpatialCoordinateSystem^ currentCoordinateSystem = m_referenceFrame->CoordinateSystem;
```

### Process gaze and gesture input

[Gaze](gaze.md) and [gesture](gestures.md) input are not time-based and thus do not have to update in the **StepTimer** function. However [this input](gaze,-gestures,-and-motion-controllers-in-directx.md) is something that the app needs to look at each frame.

### Process time-based updates

Any real-time rendering app will need some way to process time-based updates; we provide a way to do this in the Windows Holographic app template via a **StepTimer** implementation. This is similar to the StepTimer provided in the DirectX 11 UWP app template, so if you already have looked at that template you should be on familiar ground. This StepTimer sample helper class is able to provide fixed time-step updates, as well as variable time-step updates, and the default mode is variable time steps.

In the case of holographic rendering, we've specifically chosen not to put too much into the timer function. This is because you can configure it to be a fixed time step, in which case it might get called more than once per frame – or not at all, for some frames – and our holographic data updates should happen once per frame.


From **AppMain::Update**

```
m_timer.Tick([&] ()
{
    m_spinningCubeRenderer->Update(m_timer);
});
```

### Position and rotate holograms in your coordinate system

If you are operating in a single coordinate system, as the template does with the **SpatialStationaryReferenceFrame**, this process isn't different from what you're used to in 3D graphics. Here, we rotate the cube and set the model matrix relative to the position in the stationary coordinate system.


From **SpinningCubeRenderer::Update**

```
// Rotate the cube.
// Convert degrees to radians, then convert seconds to rotation angle.
const float    radiansPerSecond = XMConvertToRadians(m_degreesPerSecond);
const double   totalRotation    = timer.GetTotalSeconds() * radiansPerSecond;
const float    radians          = static_cast<float>(fmod(totalRotation, XM_2PI));
const XMMATRIX modelRotation    = XMMatrixRotationY(-radians);
    
// Position the cube.
const XMMATRIX modelTranslation = XMMatrixTranslationFromVector(XMLoadFloat3(&m_position));
    
// Multiply to get the transform matrix.
// Note that this transform does not enforce a particular coordinate system. The calling
// class is responsible for rendering this content in a consistent manner.
const XMMATRIX modelTransform   = XMMatrixMultiply(modelRotation, modelTranslation);
    
// The view and projection matrices are provided by the system; they are associated
// with holographic cameras, and updated on a per-camera basis.
// Here, we provide the model transform for the sample hologram. The model transform
// matrix is transposed to prepare it for the shader.
XMStoreFloat4x4(&m_modelConstantBufferData.model, XMMatrixTranspose(modelTransform));
```

**Note about advanced scenarios:** The spinning cube is a very simple example of how to position a hologram within a single reference frame. It's also possible to [use multiple SpatialCoordinateSystems](coordinate-systems-in-directx.md) in the same rendered frame, at the same time.

### Update constant buffer data

Model transforms for content are updated as usual. By now, you will have computed valid transforms for the coordinate system you'll be rendering in.


From **SpinningCubeRenderer::Update**

```
// Update the model transform buffer for the hologram.
context->UpdateSubresource(
    m_modelConstantBuffer.Get(),
    0,
    nullptr,
    &m_modelConstantBufferData,
    0,
    0);
```

What about view and projection transforms? For best results, we want to wait until we're almost ready for our draw calls before we get these.

### Set the focus point for image stabilization

To keep holograms where a developer or a user puts them in the world, Windows Mixed Reality includes features for [image stabilization](hologram-stability.md). Image stabilization uses reduced-latency rendering to ensure the best holographic experiences for users; a focus point may be specified to enhance image stabilization even further, or a depth buffer may be provided to compute optimized image stabilization in real time.

For best results, your app should provide a depth buffer using the [CommitDirect3D11DepthBuffer](https://msdn.microsoft.com/en-us/library/windows/apps/windows.graphics.holographic.holographicframe.aspx) API. Windows Mixed Reality can then use geometry information from the depth buffer to optimize image stabilization in real time. In the following sample code, we modify the Render method from the Windows Mixed Reality app template to commit the depth buffer. Note that this also required adding an accessor to the CameraResources class, so that we could acquire the depth buffer texture resource for handoff to the API.


Code for **CommitDirect3D11DepthBuffer example**

```
// Up-to-date frame predictions enhance the effectiveness of image stablization and
// allow more accurate positioning of holograms.
holographicFrame->UpdateCurrentPrediction();
HolographicFramePrediction^ prediction = holographicFrame->CurrentPrediction;

for (auto cameraPose : prediction->CameraPoses)
{
    // This represents the device-based resources for a HolographicCamera.
    DX::CameraResources* pCameraResources = cameraResourceMap[cameraPose->HolographicCamera->Id].get();

    // Get the device context.
    const auto context = m_deviceResources->GetD3DDeviceContext();
    const auto depthStencilView = pCameraResources->GetDepthStencilView();

    // Set render targets to the current holographic camera.
    ID3D11RenderTargetView *const targets[1] = { pCameraResources->GetBackBufferRenderTargetView() };
    context->OMSetRenderTargets(1, targets, depthStencilView);

    // Clear the back buffer and depth stencil view.
    context->ClearRenderTargetView(targets[0], DirectX::Colors::Transparent);
    context->ClearDepthStencilView(depthStencilView, D3D11_CLEAR_DEPTH | D3D11_CLEAR_STENCIL, 1.0f, 0);

    // The view and projection matrices for each holographic camera will change
    // every frame. This function refreshes the data in the constant buffer for
    // the holographic camera indicated by cameraPose.
    SpatialCoordinateSystem^ currentCoordinateSystem = m_spatialStageManager->GetCoordinateSystemForCurrentStage();
    if (currentCoordinateSystem != nullptr)
    {
        pCameraResources->UpdateViewProjectionBuffer(m_deviceResources, cameraPose, currentCoordinateSystem);
    }

    // Attach the view/projection constant buffer for this camera to the graphics pipeline.
    bool cameraActive = pCameraResources->AttachViewProjectionBuffer(m_deviceResources);

    // Only render world-locked content when positional tracking is active.
    if (cameraActive)
    {
        // Draw the sample hologram.
        m_sceneController->Render();

        // We complete the frame by using the depth buffer to optimize image stabilization.
        ComPtr<ID3D11Texture2D> depthBuffer = cameraResourceMap.at(cameraPose->HolographicCamera->Id)->GetDepthBufferTexture2D();

        // The depth buffer might be stereo, so we take the first subresource.
        // This should also work for mono cameras.
        ComPtr<IDXGIResource1> depthStencilResource;
        HRESULT hr = depthBuffer.As(&depthStencilResource);
        ComPtr<IDXGISurface2> depthDxgiSurface;
        if (SUCCEEDED(hr))
        {
            hr = depthStencilResource->CreateSubresourceSurface(0, &depthDxgiSurface);
        }

        if (SUCCEEDED(hr))
        {
            IDirect3DSurface^ depthD3DSurface = CreateDirect3DSurface(depthDxgiSurface.Get());
            auto renderingParameters = holographicFrame->GetRenderingParameters(cameraPose);
            try
            {
                // Provide the depth buffer.
                renderingParameters->CommitDirect3D11DepthBuffer(depthD3DSurface);
            }
            catch (Platform::InvalidArgumentException^ ex)
            {
                OutputDebugStringA("Unsupported depth buffer format, invalid properties, or incorrect D3D device.\n");
            }
        }
    }
}
```

>[!NOTE]
>Windows will process your depth texture on the GPU, so it must be possible to use your depth buffer as a shader resource. The ID3D11Texture2D that you create should be in a typeless format and it should be bound as a shader resource view. Here is an example of how to create a depth texture that can be committed for image stabilization.


Code for **Depth buffer resource creation for CommitDirect3D11DepthBuffer**

```
// Create a depth stencil view for use with 3D rendering if needed.
CD3D11_TEXTURE2D_DESC depthStencilDesc(
    DXGI_FORMAT_R16_TYPELESS,
    static_cast<UINT>(m_d3dRenderTargetSize.Width),
    static_cast<UINT>(m_d3dRenderTargetSize.Height),
    m_isStereo ? 2 : 1, // Create two textures when rendering in stereo.
    1, // Use a single mipmap level.
    D3D11_BIND_DEPTH_STENCIL | D3D11_BIND_SHADER_RESOURCE);

DX::ThrowIfFailed(
    device->CreateTexture2D(
        &depthStencilDesc,
        nullptr,
        &m_d3dDepthBuffer));

CD3D11_DEPTH_STENCIL_VIEW_DESC depthStencilViewDesc(
    m_isStereo ? D3D11_DSV_DIMENSION_TEXTURE2DARRAY : D3D11_DSV_DIMENSION_TEXTURE2D,
    DXGI_FORMAT_D16_UNORM);
DX::ThrowIfFailed(
    device->CreateDepthStencilView(
       m_d3dDepthBuffer.Get(),
       &depthStencilViewDesc,
       &m_d3dDepthStencilView));
```

If running on a device such as HoloLens that does not yet support CommitDirect3D11DepthBuffer, your app can also set a manual focus point for image stabilization itself. In the Windows Mixed Reality app template, we check to see if the CommitDirect3D11DepthBuffer method is unavailable, and if so we set the focus point manually to the center of the spinning cube. Note that the focus point (or depth buffer) is provided separately for each camera.


Code for **HoloLens image stabilization (AppMain::Update)**

```
if (!m_canCommitDirect3D11DepthBuffer)
{
    // On versions of the platform that do not support the CommitDirect3D11DepthBuffer API, we can control
    // image stabilization by setting a focus point with optional plane normal and velocity.
    for (auto cameraPose : prediction->CameraPoses)
    {
        // The HolographicCameraRenderingParameters class provides access to set
        // the image stabilization parameters.
        HolographicCameraRenderingParameters^ renderingParameters = holographicFrame->GetRenderingParameters(cameraPose);
        
        // SetFocusPoint informs the system about a specific point in your scene to
        // prioritize for image stabilization. The focus point is set independently
        // for each holographic camera.
        // You should set the focus point near the content that the user is looking at.
        // In this example, we put the focus point at the center of the sample hologram,
        // since that is the only hologram available for the user to focus on.
        // You can also set the relative velocity and facing of that content; the sample
        // hologram is at a fixed point so we only need to indicate its position.
        renderingParameters->SetFocusPoint(
            currentCoordinateSystem,
            m_spinningCubeRenderer->GetPosition()
        );
    }
}
```

When setting a manual focus point on HoloLens, you can also define the image plane by specifying a normal. In this case, the plane passes through the focus point and is perpendicular to the normal you provide. You can also define a velocity for your focus plane to better stabilize moving holograms. For example, [tag-along hologram](https://github.com/Microsoft/Windows-universal-samples/tree/v3.0.23/Samples/HolographicTagAlong) sample sets the velocity of the hologram as it follows you around:


Code for **Focus point for a tag-along HoloLens hologram**

```
if (!m_canCommitDirect3D11DepthBuffer)
{
    // On versions of the platform that do not support the CommitDirect3D11DepthBuffer API, we can control
    // image stabilization by setting a focus point with optional plane normal and velocity.
    for (auto cameraPose : prediction->CameraPoses)
    {
        // The HolographicCameraRenderingParameters class provides access to set
        // the image stabilization parameters.
        HolographicCameraRenderingParameters^ renderingParameters = holographicFrame->GetRenderingParameters(cameraPose);
        
        // SetFocusPoint informs the system about a specific point in your scene to
        // prioritize for image stabilization. The focus point is set independently
        // for each holographic camera.
        // In this example, we set position, normal, and velocity for a tag-along quad.
        float3& focusPointPosition = m_stationaryQuadRenderer->GetPosition();
        float3  focusPointNormal   = -normalize(focusPointPosition);
        float3& focusPointVelocity = m_stationaryQuadRenderer->GetVelocity();
        renderingParameters->SetFocusPoint(
            currentCoordinateSystem,
            focusPointPosition,
            focusPointNormal,
            focusPointVelocity
            );
    }
}
```

As the hologram moves around the user, image stabilization takes into account the relative velocity, avoiding issues such as color separation even though the hologram and the user are both moving at the same time.

## Render the current frame

Rendering on Windows Mixed Reality is not much different from rendering on a 2D mono display, but there are some differences you need to be aware of:
* Holographic frame predictions are important. The closer the prediction is to when your frame is presented, the better your holograms will look.
* Windows Mixed Reality controls the camera views. You need to render to each one because the holographic frame will be presenting them for you later.
* Stereo rendering is recommended to be accomplished using instanced drawing to a render target array. The holographic app template uses the recommended approach of instanced drawing to a render target array, which uses a render target view onto a **Texture2DArray**.
* If you want to render without using stereo instancing, you will need to create two non-array RenderTargetViews (one for each eye) that each reference one of the two slices in the **Texture2DArray** provided to the app from the system. This is not recommended, as it is typically significantly slower than using instancing.

### Get an updated HolographicFrame prediction

Updating the frame prediction enhances the effectiveness of image stabilization and allows for more accurate positioning of holograms due to the shorter time between the prediction and when the frame is visible to the user. Ideally update your frame prediction just before rendering.

```
holographicFrame->UpdateCurrentPrediction();
HolographicFramePrediction^ prediction = holographicFrame->CurrentPrediction;
```

### Render to each camera

Loop on the set of camera poses in the prediction, and render to each camera in this set.

**Set up your rendering pass**

Windows Mixed Reality uses stereoscopic rendering to enhance the illusion of depth and to render stereoscopically, so both the left and the right display are active. With stereoscopic rendering there is an offset between the two displays, which the brain can reconcile as actual depth. This section covers stereoscopic rendering using [instancing](performance-recommendations-for-hololens-apps.md), using code from the Windows Holographic app template.

Each camera has its own render target (back buffer), and view and projection matrices, into the holographic space. Your app will need to create any other camera-based resources - such as the depth buffer - on a per-camera basis. In the Windows Holographic app template, we provide a helper class to bundle these resources together in DX::CameraResources. Start by setting up the render target views:


From **AppMain::Render**

```
// This represents the device-based resources for a HolographicCamera.
DX::CameraResources* pCameraResources = cameraResourceMap[cameraPose->HolographicCamera->Id].get();
 
// Get the device context.
const auto context = m_deviceResources->GetD3DDeviceContext();
const auto depthStencilView = pCameraResources->GetDepthStencilView();
 
// Set render targets to the current holographic camera.
ID3D11RenderTargetView *const targets[1] = { pCameraResources->GetBackBufferRenderTargetView() };
context->OMSetRenderTargets(1, targets, depthStencilView);
 
// Clear the back buffer and depth stencil view.
context->ClearRenderTargetView(targets[0], DirectX::Colors::Transparent);
context->ClearDepthStencilView(depthStencilView, D3D11_CLEAR_DEPTH | D3D11_CLEAR_STENCIL, 1.0f, 0);
```

**Use the prediction to get the view and projection matrices for the camera**

The view and projection matrices for each holographic camera will change with every frame. Refresh the data in the constant buffer for each holographic camera. Do this after you updated the prediction, and before you make any draw calls for that camera.


From **AppMain::Render**

```
pCameraResources->UpdateViewProjectionBuffer(m_deviceResources, cameraPose, m_referenceFrame->CoordinateSystem); 
    
// Attach the view/projection constant buffer for this camera to the graphics pipeline.
bool cameraActive = pCameraResources->AttachViewProjectionBuffer(m_deviceResources);
```

Here, we show how the matrices are acquired from the camera pose. During this process we also obtain the current viewport for the camera. Note how we provide a coordinate system: this is the same coordinate system we used to understand gaze, and it's the same one we used to position the spinning cube.


From **CameraResources::UpdateViewProjectionBuffer**

```
// The system changes the viewport on a per-frame basis for system optimizations.
m_d3dViewport = CD3D11_VIEWPORT(
    cameraPose->Viewport.Left,
    cameraPose->Viewport.Top,
    cameraPose->Viewport.Width,
    cameraPose->Viewport.Height
    );
    
// The projection transform for each frame is provided by the HolographicCameraPose.
HolographicStereoTransform cameraProjectionTransform = cameraPose->ProjectionTransform;
    
// Get a container object with the view and projection matrices for the given
// pose in the given coordinate system.
Platform::IBox<HolographicStereoTransform>^ viewTransformContainer = cameraPose->TryGetViewTransform(coordinateSystem);
    
// If TryGetViewTransform returns a null pointer, that means the pose and coordinate
// system cannot be understood relative to one another; content cannot be rendered
// in this coordinate system for the duration of the current frame.
// This usually means that positional tracking is not active for the current frame, in
// which case it is possible to use a SpatialLocatorAttachedFrameOfReference to render
// content that is not world-locked instead.
DX::ViewProjectionConstantBuffer viewProjectionConstantBufferData;
bool viewTransformAcquired = viewTransformContainer != nullptr;
if (viewTransformAcquired)
{
    // Otherwise, the set of view transforms can be retrieved.
    HolographicStereoTransform viewCoordinateSystemTransform = viewTransformContainer->Value;
        
    // Update the view matrices. Holographic cameras (such as Microsoft HoloLens) are
    // constantly moving relative to the world. The view matrices need to be updated
    // every frame.
    XMStoreFloat4x4(
        &viewProjectionConstantBufferData.viewProjection[0],
        XMMatrixTranspose(XMLoadFloat4x4(&viewCoordinateSystemTransform.Left) * XMLoadFloat4x4(&cameraProjectionTransform.Left))
        );
    XMStoreFloat4x4(
        &viewProjectionConstantBufferData.viewProjection[1],
        XMMatrixTranspose(XMLoadFloat4x4(&viewCoordinateSystemTransform.Right) * XMLoadFloat4x4(&cameraProjectionTransform.Right))
        );
}
```

The viewport should be set each frame. Your vertex shader (at least) will generally need access to the view/projection data.


From **CameraResources::AttachViewProjectionBuffer**

```
// Set the viewport for this camera.
context->RSSetViewports(1, &m_d3dViewport);
   
// Send the constant buffer to the vertex shader.
context->VSSetConstantBuffers(
    1,
    1,
    m_viewProjectionConstantBuffer.GetAddressOf()
    );
```

**Render to the camera back buffer**

It's a good idea to check that **TryGetViewTransform** succeeded before trying to use the view/projection data, because if the coordinate system is not locatable (e.g., tracking was interrupted) your app cannot render with it for that frame. The template only calls **Render** on the spinning cube if the **CameraResources** class indicates a successful update.


From **AppMain::Render**

```
if (cameraActive)
{
    // Draw the sample hologram.
    m_spinningCubeRenderer->Render();
}
```

**Draw holographic content**

The Windows Holographic app template renders content in stereo by using the recommended technique of drawing instanced geometry to a Texture2DArray of size 2. Let's look at the instancing part of this, and how it works on Windows Mixed Reality.


From **SpinningCubeRenderer::Render**

```
// Draw the objects.
context->DrawIndexedInstanced(
    m_indexCount,   // Index count per instance.
    2,              // Instance count.
    0,              // Start index location.
    0,              // Base vertex location.
    0               // Start instance location.
    );
```

Each instance accesses a different view/projection matrix from the constant buffer. Here's the constant buffer structure, which is just an array of 2 matrices.


From **VPRTVertexShader.hlsl**

```HLSL
cbuffer ViewProjectionConstantBuffer : register(b1)
{
    float4x4 viewProjection[2];
};
```

The render target array index must be set for each pixel. In the following snippet, output.rtvId is mapped to the **SV_RenderTargetArrayIndex** semantic. Note that this requires support for an optional Direct3D 11.3 feature, which allows the render target array index semantic to be set from any shader stage.


From **VPRTVertexShader.hlsl**

```
// Per-vertex data used as input to the vertex shader.
struct VertexShaderInput
{
    min16float3 pos     : POSITION;
    min16float3 color   : COLOR0;
    uint        instId  : SV_InstanceID;
};
    
// Per-vertex data passed to the geometry shader.
// Note that the render target array index is set here in the vertex shader.
struct VertexShaderOutput
{
    min16float4 pos     : SV_POSITION;
    min16float3 color   : COLOR0;
    uint        rtvId   : SV_RenderTargetArrayIndex; // SV_InstanceID % 2
};
   
// ...
    
int idx = input.instId % 2;
// Set the render target array index.
output.rtvId = idx;
```

If you want to use your existing instanced drawing techniques with this method of drawing to a stereo render target array, all you have to do is draw twice the number of instances you normally have. In the shader, divide **input.instId** by 2 to get the original instance ID, which can be indexed into (for example) a buffer of per-object data: `int actualIdx = input.instId / 2;`

### Important note about rendering stereo content on HoloLens

Windows Mixed Reality supports the ability to set the render target array index from any shader stage; normally, this is a task that could only be done in the geometry shader stage due to the way the semantic is defined for Direct3D 11. Here, we show a complete example of how to set up a rendering pipeline with just the vertex and pixel shader stages set. The shader code is as described above.


From **SpinningCubeRenderer::Render**

```
const auto context = m_deviceResources->GetD3DDeviceContext();

// Each vertex is one instance of the VertexPositionColor struct.
const UINT stride = sizeof(VertexPositionColor);
const UINT offset = 0;
context->IASetVertexBuffers(
    0,
    1,
    m_vertexBuffer.GetAddressOf(),
    &stride,
    &offset
    );
context->IASetIndexBuffer(
    m_indexBuffer.Get(),
    DXGI_FORMAT_R16_UINT, // Each index is one 16-bit unsigned integer (short).
    0
    );
context->IASetPrimitiveTopology(D3D11_PRIMITIVE_TOPOLOGY_TRIANGLELIST);
context->IASetInputLayout(m_inputLayout.Get());

// Attach the vertex shader.
context->VSSetShader(
    m_vertexShader.Get(),
    nullptr,
    0
    );
// Apply the model constant buffer to the vertex shader.
context->VSSetConstantBuffers(
    0,
    1,
    m_modelConstantBuffer.GetAddressOf()
    );

// Attach the pixel shader.
context->PSSetShader(
    m_pixelShader.Get(),
    nullptr,
    0
    );

// Draw the objects.
context->DrawIndexedInstanced(
    m_indexCount,   // Index count per instance.
    2,              // Instance count.
    0,              // Start index location.
    0,              // Base vertex location.
    0               // Start instance location.
    );
```

### Important note about rendering on non-HoloLens devices

Setting the render target array index in the vertex shader requires that the graphics driver supports an optional Direct3D 11.3 feature, which HoloLens does support. Your app may be able to safely implement just that technique for rendering, and all requirements will be met for running on the Microsoft HoloLens.

It may be the case that you want to use the HoloLens emulator as well, which can be a powerful development tool for your holographic app - and support Windows Mixed Reality immersive headset devices that are attached to Windows 10 PCs. Support for the non-HoloLens rendering path - and therefore, for all of Windows Mixed Reality - is also built into the Windows Holographic app template. In the template code, you will find code to enable your holographic app to run on the GPU in your development PC. Here is how the **DeviceResources** class checks for this optional feature support.


From **DeviceResources::CreateDeviceResources**

```
// Check for device support for the optional feature that allows setting the render target array index from the vertex shader stage.
D3D11_FEATURE_DATA_D3D11_OPTIONS3 options;
m_d3dDevice->CheckFeatureSupport(D3D11_FEATURE_D3D11_OPTIONS3, &options, sizeof(options));
if (options.VPAndRTArrayIndexFromAnyShaderFeedingRasterizer)
{
    m_supportsVprt = true;
}
```

To support rendering without this optional feature, your app must use a geometry shader to set the render target array index. This snippet would be added *after* **VSSetConstantBuffers**, and *before* **PSSetShader** in the code example shown in the previous section that explains how to render stereo on HoloLens.


From **SpinningCubeRenderer::Render**

```
if (!m_usingVprtShaders)
{
    // On devices that do not support the D3D11_FEATURE_D3D11_OPTIONS3::
    // VPAndRTArrayIndexFromAnyShaderFeedingRasterizer optional feature,
    // a pass-through geometry shader is used to set the render target 
    // array index.
    context->GSSetShader(
        m_geometryShader.Get(),
        nullptr,
        0
        );
}
```

**HLSL NOTE**: In this case, you must also load a slightly modified vertex shader that passes the render target array index to the geometry shader using an always-allowed shader semantic, such as TEXCOORD0. The geometry shader does not have to do any work; the template geometry shader passes through all data, with the exception of the render target array index, which is used to set the SV_RenderTargetArrayIndex semantic.


App template code for **GeometryShader.hlsl**

```
// Per-vertex data from the vertex shader.
struct GeometryShaderInput
{
    min16float4 pos     : SV_POSITION;
    min16float3 color   : COLOR0;
    uint        instId  : TEXCOORD0;
};
    
// Per-vertex data passed to the rasterizer.
struct GeometryShaderOutput
{
    min16float4 pos     : SV_POSITION;
    min16float3 color   : COLOR0;
    uint        rtvId   : SV_RenderTargetArrayIndex;
};

// This geometry shader is a pass-through that leaves the geometry unmodified 
// and sets the render target array index.
[maxvertexcount(3)]
void main(triangle GeometryShaderInput input[3], inout TriangleStream<GeometryShaderOutput> outStream)
{
    GeometryShaderOutput output;
    [unroll(3)]
    for (int i = 0; i < 3; ++i)
    {
        output.pos   = input[i].pos;
        output.color = input[i].color;
        output.rtvId = input[i].instId;
        outStream.Append(output);
    }
}
```

## Present

### Enable the holographic frame to present the swap chain

With Windows Mixed Reality, the system controls the swap chain. The system then manages presenting frames to each holographic camera to ensure a high quality user experience. It also provides a viewport update each frame, for each camera, to optimize aspects of the system such as image stabilization or Mixed Reality Capture. So, a holographic app using DirectX doesn't call **Present** on a DXGI swap chain. Instead, you use the [HolographicFrame](https://msdn.microsoft.com/en-us/library/windows/apps/windows.graphics.holographic.holographicframe.aspx) class to present all swapchains for a frame once you're done drawing it.


From **DeviceResources::Present**

```
HolographicFramePresentResult presentResult = frame->PresentUsingCurrentPrediction();
HolographicFramePrediction^ prediction = frame->CurrentPrediction;
```

By default, this API waits for the frame to finish before it returns. Holographic apps should wait for the previous frame to finish before starting work on a new frame, because this reduces latency and allows for better results from holographic frame predictions. This isn't a hard rule, and if you have frames that take longer than one screen refresh to render you can disable this wait by passing the HolographicFramePresentWaitBehavior parameter to [PresentUsingCurrentPrediction](https://msdn.microsoft.com/en-us/library/windows/apps/mt592836.aspx). In this case, you would likely use an asynchronous rendering thread in order to maintain a continuous load on the GPU. Note that the refresh rate of the HoloLens device is 60hz, where one frame has a duration of approximately 16 ms. Immersive headset devices can range from 60hz to 90hz; when refreshing the display at 90 hz, each frame will have a duration of approximately 11 ms.

In the template, we also discard the render target views for each camera after the frame is presented.


From **DeviceResources::Present**

```
UseHolographicCameraResources<void>([this, prediction](std::map<UINT32, std::unique_ptr<CameraResources>>& cameraResourceMap)
{
    for (auto cameraPose : prediction->CameraPoses)
    {
        DX::CameraResources* pCameraResources = cameraResourceMap[cameraPose->HolographicCamera->Id].get();
        m_d3dContext->DiscardView(pCameraResources->GetBackBufferRenderTargetView());
        m_d3dContext->DiscardView(pCameraResources->GetDepthStencilView());
    }
});
```

### Handle DeviceLost scenarios in cooperation with the HolographicFrame

DirectX 11 apps would typically want to check the HRESULT returned by the DXGI swap chain's **Present** function to find out if there was a **DeviceLost** error. The [HolographicFrame](https://msdn.microsoft.com/en-us/library/windows/apps/windows.graphics.holographic.holographicframe.aspx) class handles this for you. Inspect the [HolographicFramePresentResult](https://msdn.microsoft.com/en-us/library/windows/apps/windows.graphics.holographic.holographicframepresentresult.aspx) it returns to find out if you need to release and recreate the Direct3D device and device-based resources.

```
// The PresentUsingCurrentPrediction API will detect when the graphics device
// changes or becomes invalid. When this happens, it is considered a Direct3D
// device lost scenario.
if (presentResult == HolographicFramePresentResult::DeviceRemoved)
{
    // The Direct3D device, context, and resources should be recreated.
    HandleDeviceLost();
}
```

Note that if the Direct3D device was lost, and you did recreate it, you have to tell the [HolographicSpace](https://msdn.microsoft.com/en-us/library/windows/apps/windows.graphics.holographic.holographicspace.aspx) to start using the new device. The swap chain will be recreated for this device.


From **DeviceResources::InitializeUsingHolographicSpace**

```
m_holographicSpace->SetDirect3D11Device(m_d3dInteropDevice);
```

Once your frame is presented, you can return back to the main program loop and allow it to continue to the next frame.

## Hybrid graphics PCs and mixed reality applications

Windows 10 Creators Update PCs may be configured with **both** discrete and integrated GPUs. With these types of computers, Windows will choose the adapter the headset is connected to. Applications must ensure the DirectX device it creates uses the same adapter.

By default, most sample code demonstrates creating a DirectX device using the default hardware adapter, which on a hybrid system may not be the same as the one used for the headset.

To work around any issues this may cause, use the [Holographic​Adapter​Id](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographicadapterid) from either [HolographicSpace](https://docs.microsoft.com/en-us/uwp/api/Windows.Graphics.Holographic.HolographicSpace)->PrimaryAdapterId property or [HolographicDisplay](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographicdisplay)->AdapterId. This adapterId can then be used to enumerate the DXGIAdapters


Code for **GetAdapterFromId Helper Function**

```
IDXGIAdapter* GetAdapterFromId(Windows::Graphics::Holographic::HolographicAdapterId adapterId)
{
    ComPtr<IDXGIFactory1> spDXGIFactory;
    HRESULT hr = CreateDXGIFactory1(__uuidof(IDXGIFactory1), (void**)&spDXGIFactory);
    if (FAILED(hr))
        return nullptr;

    ComPtr<IDXGIAdapter> spDXGIAdapter;
    for (UINT i = 0;
        spDXGIFactory->EnumAdapters(i, &spDXGIAdapter) != DXGI_ERROR_NOT_FOUND;
        ++i)
    {
        DXGI_ADAPTER_DESC desc;
        if (FAILED(spDXGIAdapter->GetDesc(&desc)))
        {
            spDXGIAdapter.Reset();
            continue;
        }

        if (desc.AdapterLuid.HighPart == adapterId.HighPart &&
            desc.AdapterLuid.LowPart == adapterId.LowPart)
        {
            break;
        }
    }

    return spDXGIAdapter.Detach();
}
```


Code to **update DeviceResources::CreateDeviceResources to use IDXGIAdapter**

```
// get adapter from HolographicDisplay
// assumes Windows::Graphics::Holographic::HolographicDisplay^ m_holographicDisplay; was previously initialized
auto adapterId = m_holographicDisplay->AdapterId;

// use helper function to get the DXGIAdapter that matches
ComPtr<IDXGIAdapter> spDXGIAdapter = GetAdapterFromId(adapterId);

// if adapter is null, revert to previous behavior
D3D_DRIVER_TYPE driverType = (nullptr != spDXGIAdapter) ? D3D_DRIVER_TYPE_UNKNOWN : D3D_DRIVER_TYPE_HARDWARE;

// Create the Direct3D 11 API device object and a corresponding context.
ComPtr<ID3D11Device> device;
ComPtr<ID3D11DeviceContext> context;
HRESULT hr = D3D11CreateDevice(
    spDXGIAdapter.Get(),
    driverType,
    0,				// Should be 0 unless the driver is D3D_DRIVER_TYPE_SOFTWARE.
    creationFlags,		// Set debug and Direct2D compatibility flags.
    featureLevels,		// List of feature levels this app can support.
    ARRAYSIZE(featureLevels),	// Size of the list above.
    D3D11_SDK_VERSION,		// Always set this to D3D11_SDK_VERSION for Windows Store apps.
    &device,			// Returns the Direct3D device created.
    &m_d3dFeatureLevel,		// Returns feature level of device created.
    &context			// Returns the device immediate context.
);
```

**Hybrid graphics and Media Foundation** Using Media Foundation on hybrid systems may cause issues where video will not render or video texture is corrupt. This can occur because Media Foundation is defaulting to a system behavior as mentioned above. In some scenarios, creating a separate ID3D11Device is required to support multi-threading and the correct creation flags are set.

When initializing the ID3D11Device, D3D11_CREATE_DEVICE_VIDEO_SUPPORT flag must be defined as part of the D3D11_CREATE_DEVICE_FLAG. Once the device and context is created, call [SetMultithreadProtected](https://msdn.microsoft.com/en-us/library/windows/desktop/bb173820(v=vs.85).aspx) to enable multithreading. To associate the device with the [IMFDXGIDeviceManager](https://msdn.microsoft.com/en-us/library/windows/desktop/hh447906(v=vs.85).aspx), use the [IMFDXGIDeviceManager::ResetDevice](https://msdn.microsoft.com/en-us/library/windows/desktop/hh447911(v=vs.85).aspx) function.


Code to **associate a ID3D11Device with IMFDXGIDeviceManager**

```
// create dx device for media pipeline
ComPtr<ID3D11Device> spMediaDevice;
if (FAILED(CreateMediaDevice(spAdapter.Get(), &spMediaDevice))) // see above, also make sure to enable 
    return;                                                     // D3D11_CREATE_DEVICE_VIDEO_SUPPORT | D3D11_CREATE_DEVICE_BGRA_SUPPORT;

... 

// Turn multithreading on 
ComPtr<ID3D10Multithread> spMultithread;
if (SUCCEEDED(spContext.As(&spMultithread)))
{
    spMultithread->SetMultithreadProtected(TRUE);
}

...

// lock the shared dxgi device manager
// call MFUnlockDXGIDeviceManager when no longer needed
UINT uiResetToken;
ComPtr<IMFDXGIDeviceManager> spDeviceManager;
hr = MFLockDXGIDeviceManager(&uiResetToken, &spDeviceManager);
if (FAILED(hr))
    return hr;

// associtate the device with the manager
hr = spDeviceManager->ResetDevice(spMediaDevice.Get(), uiResetToken);
if (FAILED(hr))
    return hr;
```

## See also
* [Coordinate systems in DirectX](coordinate-systems-in-directx.md)
* [Using the HoloLens emulator](using-the-hololens-emulator.md)
* [D3D11_FEATURE_DATA_D3D11_OPTIONS3 structure](https://msdn.microsoft.com/en-us/library/windows/desktop/dn933226.aspx)
