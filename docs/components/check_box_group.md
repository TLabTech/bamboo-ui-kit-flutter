# Check Box Group

Overview
- A simple, themable checkbox group widget for selecting multiple items. Use TCheckBoxGroup to present a labeled list of options where users can select zero or more choices and the parent widget manages the selection via a callback.

Features
- Render a labeled list of checkboxes from a string array.
- Manage initial selected values.
- Customizable active / inactive / border colors.
- Enable/disable the whole group.
- Emits selected items via onChanged callback.
- Integrates with TThemeManager and TFont helpers for consistent styling.

Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

Usage Example
- Example taken from example/lib/form/check_box_group_screen.dart

```dart
TCheckBoxGroup(
  label: "Label",
  items: ["Option 1", "Option 2", "Option 3", "Option 4"],
  initialValues: null,
  activeColor: Color(0xff00DE9C),
  inactiveColor: Color(0xffF6F7F9),
  onChanged: (selectedItems) {
    print("Selected items: $selectedItems");
  },
);
```

UI Preview
![Check Box Group Preview](../assets/checkbox/check_box_group_preview.gif)

## Additional Usage

With initial values and custom border color
```dart
TCheckBoxGroup(
  label: "Choose features",
  items: ["Search", "Notifications", "Cloud Sync"],
  initialValues: ["Notifications"],
  activeColor: Colors.blue,
  inactiveColor: Colors.grey.shade200,
  borderColor: Colors.grey.shade400,
  onChanged: (selected) {
    // selected is a List<String> of chosen items
    print("Selected: $selected");
  },
);
```

Disabled group
```dart
TCheckBoxGroup(
  label: "Options (disabled)",
  items: ["A", "B", "C"],
  initialValues: ["A"],
  isEnabled: false,
  onChanged: (selected) {
    // won't be called while isEnabled == false
    print("Selected: $selected");
  },
);
```

Custom label style
```dart
TCheckBoxGroup(
  label: "Preferences",
  labelStyle: TFontBold.headline(context).copyWith(fontSize: 16),
  items: ["Daily", "Weekly", "Monthly"],
  onChanged: (selected) => print(selected),
);
```