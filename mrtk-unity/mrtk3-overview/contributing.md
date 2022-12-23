---
title: Contributing to MRTK3
description: Overview of how to contribute to the MRTK3 open source project.
author: Zee2
ms.author: finnsinclair
ms.date: 12/21/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, open source, contributing, contributors, contribution, pull request
---

# Contributing to MRTK3

MRTK3 is an open-source project under the MIT license. Community contributions are very welcome and appreciated, both for new features as well as bug fixes.

Contributing to MRTK3 is easy. We recommend using the `MRTKDevTemplate` Unity project as a convenient development testbed, as it already includes all of the MRTK3 packages as local on-disk dependencies. [See the documentation on the MRTKDevTemplate project for more details on sample scenes and local on-disk dependencies.](scenes.md)

## Contribution guide

1. Fork the MRTK repository to your GitHub account.

2. Clone your forked MRTK repository by [following the Path 1 example in the setup documentation.](setup.md) Ensure you have the required tooling, especially the correct Unity version. The command below ensures you're on the right branch (`mrtk3`).

```
git clone --branch mrtk3 YOUR_GIT_URL
```

3. Create a new branch for your changes or fixes.

```
git checkout -b foobar_fix
```

4. Open the `MRTKDevTemplate` template project located in `UnityProjects/MRTKDevTemplate`. You can add the project to your Unity Hub for easy access.

5. Make your desired changes, as well as unit tests that ensure your changes work as expected. Make sure to test across in-editor and deployed to device. Commit your changes to your branch. Publish your branch to your fork upstream.

6. Open a pull request on the MRTK repo, targeting the `mrtk3` branch. Make sure to accurately describe the changes you've made, and apply relevant labels to your pull request for better categorization and triage. If you're a new contributor to MRTK, you may need to sign our contribution agreement.

7. Address any fixes requested by the community or the maintenance team, and merge your PR after approval.

## Writing tests

Tests are a critical part of ensuring MRTK is a reliable foundation for high-quality mixed reality applications. Any new features that are added should have unit tests to ensure their functionality remains correct as other changes are made to the codebase in the future. 

To write unit tests, we recommend first taking a look at the existing unit tests and learn how the MRTK test utilities and simulator are used to mock XR input. You can mock hand input, gaze, HMD position, and other basic input-related features. Here's some general advice for writing good unit tests:

- Try to write more granular tests that evaluate smaller pieces of functionality, rather than larger monolithic tests. More granular unit tests allow maintainers to see which specific feature has been broken. More general end-to-end functionality tests are also appreciated, but ensure that each smaller part of your feature is well-tested to begin with.
- Make sure your test (and your feature) doesn't make any assumptions about the orientation or location of the user. Your tests and features should work at any arbitrary offset or rotation from the world origin.
- If your tests mock user input, make sure to subclass our `BaseRuntimeInputTests`, which ensures that the proper test harness is set up and torn down.
- Use NUnit parameterization to easily increase the variety and flexibility of your test. [See the documentation for parameterized NUnit tests here.](https://docs.nunit.org/articles/nunit/technical-notes/usage/Parameterized-Tests.html)
- Some inputs or interactions may take multiple frames to register. You can use `yield return RuntimeTestUtilities.WaitForUpdates()` to add additional frames of delay to your test if your interactions are not registering.
- Try to write unit tests that execute as quickly as possible to avoid slow CI iteration times.
- Make sure you add the relevant test dependencies to the `package.json`, and the correct references to the test folder's assembly definition file.

## Continuous integration

Every pull request is subject to automated tests before being able to be merged. Additional CI is also run on the resulting commit on the main development branch to ensure broken packages are not deployed to the feed.

If your tests are passing in-editor but fail in the CI run, you should run your tests locally in batch mode. Some types of tests may unexpectedly fail when running in no-graphics batch mode, due to timing differences or other Unity quirks. Running your tests locally in batch mode helps identify these inconsistent tests before the CI does.

Use the `Tooling/Tests/run_playmode_tests.ps1` script to run tests locally in batch mode. You'll need to close your Unity editor to do so.

```
$ ./Tooling/Tests/run_playmode_tests.ps1
```

The script will generate output files in the `/out` folder, including both `.log` files as well as the test results `.xml`. You can filter which tests are run by passing a regular expression to the script. Custom Unity versions and project folder locations can also be provided as arguments.

```
$ ./Tooling/Tests/run_playmode_tests.ps1 -unityVersion 2021.3.5f1 -projectPath ../my/project/path
```
