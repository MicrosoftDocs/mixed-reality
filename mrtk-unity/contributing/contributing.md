---
title: Contributing to MRTK
description: How to contribute to the Mixed Reality Toolkit
author: polar-kev
ms.author: kesemple
ms.date: 03/17/2021
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Bug report,
---

# Contributing

The Mixed Reality Toolkit (MRTK) welcomes contributions from the community. All changes be they small or large, need to adhere to the [MRTK coding standards](coding-guidelines.md), so please ensure you are familiar with these while developing to avoid delays when the change is being reviewed.

If you have any questions, please reach out on the [mixed-reality-toolkit channel on Slack](https://holodevelopers.slack.com/messages/C2H4HT858).
 You can join the Slack community via the [automatic invitation sender](https://holodevelopersslack.azurewebsites.net/).

## Submission process

We provide several paths to enable developers to contribute to the Mixed Reality Toolkit, all starting with [creating a new Issue](https://github.com/Microsoft/MixedRealityToolkit-Unity/issues/new/choose).

<img src="../features/images/contributing/SelectIssueType.png" width="600" alt="Select Issue Type">

From here you file:

- **Bug report** - Functionality issue with one of the Mixed Reality Toolkit components
- **Documentation issue** - Issue with the Mixed Reality Toolkit [documentation](https://microsoft.github.io/MixedRealityToolkit-Unity)
- **Feature request** - Proposal for a new Mixed Reality Toolkit feature

## Proposing feature requests

When requesting a new Mixed Reality Toolkit feature, it is important to document the customer benefit / problem to be solved. Once submitted, a feature request will be reviewed and discussed on GitHub. We encourage open and constructive discussion of each feature proposal to ensure that the work is beneficial to a large segment of customers.

To avoid needing to rework the feature, it is generally recommended that development of the feature does not begin during the review phase. Many times, the community review process uncovers one or more issues that may require significant changes in the proposed implementation.

> [!NOTE]
> If you wish to work on something that already exists on our backlog, you can use that work item as your proposal. Be sure to also comment on the task notifying maintainers that you're working towards completing it.

## Contribution process

To get started, simply follow these steps:

1. Fork the repository. Click on the "Fork" button on the top right of the page and follow the flow.
1. Create a branch in your fork (off of the [main](https://github.com/microsoft/mixedrealitytoolkit-unity/tree/main) branch) to make it easier to isolate any changes until ready for submission. For bug fixes during a release stabilization period, look for the latest `prerelease/*` branch. New features should always go into `main`.

If you are new to to the Git workflow, [check out this introduction from Github](https://guides.github.com/activities/hello-world/).

When adding a bug fix or feature, follow these steps:

1. Implement the bug fix or feature. Instructions for building and deploying MRTK are at [Deploying to Hololens and WMR devices](../supported-devices/wmr-mrtk.md). Remember to follow the [Coding Guidelines](../contributing/coding-guidelines.md).
1. If adding a feature, also add an example scene that demonstrates the feature.
1. If adding an experimental feature, then writing tests and documentation are not necessary. Instead, follow [experimental feature guidelines](../contributing/experimental-features.md).
1. Add tests to verify the bug fix / feature. Instructions for writing and running tests are at [UnitTests](../contributing/unit-tests.md).
1. Ensure the code and feature(s) are documented as described in the [Documentation Guidelines](../contributing/documentation-guide.md).
1. Ensure the code works as intended on all platforms. Please see [Release notes](../release-notes/mrtk-26-release-notes.md) for the list of supported platforms. For Windows UWP projects, code must be [WACK compliant](https://developer.microsoft.com/windows/develop/app-certification-kit). To do this, generate a Visual Studio solution, right click on project; **Store** > **Create App Packages**. Follow the prompts and run WACK tests. Make sure they all succeed.
1. Follow the instructions at [Pull Requests](../contributing/pull-requests.md) when making a pull request.
