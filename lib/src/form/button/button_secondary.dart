import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/theme.dart';

class TButtonSecondary extends StatefulWidget {
  final String? text;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Duration longPressDuration;
  final Color? backgroundColor;
  final Color? onPressedBackgroundColor;
  final Color? loadingColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool loading;
  final Widget? child;
  final Size minimumSize;
  final Size maximumSize;
  final double minFontSize;
  final bool centerContent;

  const TButtonSecondary({
    super.key,
    required this.text,
    required this.onPressed,
    this.onLongPress,
    this.longPressDuration = const Duration(seconds: 1),
    this.backgroundColor,
    this.onPressedBackgroundColor,
    this.loadingColor,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.only(top: 10, bottom: 10, left: 12, right: 12),
    this.textStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.loading = false,
    this.child,
    this.minimumSize = const Size(double.infinity, 48),
    this.maximumSize = const Size(double.infinity, 48),
    this.minFontSize = 12.0,
    this.centerContent = true,
  });

  const TButtonSecondary.icon({
    super.key,
    required Widget icon,
    required this.onPressed,
    this.onLongPress,
    this.longPressDuration = const Duration(seconds: 1),
    this.backgroundColor,
    this.onPressedBackgroundColor,
    this.loadingColor,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.only(top: 10, bottom: 10, left: 12, right: 12),
    this.textStyle,
    this.loading = false,
    this.minimumSize = const Size(48, 48),
    this.maximumSize = const Size(48, 48),
    this.minFontSize = 12.0,
    this.centerContent = true,
  })  : child = icon,
        text = null,
        suffixIcon = null,
        prefixIcon = null;

  @override
  State<TButtonSecondary> createState() => _TButtonSecondaryState();
}

class _TButtonSecondaryState extends State<TButtonSecondary> {
  Timer? _longPressTimer;
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    if (widget.loading || widget.onPressed == null) return;

    setState(() => _isPressed = true);

    if (widget.onLongPress != null) {
      _longPressTimer = Timer(widget.longPressDuration, () {
        _longPressTimer = null;
        widget.onLongPress?.call();
      });
    }
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);

    if (widget.onLongPress != null && _longPressTimer != null) {
      _cancelTimer();
      widget.onPressed?.call();
    } else if (widget.onLongPress == null) {
      widget.onPressed?.call();
    }
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
    _cancelTimer();
  }

  void _cancelTimer() {
    _longPressTimer?.cancel();
    _longPressTimer = null;
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;

    return GestureDetector(
      onTapDown: widget.loading ? null : _handleTapDown,
      onTapUp: widget.loading ? null : _handleTapUp,
      onTapCancel: widget.loading ? null : _handleTapCancel,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: _getBackgroundColor(theme),
          padding: widget.padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          side: BorderSide(width: 1.0, color: theme.border),
          minimumSize: widget.minimumSize,
          maximumSize: widget.maximumSize,
          foregroundColor: _getTextColor(theme),
        ).copyWith(
          backgroundColor: WidgetStateProperty.all(_getBackgroundColor(theme)),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ),
        onPressed: null,
        child: _buildContent(context),
      ),
    );
  }

  Color _getBackgroundColor(TTheme theme) {
    if (widget.loading) return widget.backgroundColor ?? Colors.transparent;
    return _isPressed
        ? (widget.onPressedBackgroundColor ?? Colors.transparent)
        : (widget.backgroundColor ?? Colors.transparent);
  }

  Color _getTextColor(TTheme theme) {
    if (widget.loading) {
      return theme.foreground;
    }
    return _isPressed
        ? theme.foreground.withValues(alpha: 0.7)
        : theme.foreground;
  }

  Widget _buildContent(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    final textColor = _getTextColor(theme);

    if (widget.child != null) {
      return widget.child!;
    }

    Widget? leadingIcon = widget.loading
        ? SizedBox(
      width: 18,
      height: 18,
      child: CircularProgressIndicator(
        color: widget.loadingColor ?? theme.foreground,
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
        Flexible(
          fit: FlexFit.loose,
          child: AutoSizeText(
            widget.text!,
            maxLines: 1,
            minFontSize: widget.minFontSize,
            stepGranularity: 0.5,
            overflow: TextOverflow.ellipsis,
            style: widget.textStyle ??
                TFontBold.body(context).copyWith(color: textColor),
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
          if (hasLeading && widget.text != null) children[1],
          if (widget.text != null)
            Expanded(
              child: AutoSizeText(
                widget.text!,
                maxLines: 1,
                minFontSize: widget.minFontSize,
                textAlign:
                hasOnlyText ? TextAlign.center : TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: widget.textStyle ??
                    TFontBold.body(context).copyWith(color: theme.foreground),
              ),
            ),
          if (hasTrailing && widget.text != null)
            children[children.length - 2],
          if (hasTrailing) children.last,
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
