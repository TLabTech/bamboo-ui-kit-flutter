import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Defines the shape of the avatar.
enum AvatarShape { circle, roundedSquare }

/// Defines predefined sizes for the avatar.
enum AvatarSize { small, medium, large }

/// Defines the type of avatar, which affects additional indicators.
enum AvatarType { notification, general, online }

/// A customizable avatar widget that supports images, icons, text, and badges.
///
/// The `TAvatar` widget provides a profile/avatar display with flexible
/// configuration options, including shape, size, and additional status indicators
/// such as notifications and online status.
///
/// ### Example Usage:
/// ```dart
/// TAvatar(
///   predefinedSize: AvatarSize.medium,
///   shape: AvatarShape.circle,
///   imageUrl: "https://example.com/avatar.jpg",
///   type: AvatarType.online,
/// )
/// ```
///
/// This will create a medium-sized circular avatar with an image and an online indicator.
///
/// ### Features:
/// - Customizable shape (circle or rounded square).
/// - Supports predefined sizes or a custom size.
/// - Can display an image, icon, or text initials.
/// - Optional notification badge or online status indicator.
class TAvatar extends StatelessWidget {
  /// Custom size of the avatar (overrides predefined sizes if set).
  final double? size;

  /// Predefined avatar size (`small`, `medium`, `large`).
  final AvatarSize? predefinedSize;

  /// Type of avatar (general, with notification badge, or with online indicator).
  final AvatarType type;

  /// Shape of the avatar (circle or rounded square).
  final AvatarShape shape;

  /// Optional icon displayed inside the avatar.
  final Widget? icon;

  /// URL of the image to display inside the avatar.
  final String? imageUrl;

  /// Text to display inside the avatar (used if no image or icon is provided).
  final String? text;

  /// Background color of the avatar.
  final Color backgroundColor;

  /// Text style for the displayed text.
  final TextStyle? textStyle;

  /// Notification count to display in the badge (only applies if `type` is `notification`).
  final int? notificationCount;

  /// Creates an instance of `TAvatar`.
  ///
  /// - [size]: Custom size of the avatar.
  /// - [predefinedSize]: Predefined size (`small`, `medium`, `large`).
  /// - [type]: Defines avatar behavior (default is `general`).
  /// - [shape]: Defines the shape (`circle` or `roundedSquare`).
  /// - [icon]: Displays an icon inside the avatar.
  /// - [imageUrl]: Displays an image inside the avatar.
  /// - [text]: Displays text initials inside the avatar.
  /// - [backgroundColor]: Background color when no image is present.
  /// - [textStyle]: Custom text style for text initials.
  /// - [notificationCount]: Number to display in the notification badge.
  ///
  /// **Note:** Only one of `icon`, `imageUrl`, or `text` must be provided.
  TAvatar({
    super.key,
    this.size,
    this.predefinedSize,
    this.type = AvatarType.general,
    this.shape = AvatarShape.circle,
    this.icon,
    this.imageUrl,
    this.text,
    this.backgroundColor = Colors.grey,
    this.textStyle,
    this.notificationCount,
  }) : assert(
          [icon, text, imageUrl].where((element) => element != null).length ==
              1,
          'Provide either text, imageUrl, or icon.',
        );

  /// Determines the avatar size based on the predefined size or custom size.
  double get avatarSize {
    if (size != null) return size!;
    switch (predefinedSize) {
      case AvatarSize.small:
        return 24.0;
      case AvatarSize.medium:
        return 32.0;
      case AvatarSize.large:
        return 44.0;
      default:
        return 32.0;
    }
  }

  /// Determines the border radius for rounded square or circle shape.
  double get borderRadius {
    if (shape == AvatarShape.circle) {
      return avatarSize / 2;
    }
    switch (predefinedSize) {
      case AvatarSize.large:
        return 16;
      case AvatarSize.medium:
        return 12;
      case AvatarSize.small:
        return 8;
      default:
        return 12;
    }
  }

  /// Determines the size of the notification or online badge.
  double get badgeSize {
    if (size != null) return size! * 0.2;
    switch (predefinedSize) {
      case AvatarSize.large:
        return 12;
      case AvatarSize.medium:
        return 10;
      case AvatarSize.small:
        return 6;
      default:
        return 10;
    }
  }

  /// Extracts formatted text initials (first two letters).
  String? get formattedText {
    if (text == null || text!.trim().isEmpty) return null;
    final trimmed = text!.trim().toUpperCase();
    return trimmed.length > 2 ? trimmed.substring(0, 2) : trimmed;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            width: avatarSize,
            height: avatarSize,
            color: backgroundColor,
            alignment: Alignment.center,
            child: _buildContent(theme),
          ),
        ),
        if (type == AvatarType.notification) _buildNotificationBadge(context),
        if (type == AvatarType.online) _buildOnlineIndicator(theme),
      ],
    );
  }

  /// Builds the avatar content (icon, text, or image).
  Widget _buildContent(TTheme theme) {
    if (icon != null) {
      return icon!;
    } else if (formattedText != null) {
      return Text(
        formattedText!,
        style: textStyle ??
            TextStyle(
              color: theme.primaryForeground,
              fontSize: avatarSize * 0.3,
              fontWeight: FontWeight.bold,
            ),
      );
    } else if (imageUrl != null) {
      return Image.network(
        imageUrl!,
        width: avatarSize,
        height: avatarSize,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Icon(
          Icons.error,
          color: theme.destructive,
          size: avatarSize * 0.4,
        ),
      );
    } else {
      return Icon(
        Icons.person,
        color: theme.primaryForeground,
        size: avatarSize * 0.5,
      );
    }
  }

  /// Builds a notification badge for the avatar.
  Widget _buildNotificationBadge(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    return Positioned(
      top: -1,
      right: -1,
      child: Container(
        width: badgeSize,
        height: badgeSize,
        decoration: BoxDecoration(
          color: theme.destructive,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            notificationCount == null ? "" : notificationCount.toString(),
            style: TFontRegular.caption2(context).copyWith(
              color: theme.destructiveForeground,
              fontSize: badgeSize * 0.6,
            ),
          ),
        ),
      ),
    );
  }

  /// Builds an online status indicator for the avatar.
  Widget _buildOnlineIndicator(TTheme theme) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: badgeSize,
        height: badgeSize,
        decoration: BoxDecoration(
          color: theme.success,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
