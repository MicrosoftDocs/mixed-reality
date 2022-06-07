
# Interaction Mode Manager

An interaction mode represents a subset of interactors that should be enabled based on contextual information about what the user is doing. For example, a **near interaction mode** may disable all far ray interactors while permitting the use of grab and poke interactors. Conversely, when the user is grabbing an object, you may want to enter a **near grab interaction mode**, which disables the touch interactor, preventing any accidental touch activations while grabbing the object.

The **interaction mode manager** mediates between these contextual subsets. It relies on mode *detectors* to determine the best mode for the current context.
Mode detectors, like the ProximityModeDetector, can inform the mode manager and dictate which mode should be active based on any arbitrary condition. Developers can create new ways to disambiguate between interaction contexts by implementing `InteractionModeDetector`.

The priority of each mode can be adjusted in the manager. When multiple detectors are reporting that their associated interactor subsets should be activated, the priority list in the manager acts as a tie-breaker between the detected modes.



