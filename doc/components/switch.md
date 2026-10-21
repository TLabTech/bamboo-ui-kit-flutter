# Switch

Overview
- A themable on/off toggle component for binary choices in forms, settings, and lists. Use TSwitch for labeled switches with optional description, disabled and error states.

Features

- Labeled switch with optional label and description.
- Compact switch-only variant (no text column) with a 42×24 default track.
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

### Compact switch (without label)

Omit both `label` and `description` to render only the switch. The compact track
defaults to `42×24` and can be resized with `width` and `height`.

```dart
TSwitch(
  value: _isEnabled,
  onChanged: (value) {
    setState(() {
      _isEnabled = value;
    });
  },
);
```

```dart
Row(
  children: [
    TSwitch(
      value: _isEnabled,
      width: 56,
      height: 32,
      onChanged: (value) {
        setState(() {
          _isEnabled = value;
        });
      },
    ),
    const SizedBox(width: 8),
    Text('Equal split'),
  ],
);
```

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