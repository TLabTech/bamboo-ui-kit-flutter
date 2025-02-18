import 'package:flutter/material.dart';

class TAvatar extends StatelessWidget {
  final double radius;
  final Color backgroundColor;
  final Widget? icon;
  final String? _text;
  final String? imageUrl;
  final TextStyle? textStyle;
  final Color? iconColor;

  String? get text {
    if (_text == null) return null;
    return _text.length > 2 ? _text.substring(0, 2) : _text;
  }

  TAvatar({
    super.key,
    this.radius = 40.0,
    this.backgroundColor = Colors.grey,
    this.icon,
    String? text,
    this.imageUrl,
    this.textStyle,
    this.iconColor,
  }): _text = text {
    final nonNullCount =
        [icon, text, imageUrl].where((element) => element != null).length;
    if (nonNullCount != 1) {
      throw ArgumentError(
          'Exactly one of icon, text, or imageUrl must be provided.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (icon != null) {
      return icon!;
    } else if (text != null) {
      return Text(
        text!,
        style: textStyle ??
            TextStyle(
              color: Colors.white,
              fontSize: radius * 0.6,
              fontWeight: FontWeight.bold,
            ),
      );
    } else if (imageUrl != null) {
      // Render an image
      return ClipOval(
        child: Image.network(
          imageUrl!,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.error,
              color: Colors.red,
            ); // Fallback for invalid images
          },
        ),
      );
    } else {
      // Default fallback (should not reach here due to validation)
      return Icon(Icons.person, color: Colors.white);
    }
  }
}
