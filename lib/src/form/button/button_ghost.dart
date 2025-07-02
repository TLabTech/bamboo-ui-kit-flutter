import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/theme.dart';
import '../../fondation/tfont.dart';

class TButtonGhost extends StatefulWidget {
  final String? text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? child;
  final bool loading;
  final Color? normalColor;
  final Color? pressedColor;
  final bool centerContent;

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
    this.padding,
    this.centerContent = true,
  });

  const TButtonGhost.icon({
    super.key,
    required Widget icon,
    required this.onPressed,
    this.textStyle,
    this.loading = false,
    this.normalColor,
    this.pressedColor,
    this.centerContent = true,
  })  : child = icon,
        text = null,
        suffixIcon = null,
        prefixIcon = null,
        padding = EdgeInsets.zero;

  @override
  State<TButtonGhost> createState() => _TButtonGhostState();
}

class _TButtonGhostState extends State<TButtonGhost> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.loading
          ? null
          : (_) {
              setState(() {
                _isPressed = true;
              });
            },
      onTapUp: widget.loading
          ? null
          : (_) {
              setState(() {
                _isPressed = false;
              });
              widget.onPressed?.call();
            },
      onTapCancel: widget.loading
          ? null
          : () {
              setState(() {
                _isPressed = false;
              });
            },
      child: Container(
        color: Colors.transparent,
        padding: widget.padding ??
            const EdgeInsets.only(
              top: 16.0,
              bottom: 16.0,
              left: 22,
              right: 22,
            ),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;

    if (widget.child != null) {
      return widget.child!;
    }

    Widget? leadingIcon = widget.loading
        ? SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              color: _isPressed
                  ? (widget.pressedColor ?? theme.primaryPressed)
                  : (widget.normalColor ?? theme.primary),
            ),
          )
        : widget.prefixIcon;

    Widget? trailingIcon = widget.loading ? null : widget.suffixIcon;

    List<Widget> children = [];

    if (leadingIcon != null) {
      children.add(leadingIcon);
    }

    if (leadingIcon != null && widget.text != null) {
      children.add(const SizedBox(width: 10));
    }

    if (widget.text != null) {
      children.add(
        Text(
          widget.text!,
          style: widget.textStyle ??
              TFontBold.body(context).copyWith(
                color: _isPressed
                    ? (widget.pressedColor ?? theme.primaryPressed)
                    : (widget.normalColor ?? theme.primary),
              ),
        ),
      );
    }

    if (trailingIcon != null && widget.text != null) {
      children.add(const SizedBox(width: 10));
    }

    if (trailingIcon != null) {
      children.add(trailingIcon);
    }

    bool hasLeading = leadingIcon != null;
    bool hasTrailing = trailingIcon != null;
    bool hasOnlyText = !hasLeading && !hasTrailing;

    if (!widget.centerContent) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (hasLeading) children[0],
          // leading icon
          if (hasLeading && widget.text != null) children[1],
          // spacing
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
          if (hasTrailing && widget.text != null) children[children.length - 2],
          // spacing
          if (hasTrailing) children.last,
          // trailing icon
        ],
      );
    }

    if (hasOnlyText) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    } else if (hasLeading && !hasTrailing) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    } else if (!hasLeading && hasTrailing) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          children[0],
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children.sublist(1, children.length - 1),
            ),
          ),
          children.last,
        ],
      );
    }
  }
}
