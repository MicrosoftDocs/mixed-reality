---
title: Volume rendering overview
description: Learn how to efficiently render rich volumetric images with opacity and color in Windows Mixed Reality. 
author: vtieto
ms.author: vinnietieto
ms.date: 09/08/2021
ms.topic: article
keywords: volumetric image, volume rendering, performance, mixed reality
---

# Volume rendering overview

For medical MRI or engineering volumes, see [Volume Rendering on Wikipedia](https://en.wikipedia.org/wiki/Volume_rendering). These 'volumetric images' contain rich information with opacity and color throughout the volume that cannot be easily expressed as surfaces such as [polygonal meshes](https://en.wikipedia.org/wiki/Polygon_mesh).

Key solutions to improve performance
1. BAD: Naïve Approach: Show Whole Volume, generally runs too slowly
2. GOOD: Cutting Plane: Show only a single slice of the volume
3. GOOD: Cutting Sub-Volume: Show only a few layers of the volume
4. GOOD: Lower the resolution of the volume rendering (see 'Mixed Resolution Scene Rendering')

There's only a certain amount of information that can be transferred from the application to the screen in any particular frame, which is the total memory bandwidth. Also, any processing (or 'shading') required to transform that data for presentation requires time. The primary considerations when doing volume rendering are as such:
* Screen-Width * Screen-Height * Screen-Count * Volume-Layers-On-That-Pixel = Total-Volume-Samples-Per-Frame
* 1028 * 720 * 2 * 256 = 378961920 (100%) (full res volume: too many samples)
* 1028 * 720 * 2 * 1 = 1480320 (0.3% of full) (thin slice: 1 sample per pixel, runs smoothly)
* 1028 * 720 * 2 * 10 = 14803200 (3.9% of full) (subvolume slice: 10 samples per pixel, runs fairly smoothly, looks 3d)
* 200 * 200 * 2 * 256 = 20480000 (5% of full) (lower res volume: fewer pixels, full volume, looks 3d but a bit blurry)

## Representing 3D Textures

On the CPU:

```
public struct Int3 { public int X, Y, Z; /* ... */ }
 public class VolumeHeader  {
   public readonly Int3 Size;
   public VolumeHeader(Int3 size) { this.Size = size;  }
   public int CubicToLinearIndex(Int3 index) {
     return index.X + (index.Y * (Size.X)) + (index.Z * (Size.X * Size.Y));
   }
   public Int3 LinearToCubicIndex(int linearIndex)
   {
     return new Int3((linearIndex / 1) % Size.X,
       (linearIndex / Size.X) % Size.Y,
       (linearIndex / (Size.X * Size.Y)) % Size.Z);
   }
   /* ... */
 }
 public class VolumeBuffer<T> {
   public readonly VolumeHeader Header;
   public readonly T[] DataArray;
   public T GetVoxel(Int3 pos)        {
     return this.DataArray[this.Header.CubicToLinearIndex(pos)];
   }
   public void SetVoxel(Int3 pos, T val)        {
     this.DataArray[this.Header.CubicToLinearIndex(pos)] = val;
   }
   public T this[Int3 pos] {
     get { return this.GetVoxel(pos); }
     set { this.SetVoxel(pos, value); }
   }
   /* ... */
 }
```

On the GPU:

```
float3 _VolBufferSize;
 int3 UnitVolumeToIntVolume(float3 coord) {
   return (int3)( coord * _VolBufferSize.xyz );
 }
 int IntVolumeToLinearIndex(int3 coord, int3 size) {
   return coord.x + ( coord.y * size.x ) + ( coord.z * ( size.x * size.y ) );
 }
 uniform StructuredBuffer<float> _VolBuffer;
 float SampleVol(float3 coord3 ) {
   int3 intIndex3 = UnitVolumeToIntVolume( coord3 );
   int index1D = IntVolumeToLinearIndex( intIndex3, _VolBufferSize.xyz);
   return __VolBuffer[index1D];
 }
```

## Shading and Gradients

How to shade a volume, such as MRI, for useful visualization. The primary method is to have an 'intensity window' (a min and max) that you want to see intensities within, and simply scale into that space to see the black and white intensity. A 'color ramp' can then be applied to the values within that range, and stored as a texture, so that different parts of the intensity spectrum can be shaded different colors:

```
float4 ShadeVol( float intensity ) {
   float unitIntensity = saturate( intensity - IntensityMin / ( IntensityMax - IntensityMin ) );
   // Simple two point black and white intensity:
   color.rgba = unitIntensity;
   // Color ramp method:
   color.rgba = tex2d( ColorRampTexture, float2( unitIntensity, 0 ) );
```

In many of our applications, we store in our volume both a raw intensity value and a 'segmentation index' (to segment different parts such as skin and bone; these segments are created by experts in dedicated tools). This can be combined with the approach above to put a different color, or even different color ramp for each segment index:

```
// Change color to match segment index (fade each segment towards black):
 color.rgb = SegmentColors[ segment_index ] * color.a; // brighter alpha gives brighter color
```

## Volume Slicing in a Shader

A great first step is to create a "slicing plane" that can move through the volume, 'slicing it', and how the scan values at each point. This assumes that there's a 'VolumeSpace' cube, which represents where the volume is in world space, that can be used as a reference for placing the points:

```
// In the vertex shader:
 float4 worldPos = mul(_Object2World, float4(input.vertex.xyz, 1));
 float4 volSpace = mul(_WorldToVolume, float4(worldPos, 1));
```

```
// In the pixel shader:
 float4 color = ShadeVol( SampleVol( volSpace ) );
```

## Volume Tracing in Shaders

How to use the GPU to do subvolume tracing (walks a few voxels deep, then layers on the data from back to front):

```
float4 AlphaBlend(float4 dst, float4 src) {
   float4 res = (src * src.a) + (dst - dst * src.a);
   res.a = src.a + (dst.a - dst.a*src.a);
   return res;
 }
 float4 volTraceSubVolume(float3 objPosStart, float3 cameraPosVolSpace) {
   float maxDepth = 0.15; // depth in volume space, customize!!!
   float numLoops = 10; // can be 400 on nice PC
   float4 curColor = float4(0, 0, 0, 0);
   // Figure out front and back volume coords to walk through:
   float3 frontCoord = objPosStart;
   float3 backCoord = frontPos + (normalize(cameraPosVolSpace - objPosStart) * maxDepth);
   float3 stepCoord = (frontCoord - backCoord) / numLoops;
   float3 curCoord = backCoord;
   // Add per-pixel random offset, avoids layer aliasing:
   curCoord += stepCoord * RandomFromPositionFast(objPosStart);
   // Walk from back to front (to make front appear in-front of back):
   for (float i = 0; i < numLoops; i++) {
     float intensity = SampleVol(curCoord);
     float4 shaded = ShadeVol(intensity);
     curColor = AlphaBlend(curColor, shaded);
     curCoord += stepCoord;
   }
   return curColor;
 }
```

```
// In the vertex shader:
 float4 worldPos = mul(_Object2World, float4(input.vertex.xyz, 1));
 float4 volSpace = mul(_WorldToVolume, float4(worldPos.xyz, 1));
 float4 cameraInVolSpace = mul(_WorldToVolume, float4(_WorldSpaceCameraPos.xyz, 1));
```

```
// In the pixel shader:
 float4 color = volTraceSubVolume( volSpace, cameraInVolSpace );
```

## Whole Volume Rendering

Modifying the subvolume code above, we get:

```
float4 volTraceSubVolume(float3 objPosStart, float3 cameraPosVolSpace) {
   float maxDepth = 1.73; // sqrt(3), max distance from point on cube to any other point on cube
   int maxSamples = 400; // just in case, keep this value within bounds
   // not shown: trim front and back positions to both be within the cube
   int distanceInVoxels = length(UnitVolumeToIntVolume(frontPos - backPos)); // measure distance in voxels
   int numLoops = min( distanceInVoxels, maxSamples ); // put a min on the voxels to sample
```

## Mixed Resolution Scene Rendering

How to render a part of the scene with a low resolution and put it back in place:
1. Setup two off-screen cameras, one to follow each eye that update each frame
2. Setup two low-resolution render targets (that is, 200x200 each) that the cameras render into
3. Set up a quad that moves in front of the user

Each Frame:
1. Draw the render targets for each eye at low-resolution (volume data, expensive shaders, and so on)
2. Draw the scene normally as full resolution (meshes, UI, and so on)
3. Draw a quad in front of the user, over the scene, and project the low-res renders onto that
4. Result: visual combination of full-resolution elements with low-resolution but high-density volume data

## See Also
* [Volume rendering(with C# and HLSL samples)](../native/volume-rendering.md)
