# CheckBox

Overview

A lightweight, themable checkbox component.

Features

- Simple boolean selection with onChanged callback.
- Optional label and description display.
- Disabled state when onChanged is null.
- Easy integration with TThemeManager for consistent colors and typography.
- Works inside checkbox groups when managed by parent state.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage 

```dart
// Basic checkbox with label
TCheckBox(
  initialValue: _isDefaultChecked,
  onChanged: (value) {
    // handle change
    print('Checked: $v');
  },
  label: 'Receive notifications',
);
```

Preview

![Check Box Preview](../assets/checkbox/check_box_preview.gif)

## Additional Usage Examples

```dart
TCheckBox(
  initialValue: _isDefaultChecked,
  onChanged: (value) {
    // handle change
    print('Checked: $v');
  },
  label: 'Receive notifications',
  description: "Description",
  error: "your message",
  inactiveColor: Color(0xffF6F7F9),
  borderColor: Colors.transparent,
  isEnabled: true,
  isError: false,
);
```
