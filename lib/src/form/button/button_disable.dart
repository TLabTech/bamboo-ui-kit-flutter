import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/theme.dart';
import '../../fondation/tfont.dart';

class TButtonDisable extends StatefulWidget {
  final String? text;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Duration? longPressDuration;
  final Color? backgroundColor;
  final Color? onPressedBackgroundColor;
  final Color? loadingColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool loading;
  final Widget? child;
  final bool centerContent;
  final Size minimumSize;
  final Size maximumSize;
  final double minFontSize;

  const TButtonDisable({
    super.key,
    required this.text,
    required this.onPressed,
    this.onLongPress,
    this.longPressDuration,
    this.backgroundColor,
    this.onPressedBackgroundColor,
    this.loadingColor,
    this.borderRadius = 8,
    this.textStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.loading = false,
    this.child,
    this.padding = const EdgeInsets.only(top: 10, bottom: 10, left: 12, right: 12),
    this.centerContent = true,
    this.minimumSize = const Size(double.infinity, 48),
    this.maximumSize = const Size(double.infinity, 48),
    this.minFontSize = 12.0,
  });

  const TButtonDisable.icon({
    super.key,
    required Widget icon,
    required this.onPressed,
    this.onLongPress,
    this.longPressDuration,
    this.backgroundColor,
    this.onPressedBackgroundColor,
    this.loadingColor,
    this.borderRadius = 8,
    this.textStyle,
    this.loading = false,
    this.centerContent = true,
    this.minimumSize = const Size(48, 48),
    this.maximumSize = const Size(48, 48),
    this.minFontSize = 12.0,
    this.padding = const EdgeInsets.only(top: 10, bottom: 10, left: 12, right: 12),
  })  : child = icon,
        text = null,
        suffixIcon = null,
        prefixIcon = null;

  @override
  State<TButtonDisable> createState() => _TButtonDisableState();
}

class _TButtonDisableState extends State<TButtonDisable> {
  Timer? _longPressTimer;
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    if (widget.loading || widget.onPressed == null) return;

    setState(() => _isPressed = true);

    if (widget.onLongPress != null && widget.longPressDuration != null) {
      _longPressTimer = Timer(widget.longPressDuration!, () {
        widget.onLongPress?.call();
        _cancelTimer();
      });
    }
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);

    if (_longPressTimer?.isActive ?? false) {
      _cancelTimer();
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

    if (widget.longPressDuration != null) {
      return GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: Container(
          decoration: BoxDecoration(
            color: _isPressed
                ? (widget.onPressedBackgroundColor ?? theme.accent)
                : (widget.backgroundColor ?? theme.accent),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          padding: widget.padding,
          constraints: BoxConstraints(
            minWidth: widget.minimumSize.width,
            minHeight: widget.minimumSize.height,
            maxWidth: widget.maximumSize.width,
            maxHeight: widget.maximumSize.height,
          ),
          alignment: Alignment.center,
          child: _buildContent(context),
        ),
      );
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor ?? theme.accent,
        foregroundColor: theme.foreground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        padding: widget.padding,
        minimumSize: widget.minimumSize,
        maximumSize: widget.maximumSize,
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return widget.onPressedBackgroundColor ?? theme.accent;
            }
            return widget.backgroundColor ?? theme.accent;
          },
        ),
      ),
      onPressed: widget.loading ? null : widget.onPressed,
      child: _buildContent(context),
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
              color: widget.loadingColor ?? theme.accent,
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
                TFontBold.body(context).copyWith(color: theme.foreground),
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
                textAlign: hasOnlyText ? TextAlign.center : TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: widget.textStyle ??
                    TFontBold.body(context)
                        .copyWith(color: theme.foreground),
              ),
            ),
          if (hasTrailing && widget.text != null) children[children.length - 2],
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
