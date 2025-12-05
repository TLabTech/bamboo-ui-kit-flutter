# Tile Group

Overview
- TGroupTile is a grouped tile container.

Features
- Group multiple TTile items into a single card-like container.
- Optional titled header for the group.
- Toggleable internal dividers (enableBorder / enableBorder).
- Optional radio selection across tiles (enableRadio) with parent callbacks.
- Customizable background and border colors.
- Integrates with TThemeManager and TFont helpers for consistent styling.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage
```dart
TGroupTile(
  enableBorder: true,
  tiles: [
    TTile(
      title: "Profile",
      subtitle: "Manage your profile",
      detail: "Edit",
      prefixIcon: Icon(
        Icons.person_outline,
        color: isDarkMode ? Colors.white : Colors.black54,
      ),
      suffixIcon: Icon(
        Icons.chevron_right,
        color: isDarkMode ? Colors.white : Colors.black54,
      ),
      onPress: () {
        print('pressing profile');
      },
      enable: false,
    ),
    TTile(
      title: "Security",
      subtitle: "Change password & security settings",
      detail: "Update",
      prefixIcon: Icon(
        Icons.lock_outline,
        color: isDarkMode ? Colors.white : Colors.black54,
      ),
      suffixIcon: Icon(
        Icons.chevron_right,
        color: isDarkMode ? Colors.white : Colors.black54,
      ),
      onPress: () {
        print('pressing security');
      },
    ),
    TTile(
      title: "Notifications",
      subtitle: "Customize notification preferences",
      detail: "Manage",
      prefixIcon: Icon(
        Icons.notifications_outlined,
        color: isDarkMode ? Colors.white : Colors.black54,
      ),
      suffixIcon: Icon(
        Icons.chevron_right,
        color: isDarkMode ? Colors.white : Colors.black54,
      ),
    ),
  ],
)
```

UI Preview

![Tile Group Preview](../assets/tile/tile_group_preview.gif)

### Additional Usage Examples

### No-divider group
```dart
TGroupTile(
  enableBorder: false,
  tiles: [
    TTile(
      title: "Profile",
      subtitle: "Manage your profile",
      detail: "Edit",
      prefixIcon: Icon(Icons.person_outline),
      suffixIcon: Icon(Icons.chevron_right),
      onPress: () => print('pressing profile'),
    ),
    TTile(
      title: "Security",
      subtitle: "Change password & security settings",
      detail: "Update",
      prefixIcon: Icon(Icons.lock_outline),
      suffixIcon: Icon(Icons.chevron_right),
      onPress: () => print('pressing security'),
    ),
    TTile(
      title: "Notifications",
      subtitle: "Customize notification preferences",
      detail: "Manage",
      prefixIcon: Icon(Icons.notifications_outlined),
      suffixIcon: Icon(Icons.chevron_right),
      enable: false,
    ),
  ],
)
```

### Enable radio selection (single choice across tiles)
```dart
TGroupTile<String>(
  title: "Choose network",
  enableRadio: true,
  initialValue: "wifi_home",
  onChanged: (value) {
    print('Selected: $value');
  },
  tiles: [
    TTile(
      title: "Home Wi‑Fi",
      value: "wifi_home",
      showRadio: true,
    ),
    TTile(
      title: "Office Wi‑Fi",
      value: "wifi_office",
      showRadio: true,
    ),
    TTile(
      title: "Public Hotspot",
      value: "wifi_public",
      showRadio: true,
    ),
  ],
)
```