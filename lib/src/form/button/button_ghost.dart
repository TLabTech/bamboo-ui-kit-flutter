import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/theme.dart';
import '../../fondation/tfont.dart';

class TButtonGhost extends StatefulWidget {
  final String? text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? child;
  final bool loading;
  final Color? normalColor;
  final Color? pressedColor;

  const TButtonGhost({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.loading = false,
    this.child,
    this.normalColor,
    this.pressedColor,
  });

  const TButtonGhost.icon({
    super.key,
    required Widget icon,
    required this.onPressed,
    this.textStyle,
    this.loading = false,
    this.normalColor,
    this.pressedColor,
  })  : child = icon,
        text = null,
        suffixIcon = null,
        prefixIcon = null;

  @override
  State<TButtonGhost> createState() => _TButtonGhostState();
}

class _TButtonGhostState extends State<TButtonGhost> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed?.call();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Container(
        color: Colors.transparent,
        padding:
            const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 22, right: 22),
        child: widget.loading
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      color: _isPressed ? theme.primaryPressed : theme.primary,
                    ),
                  ),
                  if (widget.text != null) SizedBox(width: 8),
                  if (widget.text != null)
                    Text(
                      widget.text!,
                      style: widget.textStyle ??
                          TFontBold.body(context).copyWith(
                            color: _isPressed
                                ? theme.primaryPressed
                                : theme.primary,
                          ),
                    ),
                ],
              )
            : widget.child ?? _buildContent(_isPressed),
      ),
    );
  }

  Widget _buildContent(bool isPressed) {
    final theme = context.watch<TThemeManager>().state;
    bool hasPrefix = widget.prefixIcon != null;
    bool hasSuffix = widget.suffixIcon != null;
    bool hasOnlyText = !hasPrefix && !hasSuffix;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (widget.prefixIcon != null) widget.prefixIcon!,
        if (widget.prefixIcon != null && widget.text != null)
          SizedBox(width: 10),
        if (widget.text != null)
          Expanded(
            child: Text(
              widget.text!,
              textAlign: hasOnlyText ? TextAlign.center : TextAlign.left,
              style: widget.textStyle ??
                  TFontBold.body(context).copyWith(
                    color: _isPressed
                        ? (widget.pressedColor ?? theme.primaryPressed)
                        : (widget.normalColor ?? theme.primary),
                  ),
            ),
          ),
        if (widget.suffixIcon != null && widget.text != null)
          SizedBox(width: 10),
        if (widget.suffixIcon != null) widget.suffixIcon!,
      ],
    );
  }
}
