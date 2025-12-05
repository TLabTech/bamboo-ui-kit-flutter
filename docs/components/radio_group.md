# Radio Group Button

Overview
- A labeled radio group widget for single-choice selection from a list of values. Use Radio Group Button (TRadioGroup) to present multiple radio options with a shared group value and a single onChanged callback managed by the parent.

Features
- Render a labeled list of radio options from values and items arrays.
- Single selection with parent-managed selectedValue and onChanged callback.
- Label with customizable TextStyle.
- Integrates with TThemeManager and TFont helpers for consistent theming and typography.
- Easy to use inside forms, dialogs, and settings screens.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage

```dart
String? selectedOption;

TRadioGroup<String>(
  label: "Label",
  values: ['Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'],
  items: ['Label', 'Label', 'Label', 'Label', 'Label'],
  selectedValue: selectedOption,
  onChanged: (value) {
    setState(() {
      selectedOption = value;
      print('radioGroupValue $value');
    });
  },
);
```

Preview

![Radio Group Preview](../assets/radio/radio_group_preview.gif)

## Additional Usage Examples

```dart
TRadioGroup<String>(
  label: "Payment method",
  labelStyle: TFontBold.body(context).copyWith(fontSize: 16),
  values: ['card', 'wallet', 'bank'],
  items: ['Credit Card', 'Wallet', 'Bank Transfer'],
  selectedValue: selectedOption,
  onChanged: (value) {
    setState(() => selectedOption = value);
  },
);
```
