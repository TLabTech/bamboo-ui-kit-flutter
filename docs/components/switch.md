# Switch

Overview
- A themable on/off toggle component for binary choices in forms, settings, and lists. Use TSwitch for labeled switches with optional description, disabled and error states.

Features

- Labeled switch with optional description.
- Disabled state when interaction is not allowed.
- Error state with an error message display.
- Theming integration via TThemeManager and TFont helpers.
- Simple onChanged callback for parent-managed state.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage
```dart
// Inside a StatefulWidget
bool _isFeatureEnabled = false;

TSwitch(
  label: "Label",
  description: "Description",
  value: _isFeatureEnabled,
  onChanged: (value) {
    _isFeatureEnabled = value;
  },
  isEnabled: true,
);
```

Preview
![Switch Preview](../assets/checkbox/switch_preview.gif)

## Additional Usage

### Disabled switch
```dart
// Inside a StatefulWidget
bool _isFeatureDisableEnabled = false;

TSwitch(
  label: "Label",
  description: "Description",
  value: _isFeatureDisableEnabled,
  onChanged: (value) {
    _isFeatureDisableEnabled = value;
  },
  isEnabled: false, // interaction disabled
);
```

### Error state with message
```dart
bool _isFeatureErrorEnabled = false;

TSwitch(
  label: "Label",
  description: "Description",
  value: _isFeatureErrorEnabled,
  onChanged: (value) {
    _isFeatureErrorEnabled = value;
  },
  isError: true,
  error: "Error description",
  isEnabled: true,
);
```