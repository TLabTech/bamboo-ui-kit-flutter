# Dialog

Overview
- A responsive, theme-aware dialog component for confirming actions or showing important information. Use TDialog to present messages with primary/secondary actions, supporting both horizontal (side-by-side buttons) and vertical (stacked buttons) layouts.

Features
- Horizontal and vertical button layouts via the `direction` property.
- Title and body content text with theme-aware typography.
- Primary and secondary action callbacks (`onPositivePressed`, `onNegativePressed`).
- Customizable button labels and background color.
- Easy integration with `showDialog` and `Navigator` for modal flows.
- Consistent styling via `TThemeManager` and `TFont` helpers.

## 📦 Import

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage Example

```dart
// Open a horizontal dialog (buttons side-by-side)
showDialog(
  context: context,
  builder: (builder) {
    return TDialog(
      title: 'Lorem ipsum dolor sit amet',
      content:
          "Lorem ipsum dolor sit amet consectetur. Sit sit scelerisque sed nisl sed egestas. Diam amet orci velit facilisis dui dui ullamcorper. Aliquam donec odio ipsum.",
      direction: Axis.horizontal,
      onPositivePressed: () {
        Navigator.of(context).pop();
      },
      onNegativePressed: () {
        Navigator.of(context).pop();
      },
    );
  },
);
```

```dart
// Open a vertical dialog (buttons stacked)
showDialog(
  context: context,
  builder: (builder) {
    return TDialog(
      title: 'Lorem ipsum dolor sit amet',
      content:
          "Lorem ipsum dolor sit amet consectetur. Sit sit scelerisque sed nisl sed egestas. Diam amet orci velit facilisis dui dui ullamcorper. Aliquam donec odio ipsum.",
      direction: Axis.vertical,
      onPositivePressed: () {
        Navigator.of(context).pop();
      },
      onNegativePressed: () {
        Navigator.of(context).pop();
      },
    );
  },
);
```

UI Preview

![Dialog Preview](../assets/dialog/dialog_preview.gif)

## Additional Usage Examples

### Custom button labels and background color
```dart
showDialog(
  context: context,
  builder: (_) {
    return TDialog(
      title: 'Delete item',
      content: 'Are you sure you want to delete this item? This action cannot be undone.',
      direction: Axis.horizontal,
      backgroundColor: Colors.white,
      buttonPositive: 'Delete',
      buttonNegative: 'Keep',
      onPositivePressed: () {
        // perform delete
        Navigator.of(context).pop();
      },
      onNegativePressed: () {
        Navigator.of(context).pop();
      },
    );
  },
);
```

### Use with barrierDismissible and awaiting result
```dart
final result = await showDialog<bool>(
  context: context,
  barrierDismissible: false, // require explicit action
  builder: (_) {
    return TDialog(
      title: 'Confirm',
      content: 'Proceed with this operation?',
      direction: Axis.vertical,
      onPositivePressed: () => Navigator.of(context).pop(true),
      onNegativePressed: () => Navigator.of(context).pop(false),
    );
  },
);

if (result == true) {
  // user confirmed
}
```

Dialog inside custom layout (larger width)
```dart
showDialog(
  context: context,
  builder: (_) {
    return TDialog(
      title: 'Large dialog',
      content: 'Content for a wider dialog layout.',
      direction: Axis.horizontal,
      backgroundColor: Theme.of(context).colorScheme.surface,
      onPositivePressed: () => Navigator.of(context).pop(),
      onNegativePressed: () => Navigator.of(context).pop(),
    );
  },
);
```