# Radio Button

Overview
- A compact, themable radio button component for single-choice selection. Use TRadioButton when you need a selectable option with an optional description and inline error/disabled states. It pairs well with form layouts and grouped radio lists.

Features
- Single-value selection with onChanged callback.
- Optional description and error message display.
- Disabled and error visual states.
- Theming via TThemeManager and consistent typography via TFont helpers.
- Tapable row (label + description) for improved hit area and accessibility.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage

```dart
String? _selectedDefaultValue;

// ...

TRadioButton<String>(
  value: "label",
  groupValue: _selectedDefaultValue ?? '',
  onChanged: (newValue) {
    setState(() {
      if (_selectedDefaultValue == newValue) {
        _selectedDefaultValue = null;
      } else {
        _selectedDefaultValue = newValue;
      }
    });
  },
  label: "Label",
  description: "Description.",
  error: "error message",
  isDisabled: false,
  isError: false,
);
```

Preview

![Radio Button Preview](../assets/radio/radio_button_preview.gif)

## Additional Usage Examples

### Disable Radio

```dart
TRadioButton<String>(
  value: "label",
  groupValue: _selectedDisableValue ?? '',
  onChanged: (newValue) {},
  label: "Label",
  description: "Description.",
  isDisabled: true,
);
```

### Error state
```dart
TRadioButton<String>(
  value: "label",
  groupValue: _selectedErrorValue ?? '',
  onChanged: (newValue) {
    setState(() {
      if (_selectedErrorValue == newValue) {
        _selectedErrorValue = null;
      } else {
        _selectedErrorValue = newValue;
      }
    });
  },
  label: "Label",
  description: "Description.",
  error: "Error description.",
  isError: true,
);
```
