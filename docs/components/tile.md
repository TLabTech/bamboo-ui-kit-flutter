# Tile

Overview
- TTile is a flexible list/tile component for settings, lists, and menus.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage
```dart
TTile<String>(
  title: "Personalization",
  prefixIcon: SvgPicture.asset(
    Assets.svg.user,
    colorFilter: ColorFilter.mode(
      isDarkMode ? Colors.white : Colors.black,
      BlendMode.srcIn,
    ),
  ),
  suffixIcon: SvgPicture.asset(
    Assets.svg.chevronRight,
    colorFilter: ColorFilter.mode(
      isDarkMode ? Colors.white : Colors.black,
      BlendMode.srcIn,
    ),
  ),
);
```

Preview

![Tile Preview](../assets/tile/tile_preview.gif)

## Additional Usage Examples

### Disable Tile
```dart
TTile<String>(
  title: "Personalization",
  prefixIcon: SvgPicture.asset(Assets.svg.user,
    colorFilter: ColorFilter.mode(HexColor(gray500), BlendMode.srcIn),
  ),
  suffixIcon: SvgPicture.asset(Assets.svg.chevronRight,
    colorFilter: ColorFilter.mode(HexColor(gray500), BlendMode.srcIn),
  ),
  enable: false,
);
```

### Title and Subtitle
```dart
TTile<String>(
  title: "Notifications",
  subtitle: "Banner, sound, badges",
  prefixIcon: SvgPicture.asset(Assets.svg.bell,
    colorFilter: ColorFilter.mode(isDarkMode ? Colors.white : Colors.black, BlendMode.srcIn),
  ),
  suffixIcon: SvgPicture.asset(Assets.svg.chevronRight,
    colorFilter: ColorFilter.mode(isDarkMode ? Colors.white : Colors.black, BlendMode.srcIn),
  ),
);
```

### Tile with radio
```dart
TTile<String>(
  title: "Wifi",
  prefixIcon: SvgPicture.asset(Assets.svg.wifi,
    colorFilter: ColorFilter.mode(isDarkMode ? Colors.white : Colors.black, BlendMode.srcIn),
  ),
  value: "wifi",
  groupValue: wifiSelected,
  onChanged: (value) {
    setState(() {
      if (wifiSelected == value) wifiSelected = null;
      else wifiSelected = value;
    });
  },
  showRadio: true,
);
```