# Badge

Overview
- TBadge is a compact, themable label component for highlighting status, categories, or small pieces of metadata. Use it where you need visual tags such as primary/secondary labels, outlined chips, destructive warnings, or general badges.

Features
- Multiple predefined styles: primary, secondary, outline, destructive, and general.
- Small, intrinsic sizing with configurable corner radius.
- Theme-aware colors via TThemeManager and TFont helpers.
- Simple named constructors for common variants.
- Supports color overrides for background, text, and border.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage Example
```dart
// Simple primary badge inside a container
TBadge.primary(
  label: "Badge",
);
```

UI Preview

![Badge Preview](../assets/badge/badge_preview.gif)

## Variant

### Secondary badge
```dart
TBadge.secondary(
  label: "Badge",
);
```

### Outline badge
```dart
TBadge.outline(
  label: "Badge",
);
```

### Destructive badge
```dart
TBadge.destructive(
  label: "Badge",
);
```

### General badge
```dart
TBadge.general(
  label: "Badge",
);
```

### Custom colors and radius
```dart
TBadge(
  label: "Custom",
  backgroundColor: Colors.purple.shade50,
  textColor: Colors.purple,
  borderColor: Colors.purple.shade200,
  radius: 12,
);
```