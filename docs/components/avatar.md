# TAvatar

Overview
- A flexible avatar widget for displaying user images, icons, or initials with optional notification badges and online indicators. Use TAvatar for profile pictures, contact lists, and presence/status displays across your app.

Features
- Supports image, icon, or text initials as content.
- Predefined sizes: small, medium, large — or provide a custom size.
- Shapes: circle or rounded square.
- Avatar types: general, notification (badge count), online (presence indicator).
- Loading and error handling for network images with customizable indicators/icons.
- Theme-aware colors and typography via TThemeManager and TFont helpers.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage Example

```dart
// Large circular avatars: icon, initials, and remote image
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    TAvatar(
      icon: Icon(
        Icons.account_circle,
        color: HexColor(gray500),
      ),
      predefinedSize: AvatarSize.large,
      type: AvatarType.general,
      shape: AvatarShape.circle,
      backgroundColor: HexColor('#D9D9D9'),
    ),
    TAvatar(
      text: "IU",
      predefinedSize: AvatarSize.large,
      type: AvatarType.general,
      shape: AvatarShape.circle,
      backgroundColor: HexColor(primary500),
    ),
    TAvatar(
      imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
      predefinedSize: AvatarSize.large,
      type: AvatarType.general,
      shape: AvatarShape.circle,
      backgroundColor: HexColor(primary500),
    ),
  ],
);
```

UI Preview

![Avatar Preview](../assets/avatar/avatar_preview.gif)

## Additional Usage Examples

### Medium avatars (icon, initials, image)
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    TAvatar(
      icon: Icon(Icons.account_circle, size: 15, color: HexColor(gray500)),
      predefinedSize: AvatarSize.medium,
      shape: AvatarShape.circle,
      backgroundColor: HexColor('#D9D9D9'),
    ),
    TAvatar(
      text: "IU",
      predefinedSize: AvatarSize.medium,
      shape: AvatarShape.circle,
      backgroundColor: HexColor(primary500),
    ),
    TAvatar(
      imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
      predefinedSize: AvatarSize.medium,
      shape: AvatarShape.circle,
      backgroundColor: HexColor(primary500),
    ),
  ],
);
```

### Small avatars
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    TAvatar(
      icon: Icon(Icons.account_circle, size: 13, color: HexColor(gray500)),
      predefinedSize: AvatarSize.small,
      shape: AvatarShape.circle,
      backgroundColor: HexColor('#D9D9D9'),
    ),
    TAvatar(
      text: "IU",
      predefinedSize: AvatarSize.small,
      shape: AvatarShape.circle,
      backgroundColor: HexColor(primary500),
    ),
    TAvatar(
      imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
      predefinedSize: AvatarSize.small,
      shape: AvatarShape.circle,
      backgroundColor: HexColor(primary500),
    ),
  ],
);
```

### Notification badge
```dart
TAvatar(
  icon: Icon(Icons.account_circle, size: 15, color: HexColor(gray500)),
  predefinedSize: AvatarSize.medium,
  type: AvatarType.notification,
  notificationCount: 5,
  shape: AvatarShape.circle,
  backgroundColor: HexColor('#D9D9D9'),
);
```

### Online indicator
```dart
TAvatar(
  text: "IU",
  predefinedSize: AvatarSize.medium,
  type: AvatarType.online,
  shape: AvatarShape.circle,
  backgroundColor: HexColor(primary500),
);
```

### Rounded-square avatars
```dart
TAvatar(
  imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
  predefinedSize: AvatarSize.large,
  type: AvatarType.general,
  shape: AvatarShape.roundedSquare,
  backgroundColor: HexColor(primary500),
);
```