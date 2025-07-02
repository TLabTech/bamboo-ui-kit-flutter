import 'package:flutter/material.dart';

class THeaderAction extends StatelessWidget {
  final Widget icon;
  final FocusNode? focusNode;
  final VoidCallback? onPress;
  final VoidCallback? onLongPress;

  const THeaderAction({
    required this.icon,
    required this.onPress,
    this.focusNode,
    this.onLongPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: onPress,
      onLongPress: onLongPress,
      child: Ink(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: icon,
        ),
      ),
    );
  }
}
