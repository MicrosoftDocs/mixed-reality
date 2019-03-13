---
title: Getting started with MRTK version 2
description: For new developers who are interested in leveraging MRTK
author: grbury
ms.author: grbury
ms.date: 02/22/19
ms.topic: article
keywords: Windows Mixed Reality, test, MRTK version 2, MRTK, tools, SDK, HoloLens, HoloLens 2
---

# Getting started with MRTK version 2

The MRTK is an amazing open source toolkit that has been around since the HoloLens was first released, and would not be where it is today without the hard work of our developer community who have contributed to it. Over the past 3 years, we have listened to the feedback of our developer community, and built MRTK version 2 to take the biggest concerns into account.  

The MRTK version 2 with Unity is an open source cross-platform development kit for mixed reality applications.  MRTK version 2 is intended to accelerate development of applications targeting Microsoft HoloLens, Windows Mixed Reality immersive (VR) headsets and OpenVR platform. The project is aimed at reducing barriers to entry to create mixed reality applications and contribute back to the community as we all grow. 


See the <a href="https://github.com/Microsoft/MixedRealityToolkit-Unity/wiki/Getting-Started-with-MRTK-v2" target="_blank">MRTK version 2 wiki</a> to get started and learn more.

## New with MRTK version 2
We want to stress our commitment to these platform tools.  In fact, we leveraged MRTK version 2 to develop our inbox experiences, such as the setup experience (OOBE) and our Mixed Reality Learning application.  You can also expect to see new HoloLens 2 capabilities first exposed through MRTK because we believe it’s the best way to develop on our platform. 

### Modular
We have built it in a modular way, so that you do not need to take every bit of the toolkit into your project.  There are actually a few benefits to this.  It keeps your project size smaller, as well as makes it easier to manage.  On top of that, because it’s built with scriptable objects and is interface driven, it’s also possible for you to replace the components that are included with your own, to support other services, systems, and platforms.


### Cross-platform
Speaking of other platforms, it has cross-platform support.  And while this doesn’t mean every single platform is supported out of the box, we have made sure none of the toolkit code will break when you switch your build target to other platforms.  The robustness and extensibility with the modular design sets you up on a good path to be able to support multiple platforms, such as ARCore, ARKit, and OpenVR.


### Performant
Working with mobile platforms, we constructed it with performance in mind.  This is super important, and we wanted to ensure that the tools are not going to work against you.


## See also
* [Install the tools](install-the-tools.md)
* [Porting from HTK/MRTK to MRTK version 2](mrtk-porting-guide.md)
