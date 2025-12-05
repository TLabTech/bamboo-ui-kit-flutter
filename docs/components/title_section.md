# Title Section

Overview
- A compact, theme-aware title row with optional description, icon, and action. Use TTitleSection to present section headings in forms, cards, and settings screens where a clear title with ancillary controls is needed.

Features
- Primary title with single-line truncation.
- Optional one-line description below the title.
- Optional leading icon.
- Optional action button or icon on the right (custom text and color).
- Lightweight and easy to place inside containers, accordions, or cards.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage Example
```dart
TTitleSection(title: "Placeholder")
```

UI Preview

![Title Section Preview](../assets/title_section/title_section_preview.gif)

## Variant

### With Description
```dart
TTitleSection(
  title: "Placeholder",
  description: "Description.",
);
```

### With Icon
```dart
TTitleSection(
  title: "Placeholder",
  icon: SvgPicture.asset(
    Assets.svg.user,
    colorFilter: ColorFilter.mode(isDarkMode ? Colors.white : Colors.black, BlendMode.srcIn),
  ),
);
```

### With Description and Icon
```dart
TTitleSection(
  title: "Placeholder",
  description: "Description.",
  icon: SvgPicture.asset(
    Assets.svg.user,
    colorFilter: ColorFilter.mode(isDarkMode ? Colors.white : Colors.black, BlendMode.srcIn),
  ),
);
```

### With action button
```dart
TTitleSection(
  title: "Placeholder",
  buttonText: "Button",
  onPressed: () {
    // handle action
  },
);
```
