import 'package:flutter/material.dart';

enum AvatarShape { circle, roundedSquare }

class TAvatar extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final Widget? icon;
  final String? text;
  final String? imageUrl;
  final TextStyle? textStyle;
  final AvatarShape shape;
  final double borderRadius;

  TAvatar({
    super.key,
    this.size = 80.0,
    this.backgroundColor = Colors.grey,
    this.icon,
    this.text,
    this.imageUrl,
    this.textStyle,
    this.shape = AvatarShape.circle,
    double? borderRadius,
  })  : assert(
          [icon, text, imageUrl].where((element) => element != null).length ==
              1,
          'Exactly one of icon, text, or imageUrl must be provided.',
        ),
        borderRadius =
            borderRadius ?? (shape == AvatarShape.circle ? size / 2 : 12);

  String? get formattedText {
    if (text == null || text!.trim().isEmpty) return null;
    final trimmed = text!.trim().toUpperCase();
    return trimmed.length > 2 ? trimmed.substring(0, 2) : trimmed;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: size,
        height: size,
        color: backgroundColor,
        alignment: Alignment.center,
        child: _buildContent(),
      ),
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
              fontSize: size * 0.3,
              fontWeight: FontWeight.bold,
            ),
      );
    } else if (imageUrl != null) {
      return Image.network(
        imageUrl!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.error,
            color: Colors.red,
          );
        },
      );
    } else {
      return Icon(Icons.person, color: Colors.white);
    }
  }
}
