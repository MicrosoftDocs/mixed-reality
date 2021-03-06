---

# Mandatory fields.
title: JavaScript development Overview
description: Overview of Mixed Reality development using JavaScript for web, mobile and windows immersive headsets.
author: yonet
ms.author: ayyonet
ms.date: 04/10/2020
ms.topic: article
keywords: JavaScript, WebXR, WinMR, WebAR, WebVR, WindowsMixedReality, HoloLens, windows mixed reality, web vr, web xr, web mr, web ar, 360, 360 video, 360 videos, 360 photo, 360 photos, 360 content, immersive web, immersive-web, IW, immersiveweb

---

# JavaScript development overview

JavaScript is one of the most popular programming languages in the world, it is simple and lightweight programming language used everywhere on the web. Leverage the power of your JavaScript and web skills to create more engaging Mixed Reality experiences.

## Mixed Reality applications on the web

Mixed Reality features are available on the web by the use of [WebXR Device APIs](https://developer.mozilla.org/en-US/docs/Web/API/WebXR_Device_API) and [deprecated WebVR APIs](webxr-overview.md). For browsers that do not support full WebXR features, you can add [WebXR Polyfills](https://github.com/immersive-web/webxr-polyfill) to your website.

## What is WebXR Polyfill

A JavaScript implementation of the WebXR Device API, as well as the WebXR Gamepad Module. This polyfill allows developers to write against the latest specification, providing support when run on browsers that implement the WebVR 1.1 spec, or on mobile devices with no WebVR/WebXR support at all.

## JavaScript libraries to build Mixed Reality applications on the web

The following list shows the JavaScript frameworks for building immersive experiences that currently dominate the market and are widely accepted and adopted by Mixed Reality JavaScript developers

## Babylon.js

![BabylonJS Logo](images/babylon-js-logo.png)

Babylon is a JavaScript 3D engine that makes developing 3D content and immersive applications easy. Before getting started with immersive applications, we recommend to learn the basics of Babylon.js development.

Learn how to build a mixed reality application with Babylon in the [getting started section](https://doc.babylonjs.com/). Play with 3D examples and their source code using [Babylon Playground](https://doc.babylonjs.com/examples/). Dive into mixed reality development on the [WebXR section](https://doc.babylonjs.com/how_to/introduction_to_webxr) of the documentation.

## A-Frame

A-frame is a declarative JavaScript framework to get started with Virtual Reality in the web. Check out the [A-Frame documentation](https://aframe.io/) to learn more.

## Three.js

Three.js is a popular 3D library for creating immersive experiences. Learn more about [three.js](https://threejs.org/docs/index.html#manual/en/introduction/Creating-a-scene) in documentation page and by exploring [examples](https://threejs.org/examples/#webgl_animation_cloth).

## WebGL

You can access the WebXR Device APIs directly by using WebGL APIs. WebGL (Web Graphics Library) is a JavaScript API for rendering high-performance interactive 3D and 2D graphics within any compatible web browser without the use of plug-ins. Learn more about the [WebGL APIs](https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API).

## Mixed Reality native mobile applications using JavaScript

With the help of few JavaScript libraries you can write your mixed reality experiences once and deploy it to web and to native platforms like Windows Mixed Reality headsets, Android and iOS devices.

## Babylon Native

[Babylon Native](https://www.babylonjs.com/native/) platform allows anyone to take their Babylon.js code and build a native application with it, unlocking the power of native technologies. You can download [Babylon native on github](https://github.com/BabylonJS/BabylonNative) and read more about it on [Babylon.js blog](https://medium.com/@babylonjs/babylon-native-821f1694fffc).

To learn more about BabylonNative, continue to this [tutorial](/tutorials/babylon-native).

## React Native

[React Native](https://reactnative.dev/) is another open source library that allows developers to build using JavaScript and deploy to multiple platforms. You can download [React Native on Github](https://github.com/facebook/react-native) and learn more about it in [React Native Blog](https://reactnative.dev/blog/).

## Next steps

Learn how to get started with our tutorials.

> [!div class="nextstepaction"]
> [Create your first "Hello World!" app)](tutorials/babylonjs-webxr-helloworld/introduction-01.md)

## See Also

* [WebXR Overview](webxr-overview.md)
* [WebXR Device API specification](https://immersive-web.github.io/webxr/)
* [WebXR Device API documentation](https://developer.mozilla.org/en-US/docs/Web/API/WebXR_Device_API)
* [Immersiveweb.dev](https://immersiveweb.dev/)
* [WebXR Samples](https://immersive-web.github.io/webxr-samples/)
* [Using Babylon.js to create WebXR experiences](https://doc.babylonjs.com/how_to/introduction_to_webxr)
* [Windows Mixed Reality and the new Microsoft Edge](/windows/mixed-reality/new-microsoft-edge#introducing-the-new-microsoft-edge)
* [Immersive Web W3C Github](https://github.com/immersive-web)
* [WebGL API](/previous-versions/windows/internet-explorer/ie-developer/dev-guides/bg182648(v=vs.85))
* [Gamepad API](https://msdn.microsoft.com/library/dn743630(v=vs.85).aspx) and [Gamepad Extensions](https://w3c.github.io/gamepad/extensions.html)
* [WebVR Overview](webvr-overview.md)