# Header

Overview
The Header component is a versatile and customizable AppBar widget used to display page titles, navigation controls, search fields, brand logos, and user-defined actions across different screen contexts in a Flutter application.

Features
- Multiple header modes: default, nested, homepage, search, and brand
- Configurable title, subtitle, and center alignment
- Optional back navigation behavior
- Support for prefix action, suffix action, and leading avatar
- Search bar mode with text input callbacks
- Brand-only mode for logo-centric layouts
- Theming compatibility using TThemeManager
- Supports custom icons, widgets, and flexible layout composition

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage
```dart
THeader(
  title: "Placeholder",
  suffixAction: [
    THeaderAction(
      icon: SvgPicture.asset(
        Assets.svg.magnifyingGlass,
        width: 18,
        height: 18,
        colorFilter: ColorFilter.mode(
          isDarkMode ? Colors.white : Colors.black,
          BlendMode.srcIn,
        ),
      ),
      onPress: () {},
    ),
    THeaderAction(
      icon: Icon(Icons.more_horiz_rounded),
      onPress: () {},
    ),
  ],
);
```

Preview

![Header Preview](../assets/header/header_preview.gif)

## Variants

### Searchable dropdown
```dart
// TDropdownSearch with map items and custom displayText
TDropdownSearch<Map<String, String>>(
  hint: "Select province",
  list: items,
  value: selectedItem != null
      ? items.firstWhere((item) => item["value"] == selectedItem)
      : null,
  textEditingController: TextEditingController(),
  displayText: (Map<String, String> province) => province["value"] ?? '',
  onChanged: (Map<String, String> province) {
    setState(() {
      selectedItem = province["value"];
    });
  },
  backgroundColor: HexColor(baseWhite),
  borderColor: theme.border,
);
```

### Nested Header
```dart
THeader.nested(
  title: "Placeholder",
  enableCenterTitle: true,
  suffixAction: [
    THeaderAction(
      icon: Icon(Icons.more_horiz_rounded),
      onPress: () {},
    ),
  ],
);
```

### Homepage Header
```dart
THeader.homepage(
  title: "Placeholder",
  subtitle: "description",
  prefixAction: TAvatar(
    imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
    predefinedSize: AvatarSize.large,
    type: AvatarType.general,
    shape: AvatarShape.circle,
  ),
  suffixAction: [
    THeaderAction(
      icon: Icon(Icons.more_horiz_rounded),
      onPress: () {},
    ),
  ],
);
```

### Search Header
```dart
THeader.search(
  hintText: 'Placeholder',
  iconColor: isDarkMode ? Colors.white : Colors.black,
  onChanged: (value) {
    // Handle typing
  },
  onSubmitted: (value) {
    // Handle search submit
  },
);
```

### Brand Header
```dart
THeader.brand(
  icon: SvgPicture.asset(Assets.svg.logo),
  suffixAction: [
    THeaderAction(
      icon: TAvatar(
        imageUrl: "https://randomuser.me/api/portraits/women/2.jpg",
        shape: AvatarShape.circle,
        size: 40,
        backgroundColor: theme.accent,
      ),
      onPress: () {},
    ),
    THeaderAction(
      icon: TAvatar(
        icon: Icon(
          Icons.more_horiz_rounded,
          color: theme.foreground,
        ),
        shape: AvatarShape.circle,
        size: 40,
        backgroundColor: theme.accent,
      ),
      onPress: () {},
    ),
  ],
);
```