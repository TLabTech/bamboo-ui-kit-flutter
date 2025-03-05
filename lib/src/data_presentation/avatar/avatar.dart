import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';

enum AvatarShape { circle, roundedSquare }
enum AvatarSize { small, medium, large }
enum AvatarType { notification, general, online }

class TAvatar extends StatelessWidget {
  final double? size;
  final AvatarSize? predefinedSize;
  final AvatarType type;
  final AvatarShape shape;
  final Widget? icon;
  final String? imageUrl;
  final String? text;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final int? notificationCount;

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

  String? get formattedText {
    if (text == null || text!.trim().isEmpty) return null;
    final trimmed = text!.trim().toUpperCase();
    return trimmed.length > 2 ? trimmed.substring(0, 2) : trimmed;
  }

  @override
  Widget build(BuildContext context) {
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
            child: _buildContent(),
          ),
        ),
        if (type == AvatarType.notification) _buildNotificationBadge(),
        if (type == AvatarType.online) _buildOnlineIndicator(),
      ],
    );
  }

  Widget _buildContent() {
    if (icon != null) {
      return icon!;
    } else if (formattedText != null) {
      return Text(
        formattedText!,
        style: textStyle ??
            TextStyle(
              color: Colors.white,
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
          color: Colors.red,
          size: avatarSize * 0.4,
        ),
      );
    } else {
      return Icon(Icons.person, color: Colors.white, size: avatarSize * 0.5);
    }
  }

  Widget _buildNotificationBadge() {
    return Positioned(
      top: -1,
      right: -1,
      child: Container(
        width: badgeSize,
        height: badgeSize,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            notificationCount == null ? "" : notificationCount.toString(),
            style: TFontRegular.caption2
                .copyWith(color: Colors.white, fontSize: badgeSize * 0.6),
          ),
        ),
      ),
    );
  }

  Widget _buildOnlineIndicator() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: badgeSize,
        height: badgeSize,
        decoration: BoxDecoration(
          color: HexColor(success500),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
