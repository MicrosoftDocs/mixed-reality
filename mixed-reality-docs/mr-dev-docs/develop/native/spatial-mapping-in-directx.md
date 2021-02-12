---
title: Spatial mapping in DirectX
description: Learn how to implement spatial mapping in your DirectX app and how to use the spatial mapping sample application in the Universal Windows Platform SDK.
author: mikeriches
ms.author: mriches
ms.date: 08/04/2020
ms.topic: article
keywords: Windows mixed reality, spatial mapping, environment, interaction, directx, winrt, api, sample code, UWP, SDK, walkthrough
---

# Spatial mapping in DirectX

> [!NOTE]
> This article relates to the legacy WinRT native APIs.  For new native app projects, we recommend using the **[OpenXR API](openxr-getting-started.md)**.

This topic describes how to implement [spatial mapping](../../design/spatial-mapping.md) in your DirectX app, including a detailed explanation of the spatial mapping sample application packaged with the Universal Windows Platform SDK.

This topic uses code from the [HolographicSpatialMapping](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/HolographicSpatialMapping) UWP code sample.

>[!NOTE]
>The code snippets in this article currently demonstrate use of C++/CX rather than C++17-compliant C++/WinRT as used in the [C++ holographic project template](creating-a-holographic-directx-project.md).  The concepts are equivalent for a C++/WinRT project, though you will need to translate the code.

## Device support

<table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tr>
        <td><strong>Feature</strong></td>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens (1st gen)</strong></a></td>
        <td><a href="https://docs.microsoft.com/hololens/hololens2-hardware"><strong>HoloLens 2</strong></td>
        <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Spatial mapping</td>
        <td>✔️</td>
        <td>✔️</td>
        <td>❌</td>
    </tr>
</table>

## DirectX development overview

Native application development for spatial mapping uses the APIs in the [Windows.Perception.Spatial](/uwp/api/Windows.Perception.Spatial) namespace. These APIs give you full control of spatial mapping functionality, in the same way that spatial mapping APIs are exposed by [Unity](../unity/spatial-mapping-in-unity.md).

### Perception APIs

The primary types provided for spatial mapping development are as follows:
* [SpatialSurfaceObserver](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceObserver) provides information about surfaces in application-specified regions of space near the user, in the form of SpatialSurfaceInfo objects.
* [SpatialSurfaceInfo](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceInfo) describes a single extant spatial surface, including a unique ID, bounding volume and time of last change. It will provide a SpatialSurfaceMesh asynchronously upon request.
* [SpatialSurfaceMeshOptions](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceMeshOptions) contains parameters used to customize the SpatialSurfaceMesh objects requested from SpatialSurfaceInfo.
* [SpatialSurfaceMesh](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceMesh) represents the mesh data for a single spatial surface. The data for vertex positions, vertex normals, and triangle indices is contained in member SpatialSurfaceMeshBuffer objects.
* [SpatialSurfaceMeshBuffer](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceMeshBuffer) wraps a single type of mesh data.

When developing an application using these APIs, your basic program flow will look like this (as demonstrated in the sample application described below):
- **Set up your SpatialSurfaceObserver**
  - Call [RequestAccessAsync](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceObserver), to ensure that the user has given permission for your application to use the device's spatial mapping capabilities.
  - Instantiate a SpatialSurfaceObserver object.
  - Call [SetBoundingVolumes](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceObserver) to specify the regions of space in which you want information about spatial surfaces. You may modify these regions in the future by calling this function again. Each region is specified using a [SpatialBoundingVolume](/uwp/api/Windows.Perception.Spatial.SpatialBoundingVolume).
  - Register for the [ObservedSurfacesChanged](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceObserver) event, which will fire whenever new information is available about the spatial surfaces in the regions of space you've specified.
- **Process ObservedSurfacesChanged events**
  - In your event handler, call [GetObservedSurfaces](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceObserver) to receive a map of SpatialSurfaceInfo objects. Using this map, you can update your records of which spatial surfaces [exist in the user's environment](../../design/spatial-mapping.md#mesh-caching).
  - For each SpatialSurfaceInfo object, you may query [TryGetBounds](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceInfo) to determine the spatial extents of the surface, expressed in a [spatial coordinate system](../../design/coordinate-systems.md) of your choosing.
  - If you decide to request,  mesh for a spatial surface, call [TryComputeLatestMeshAsync](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceInfo). You may provide options specifying the density of triangles, and the format of the returned mesh data.
- **Receive and process mesh**
  - Each call to TryComputeLatestMeshAsync will asynchronously return one SpatialSurfaceMesh object.
  - From this object, you can access the contained SpatialSurfaceMeshBuffer objects, which gives you access to the triangle indices, vertex positions, and vertex normals of the mesh if you request them. This data will be in a format directly compatible with the [Direct3D 11 APIs](/windows/win32/api/d3d11/nf-d3d11-id3d11device-createbuffer) used for rendering meshes.
  - From here your application can optionally analyze or [process](../../design/spatial-mapping.md#mesh-processing) the mesh data, and use it for [rendering](../../design/spatial-mapping.md#rendering) and physics [raycasting and collision](../../design/spatial-mapping.md#raycasting-and-collision).
  - One important detail to note is that you must apply a scale to the mesh vertex positions (for example in the vertex shader used for rendering the meshes), to convert them from the optimized integer units in which they're stored in the buffer, to meters. You can retrieve this scale by calling [VertexPositionScale](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceMesh).

### Troubleshooting
* Don't forget to scale mesh vertex positions in your vertex shader, using the scale returned by [SpatialSurfaceMesh.VertexPositionScale](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceMesh)

## Spatial Mapping code sample walkthrough

The [Holographic Spatial Mapping](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/HolographicSpatialMapping) code sample includes code that you can use to get started loading surface meshes into your app, including infrastructure for managing and rendering surface meshes.

Now, we walk through how to add surface-mapping capability to your DirectX app. You can add this code to your [Windows Holographic app template](creating-a-holographic-directx-project.md) project, or you can follow along by browsing through the code sample mentioned above. This code sample is based on the Windows Holographic app template.

### Set up your app to use the spatialPerception capability

Your app can use the spatial mapping capability. This is necessary because the spatial mesh is a representation of the user's environment, which may be considered private data. Declare this capability in the package.appxmanifest file for your app. Here's an example:

```xml
<Capabilities>
  <uap2:Capability Name="spatialPerception" />
</Capabilities>
```

The capability comes from the **uap2** namespace. To get access to this namespace in your manifest, include it as an *xlmns* attribute in the &lt;Package> element. Here's an example:

```xml
<Package
    xmlns="https://schemas.microsoft.com/appx/manifest/foundation/windows10"
    xmlns:mp="https://schemas.microsoft.com/appx/2014/phone/manifest"
    xmlns:uap="https://schemas.microsoft.com/appx/manifest/uap/windows10"
    xmlns:uap2="https://schemas.microsoft.com/appx/manifest/uap/windows10/2"
    IgnorableNamespaces="uap uap2 mp"
    >
```

### Check for spatial mapping feature support

Windows Mixed Reality supports a wide range of devices, including devices, which don't support spatial mapping. If your app can use spatial mapping, or must use spatial mapping, to provide functionality, it should check to make sure spatial mapping is supported before trying to use it. For example, if spatial mapping is required by your mixed reality app, it should display a message to that effect if a user tries running it on a device without spatial mapping. Or, your app can render its own virtual environment in place of the user's environment, providing an experience that is similar to what would happen if spatial mapping were available. In any event, this API allows your app to be aware of when it won't get spatial mapping data and respond in the appropriate way.

To check the current device for spatial mapping support, first make sure the UWP contract is at level 4 or greater and then call SpatialSurfaceObserver::IsSupported(). Here's how to do so in the context of the [Holographic Spatial Mapping](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/HolographicSpatialMapping) code sample. Support is checked just before requesting access.

The SpatialSurfaceObserver::IsSupported() API is available starting in SDK version 15063. If necessary, retarget your project to platform version 15063 before using this API.

```cpp
if (m_surfaceObserver == nullptr)
   {
       using namespace Windows::Foundation::Metadata;
       if (ApiInformation::IsApiContractPresent(L"Windows.Foundation.UniversalApiContract", 4))
       {
           if (!SpatialSurfaceObserver::IsSupported())
           {
               // The current system does not have spatial mapping capability.
               // Turn off spatial mapping.
               m_spatialPerceptionAccessRequested = true;
               m_surfaceAccessAllowed = false;
           }
       }

       if (!m_spatialPerceptionAccessRequested)
       {
           /// etc ...
```

When the UWP contract is less than level 4, the app should proceed as though the device is capable of doing spatial mapping.

### Request access to spatial mapping data

Your app needs to request permission to access spatial mapping data before trying to create any surface observers. Here's an example based upon our Surface Mapping code sample, with more details provided later on this page:

```cpp
auto initSurfaceObserverTask = create_task(SpatialSurfaceObserver::RequestAccessAsync());
initSurfaceObserverTask.then([this, coordinateSystem](Windows::Perception::Spatial::SpatialPerceptionAccessStatus status)
{
    if (status == SpatialPerceptionAccessStatus::Allowed)
    {
        // Create a surface observer.
    }
    else
    {
        // Handle spatial mapping unavailable.
    }
}
```

### Create a surface observer

The **Windows::Perception::Spatial::Surfaces** namespace includes the [SpatialSurfaceObserver](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceObserver) class, which observes one or more volumes that you specify in a [SpatialCoordinateSystem](/uwp/api/Windows.Perception.Spatial.SpatialCoordinateSystem). Use a [SpatialSurfaceObserver](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceObserver) instance to access surface mesh data in real time.

From **AppMain.h**:

```cpp
// Obtains surface mapping data from the device in real time.
Windows::Perception::Spatial::Surfaces::SpatialSurfaceObserver^     m_surfaceObserver;
Windows::Perception::Spatial::Surfaces::SpatialSurfaceMeshOptions^  m_surfaceMeshOptions;
```

As noted in the previous section, you must request access to spatial mapping data before your app can use it. This access is granted automatically on the HoloLens.

```cpp
// The surface mapping API reads information about the user's environment. The user must
// grant permission to the app to use this capability of the Windows Mixed Reality device.
auto initSurfaceObserverTask = create_task(SpatialSurfaceObserver::RequestAccessAsync());
initSurfaceObserverTask.then([this, coordinateSystem](Windows::Perception::Spatial::SpatialPerceptionAccessStatus status)
{
    if (status == SpatialPerceptionAccessStatus::Allowed)
    {
        // If status is allowed, we can create the surface observer.
        m_surfaceObserver = ref new SpatialSurfaceObserver();
```

Next, you need to configure the surface observer to observe a specific bounding volume. Here, we observe a box that is 20x20x5 meters, centered at the origin of the coordinate system.

```cpp
// The surface observer can now be configured as needed.

        // In this example, we specify one area to be observed using an axis-aligned
        // bounding box 20 meters in width and 5 meters in height and centered at the
        // origin.
        SpatialBoundingBox aabb =
        {
            { 0.f,  0.f, 0.f },
            {20.f, 20.f, 5.f },
        };

        SpatialBoundingVolume^ bounds = SpatialBoundingVolume::FromBox(coordinateSystem, aabb);
        m_surfaceObserver->SetBoundingVolume(bounds);
```

You can set multiple bounding volumes instead.

*This is pseudocode:*

```cpp
m_surfaceObserver->SetBoundingVolumes(/* iterable collection of bounding volumes*/);
```

It's also possible to use other bounding shapes - such as a view frustum, or a bounding box that isn't axis aligned.

*This is pseudocode:*

```cpp
m_surfaceObserver->SetBoundingVolume(
            SpatialBoundingVolume::FromFrustum(/*SpatialCoordinateSystem*/, /*SpatialBoundingFrustum*/)
            );
```

If your app needs to do anything differently when surface mapping data isn't available, you can write code to respond to the case where the [SpatialPerceptionAccessStatus](/uwp/api/Windows.Perception.Spatial.SpatialPerceptionAccessStatus) isn't **Allowed** - for example, it won't be allowed on PCs with immersive devices attached because those devices don't have hardware for spatial mapping. For these devices, you should instead rely on the spatial stage for information about the user's environment and device configuration.

### Initialize and update the surface mesh collection

If the surface observer was successfully created, we can continue to initialize our surface mesh collection. Here, we use the pull model API to get the current set of observed surfaces right away:

```cpp
auto mapContainingSurfaceCollection = m_surfaceObserver->GetObservedSurfaces();
        for (auto& pair : mapContainingSurfaceCollection)
        {
            // Store the ID and metadata for each surface.
            auto const& id = pair->Key;
            auto const& surfaceInfo = pair->Value;
            m_meshCollection->AddOrUpdateSurface(id, surfaceInfo);
        }
```

There's also a push model available to get surface mesh data. You're free to design your app to use only the pull model if you choose, in which case you'll poll for data every so often - say, once per frame - or during a specific time period, such as during game setup. If so, the above code is what you need.

In our code sample, we chose to demonstrate the use of both models for pedagogical purposes. Here, we subscribe to an event to receive up-to-date surface mesh data whenever the system recognizes a change.

```cpp
m_surfaceObserver->ObservedSurfacesChanged += ref new TypedEventHandler<SpatialSurfaceObserver^, Platform::Object^>(
            bind(&HolographicDesktopAppMain::OnSurfacesChanged, this, _1, _2)
            );
```

Our code sample is also configured to respond to these events. Let's walk through how we do this.

**NOTE:** This might not be the most efficient way for your app to handle mesh data. This code is written for clarity and isn't optimized.

The surface mesh data is provided in a read-only map that stores [SpatialSurfaceInfo](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceInfo) objects using [Platform::Guids](https://msdn.microsoft.com/library/windows/desktop/aa373931.aspx) as key values.

```cpp
IMapView<Guid, SpatialSurfaceInfo^>^ const& surfaceCollection = sender->GetObservedSurfaces();
```

To process this data, we look first for key values that aren't in our collection. Details on how the data is stored in our sample app will be presented later in this topic.

```cpp
// Process surface adds and updates.
for (const auto& pair : surfaceCollection)
{
    auto id = pair->Key;
    auto surfaceInfo = pair->Value;

    if (m_meshCollection->HasSurface(id))
    {
        // Update existing surface.
        m_meshCollection->AddOrUpdateSurface(id, surfaceInfo);
    }
    else
    {
        // New surface.
        m_meshCollection->AddOrUpdateSurface(id, surfaceInfo);
    }
}
```

We also have to remove surface meshes that are in our surface mesh collection, but that aren't in the system collection anymore. To do so, we need to do something akin to the opposite of what we just showed for adding and updating meshes; we loop on our app's collection, and check to see if the **Guid** we have is in the system collection. If it's not in the system collection, we remove it from ours.

From our event handler in AppMain.cpp:

```cpp
m_meshCollection->PruneMeshCollection(surfaceCollection);
```

The implementation of mesh pruning in RealtimeSurfaceMeshRenderer.cpp:

```cpp
void RealtimeSurfaceMeshRenderer::PruneMeshCollection(IMapView<Guid, SpatialSurfaceInfo^>^ const& surfaceCollection)
{
    std::lock_guard<std::mutex> guard(m_meshCollectionLock);
    std::vector<Guid> idsToRemove;

    // Remove surfaces that moved out of the culling frustum or no longer exist.
    for (const auto& pair : m_meshCollection)
    {
        const auto& id = pair.first;
        if (!surfaceCollection->HasKey(id))
        {
            idsToRemove.push_back(id);
        }
    }

    for (const auto& id : idsToRemove)
    {
        m_meshCollection.erase(id);
    }
}
```

### Acquire and use surface mesh data buffers

Getting the surface mesh information was as easy as pulling a data collection and processing updates to that collection. Now, we'll go into detail on how you can use the data.

In our code example, we chose to use the surface meshes for rendering. This is a common scenario for occluding holograms behind real-world surfaces. You can also render the meshes, or render processed versions of them, to show the user what areas of the room are scanned before you start providing app or game functionality.

The code sample starts the process when it receives surface mesh updates from the event handler that we described in the previous section. The important line of code in this function is the call to update the surface *mesh*: by this time we have already processed the mesh info, and we're about to get the vertex and index data for use as we see fit.

From RealtimeSurfaceMeshRenderer.cpp:

```cpp
void RealtimeSurfaceMeshRenderer::AddOrUpdateSurface(Guid id, SpatialSurfaceInfo^ newSurface)
{
    auto options = ref new SpatialSurfaceMeshOptions();
    options->IncludeVertexNormals = true;

    auto createMeshTask = create_task(newSurface->TryComputeLatestMeshAsync(1000, options));
    createMeshTask.then([this, id](SpatialSurfaceMesh^ mesh)
    {
        if (mesh != nullptr)
        {
            std::lock_guard<std::mutex> guard(m_meshCollectionLock);
            '''m_meshCollection[id].UpdateSurface(mesh);'''
        }
    }, task_continuation_context::use_current());
}
```

Our sample code is designed so that a data class, **SurfaceMesh**, handles mesh data processing and rendering. These meshes are what the **RealtimeSurfaceMeshRenderer** actually keeps a map of. Each one has a reference to the SpatialSurfaceMesh it came from, so you can use it anytime you need to access the mesh vertex or index buffers, or get a transform for the mesh. For now, we flag the mesh as needing an update.

From SurfaceMesh.cpp:

```cpp
void SurfaceMesh::UpdateSurface(SpatialSurfaceMesh^ surfaceMesh)
{
    m_surfaceMesh = surfaceMesh;
    m_updateNeeded = true;
}
```

Next time the mesh is asked to draw itself, it will check the flag first. If an update is needed, the vertex and index buffers will be updated on the GPU.

```cpp
void SurfaceMesh::CreateDeviceDependentResources(ID3D11Device* device)
{
    m_indexCount = m_surfaceMesh->TriangleIndices->ElementCount;
    if (m_indexCount < 3)
    {
        // Not enough indices to draw a triangle.
        return;
    }
```

First, we acquire the raw data buffers:

```cpp
Windows::Storage::Streams::IBuffer^ positions = m_surfaceMesh->VertexPositions->Data;
    Windows::Storage::Streams::IBuffer^ normals   = m_surfaceMesh->VertexNormals->Data;
    Windows::Storage::Streams::IBuffer^ indices   = m_surfaceMesh->TriangleIndices->Data;
```

Then, we create Direct3D device buffers with the mesh data provided by the HoloLens:

```cpp
CreateDirectXBuffer(device, D3D11_BIND_VERTEX_BUFFER, positions, m_vertexPositions.GetAddressOf());
    CreateDirectXBuffer(device, D3D11_BIND_VERTEX_BUFFER, normals,   m_vertexNormals.GetAddressOf());
    CreateDirectXBuffer(device, D3D11_BIND_INDEX_BUFFER,  indices,   m_triangleIndices.GetAddressOf());

    // Create a constant buffer to control mesh position.
    CD3D11_BUFFER_DESC constantBufferDesc(sizeof(SurfaceTransforms), D3D11_BIND_CONSTANT_BUFFER);
    DX::ThrowIfFailed(
        device->CreateBuffer(
            &constantBufferDesc,
            nullptr,
            &m_modelTransformBuffer
            )
        );

    m_loadingComplete = true;
}
```

**NOTE:** For the CreateDirectXBuffer helper function used in the previous snippet, see the Surface Mapping code sample: SurfaceMesh.cpp, GetDataFromIBuffer.h. Now the device resource creation is complete, and the mesh is considered to be loaded and ready for update and render.

### Update and render surface meshes

Our SurfaceMesh class has a specialized update function. Each [SpatialSurfaceMesh](/uwp/api/Windows.Perception.Spatial.Surfaces.SpatialSurfaceMesh) has its own transform, and our sample uses the current coordinate system for our **SpatialStationaryReferenceFrame** to acquire the transform. Then it updates the model constant buffer on the GPU.

```cpp
void SurfaceMesh::UpdateTransform(
    ID3D11DeviceContext* context,
    SpatialCoordinateSystem^ baseCoordinateSystem
    )
{
    if (m_indexCount < 3)
    {
        // Not enough indices to draw a triangle.
        return;
    }

    XMMATRIX transform = XMMatrixIdentity();

    auto tryTransform = m_surfaceMesh->CoordinateSystem->TryGetTransformTo(baseCoordinateSystem);
    if (tryTransform != nullptr)
    {
        transform = XMLoadFloat4x4(&tryTransform->Value);
    }

    XMMATRIX scaleTransform = XMMatrixScalingFromVector(XMLoadFloat3(&m_surfaceMesh->VertexPositionScale));

    XMStoreFloat4x4(
        &m_constantBufferData.vertexWorldTransform,
        XMMatrixTranspose(
            scaleTransform * transform
            )
        );

    // Normals don't need to be translated.
    XMMATRIX normalTransform = transform;
    normalTransform.r[3] = XMVectorSet(0.f, 0.f, 0.f, XMVectorGetW(normalTransform.r[3]));
    XMStoreFloat4x4(
        &m_constantBufferData.normalWorldTransform,
        XMMatrixTranspose(
            normalTransform
        )
        );

    if (!m_loadingComplete)
    {
        return;
    }

    context->UpdateSubresource(
        m_modelTransformBuffer.Get(),
        0,
        NULL,
        &m_constantBufferData,
        0,
        0
        );
}
```

When it's time to render surface meshes, we do some prep work before rendering the collection. We set up the shader pipeline for the current rendering configuration, and we set up the input assembler stage. The holographic camera helper class **CameraResources.cpp** already has set up the view/projection constant buffer by now.

From **RealtimeSurfaceMeshRenderer::Render**:

```cpp
auto context = m_deviceResources->GetD3DDeviceContext();

context->IASetPrimitiveTopology(D3D11_PRIMITIVE_TOPOLOGY_TRIANGLELIST);
context->IASetInputLayout(m_inputLayout.Get());

// Attach our vertex shader.
context->VSSetShader(
    m_vertexShader.Get(),
    nullptr,
    0
    );

// The constant buffer is per-mesh, and will be set as such.

if (depthOnly)
{
    // Explicitly detach the later shader stages.
    context->GSSetShader(nullptr, nullptr, 0);
    context->PSSetShader(nullptr, nullptr, 0);
}
else
{
    if (!m_usingVprtShaders)
    {
        // Attach the passthrough geometry shader.
        context->GSSetShader(
            m_geometryShader.Get(),
            nullptr,
            0
            );
    }

    // Attach our pixel shader.
    context->PSSetShader(
        m_pixelShader.Get(),
        nullptr,
        0
        );
}
```

Once this is done, we loop on our meshes and tell each one to draw itself. **NOTE:** This sample code isn't optimized to use any sort of frustum culling, but you should include this feature in your app.

```cpp
std::lock_guard<std::mutex> guard(m_meshCollectionLock);

auto device = m_deviceResources->GetD3DDevice();

// Draw the meshes.
for (auto& pair : m_meshCollection)
{
    auto& id = pair.first;
    auto& surfaceMesh = pair.second;

    surfaceMesh.Draw(device, context, m_usingVprtShaders, isStereo);
}
```

The individual meshes are responsible for setting up the vertex and index buffer, stride, and model transform constant buffer. As with the spinning cube in the Windows Holographic app template, we render to stereoscopic buffers using instancing.

From **SurfaceMesh::Draw**:

```cpp
// The vertices are provided in {vertex, normal} format

const auto& vertexStride = m_surfaceMesh->VertexPositions->Stride;
const auto& normalStride = m_surfaceMesh->VertexNormals->Stride;

UINT strides [] = { vertexStride, normalStride };
UINT offsets [] = { 0, 0 };
ID3D11Buffer* buffers [] = { m_vertexPositions.Get(), m_vertexNormals.Get() };

context->IASetVertexBuffers(
    0,
    ARRAYSIZE(buffers),
    buffers,
    strides,
    offsets
    );

const auto& indexFormat = static_cast<DXGI_FORMAT>(m_surfaceMesh->TriangleIndices->Format);

context->IASetIndexBuffer(
    m_triangleIndices.Get(),
    indexFormat,
    0
    );

context->VSSetConstantBuffers(
    0,
    1,
    m_modelTransformBuffer.GetAddressOf()
    );

if (!usingVprtShaders)
{
    context->GSSetConstantBuffers(
        0,
        1,
        m_modelTransformBuffer.GetAddressOf()
        );
}

context->PSSetConstantBuffers(
    0,
    1,
    m_modelTransformBuffer.GetAddressOf()
    );

context->DrawIndexedInstanced(
    m_indexCount,       // Index count per instance.
    isStereo ? 2 : 1,   // Instance count.
    0,                  // Start index location.
    0,                  // Base vertex location.
    0                   // Start instance location.
    );
```

### Rendering choices with Surface Mapping

The Surface Mapping code sample offers code for occlusion-only rendering of surface mesh data, and for on-screen rendering of surface mesh data. Which path you choose - or both - depends on your application. We'll walk through both configurations in this document.

**Rendering occlusion buffers for holographic effect**

Start by clearing the render target view for the current virtual camera.

From AppMain.cpp:

```cpp
context->ClearRenderTargetView(pCameraResources->GetBackBufferRenderTargetView(), DirectX::Colors::Transparent);
```

This is a "pre-rendering" pass. Here, we create an occlusion buffer by asking the mesh renderer to render only depth. In this configuration, we don't attach a render target view, and the mesh renderer sets the pixel shader stage to **nullptr** so that the GPU doesn't bother to draw pixels. The geometry will be rasterized to the depth buffer, and the graphics pipeline will stop there.

```cpp
// Pre-pass rendering: Create occlusion buffer from Surface Mapping data.
context->ClearDepthStencilView(pCameraResources->GetSurfaceDepthStencilView(), D3D11_CLEAR_DEPTH | D3D11_CLEAR_STENCIL, 1.0f, 0);

// Set the render target to null, and set the depth target occlusion buffer.
// We will use this same buffer as a shader resource when drawing holograms.
context->OMSetRenderTargets(0, nullptr, pCameraResources->GetSurfaceOcclusionDepthStencilView());

// The first pass is a depth-only pass that generates an occlusion buffer we can use to know which
// hologram pixels are hidden behind surfaces in the environment.
m_meshCollection->Render(pCameraResources->IsRenderingStereoscopic(), true);
```

We can draw holograms with an extra depth test against the Surface Mapping occlusion buffer. In this code sample, we render pixels on the cube a different color if they are behind a surface.

From AppMain.cpp:

```cpp
// Hologram rendering pass: Draw holographic content.
context->ClearDepthStencilView(pCameraResources->GetHologramDepthStencilView(), D3D11_CLEAR_DEPTH | D3D11_CLEAR_STENCIL, 1.0f, 0);

// Set the render target, and set the depth target drawing buffer.
ID3D11RenderTargetView *const targets[1] = { pCameraResources->GetBackBufferRenderTargetView() };
context->OMSetRenderTargets(1, targets, pCameraResources->GetHologramDepthStencilView());

// Render the scene objects.
// In this example, we draw a special effect that uses the occlusion buffer we generated in the
// Pre-Pass step to render holograms using X-Ray Vision when they are behind physical objects.
m_xrayCubeRenderer->Render(
    pCameraResources->IsRenderingStereoscopic(),
    pCameraResources->GetSurfaceOcclusionShaderResourceView(),
    pCameraResources->GetHologramOcclusionShaderResourceView(),
    pCameraResources->GetDepthTextureSamplerState()
    );
```

Based on code from SpecialEffectPixelShader.hlsl:

```cpp
// Draw boundaries
min16int surfaceSum = GatherDepthLess(envDepthTex, uniSamp, input.pos.xy, pixelDepth, input.idx.x);

if (surfaceSum <= -maxSum)
{
    // The pixel and its neighbors are behind the surface.
    // Return the occluded 'X-ray' color.
    return min16float4(0.67f, 0.f, 0.f, 1.0f);
}
else if (surfaceSum < maxSum)
{
    // The pixel and its neighbors are a mix of in front of and behind the surface.
    // Return the silhouette edge color.
    return min16float4(1.f, 1.f, 1.f, 1.0f);
}
else
{
    // The pixel and its neighbors are all in front of the surface.
    // Return the color of the hologram.
    return min16float4(input.color, 1.0f);
}
```

**Note:** For our **GatherDepthLess** routine, see the Surface Mapping code sample: SpecialEffectPixelShader.hlsl.

**Rendering surface mesh data to the display**

We can also just draw the surface meshes to the stereo display buffers. We chose to draw full faces with lighting, but you're free to draw wireframe, process meshes before rendering, apply a texture map, and so on.

Here, our code sample tells the mesh renderer to draw the collection. This time we don't specify a depth-only pass, it'll attach a pixel shader and complete the rendering pipeline using the targets that we specified for the current virtual camera.

```cpp
// Spatial Mapping mesh rendering pass: Draw Spatial Mapping mesh over the world.
context->ClearDepthStencilView(pCameraResources->GetSurfaceOcclusionDepthStencilView(), D3D11_CLEAR_DEPTH | D3D11_CLEAR_STENCIL, 1.0f, 0);

// Set the render target to the current holographic camera's back buffer, and set the depth buffer.
ID3D11RenderTargetView *const targets[1] = { pCameraResources->GetBackBufferRenderTargetView() };
context->OMSetRenderTargets(1, targets, pCameraResources->GetSurfaceDepthStencilView());

// This drawing pass renders the surface meshes to the stereoscopic display. The user will be
// able to see them while wearing the device.
m_meshCollection->Render(pCameraResources->IsRenderingStereoscopic(), false);
```

## See also
* [Creating a holographic DirectX project](creating-a-holographic-directx-project.md)
* [Windows.Perception.Spatial API](/uwp/api/Windows.Perception.Spatial)