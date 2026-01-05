# Stepper

Overview
- A compact progress stepper that visualizes the current step in a multi-step flow. Use Stepper (TStepper) to show progress in forms, onboarding flows, or any multi-step process where users need context about completed and remaining steps.

Features
- Displays current step text ("Step X of N") and a horizontal progress bar composed of step segments.
- Configurable total steps and current step.
- Theme-aware default colors with optional active/inactive color overrides.
- Lightweight, responsive layout suitable for cards, accordions, and forms.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage Example

```dart
TStepper(currentStep: 2, totalSteps: 4);
```

UI Preview

![Stepper Preview](../assets/stepper/stepper_preview.gif)

### Additional Usage
```dart
TStepper(
  currentStep: 2,
  totalSteps: 5,
  activeColor: Colors.teal,
  inactiveColor: Colors.grey.shade300,
);
```