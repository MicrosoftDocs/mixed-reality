**Input Actions**

| **MRTK 2**                                                                           | **MRTK 3**                                                                                                                                                                                     |
|--------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Creating input actions (Connect input to an abstract action that code can listen to) | Unity Input System - Create actions: [<u>Actions \| Input System \| 1.5.0 (unity3d.com)</u>](https://docs.unity3d.com/Packages/com.unity.inputsystem@1.5/manual/Actions.html#creating-actions) |
| Input Action Rules (Run an action based on value of another action)                  | ?                                                                                                                                                                                              |

**Pointers**

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>MRTK 2</strong></th>
<th><strong>MRTK 3</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Prefab - Visual for pointer hello test1</td>
<td><p>Near:</p>
<p>MRTKPokeReticleVisual (MRTK3 MonoBehaviour)</p>
<p>Far:</p>
<p>MRTKLineVisual + MRTKRayReticleVisual (MRTK3 MonoBehaviours)</p></td>
</tr>
<tr class="even">
<td>Layer Masks - Layers to filter for raycast</td>
<td>Interactor `raycastMask`</td>
</tr>
<tr class="odd">
<td>Extent - Max distance of raycast</td>
<td>Interactor `maxRaycastDistance`</td>
</tr>
<tr class="even">
<td>Mediator - Controls which pointer is used</td>
<td>InteractionModeManager (MRTK3 MonoBehaviour) - Controls priority of
interaction modes and interactors</td>
</tr>
<tr class="odd">
<td>Pointer Selector - Used by the focus provider to choose the primary
pointer</td>
<td>InteractionModeManager (MRTK3 MonoBehaviour) - Controls priority of
interaction modes and interactors</td>
</tr>
</tbody>
</table>

**Gestures**

Assign input actions to various gesture input methods (currently only
Windows Recognition on HL2)

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>MRTK 2</strong></th>
<th><strong>MRTK 3</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Assign action to a gesture</td>
<td><p>Use default interactions from input system?</p>
<p><a
href="https://docs.unity3d.com/Packages/com.unity.inputsystem@1.5/manual/Interactions.html"><u>Interactions
| Input System | 1.5.0 (unity3d.com)</u></a></p></td>
</tr>
</tbody>
</table>

**Speech Commands**

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>MRTK 2</strong></th>
<th><strong>MRTK 3</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Mapping speech commands to Input Actions</td>
<td><ol type="1">
<li><p>Add WindowsPhraseRecognitionSubsystem to project</p></li>
<li><p>Call subsystem.CreateOrGetEventForPhrase with actions</p></li>
</ol></td>
</tr>
</tbody>
</table>

**Controller Mapping**

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>MRTK 2</strong></th>
<th><strong>MRTK 3</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Configure controller button behavior</td>
<td><p>Add XRController script and set button assignments:</p>
<p><img src="media/image1.png" style="width:6.5in;height:4.7in"
alt="Graphical user interface, text Description automatically generated" /></p></td>
</tr>
<tr class="even">
<td>Add controllers</td>
<td><p>Add supported devices in Input System Package settings or
OpenXR</p>
<p><img src="media/image2.png" style="width:6.5in;height:4.15in"
alt="Graphical user interface, text, application Description automatically generated" /></p></td>
</tr>
</tbody>
</table>

**Controller Visualization**

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>MRTK 2</strong></th>
<th><strong>MRTK 3</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Set prefab in controller configuration profile</td>
<td><p>Set model prefab on XR Controller</p>
<p><img src="media/image3.png" style="width:6.5in;height:3.975in"
alt="Graphical user interface, text Description automatically generated" /></p></td>
</tr>
</tbody>
</table>
