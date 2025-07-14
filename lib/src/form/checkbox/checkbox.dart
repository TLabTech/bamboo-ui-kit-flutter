import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TCheckBox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? borderColor;
  final String? label;
  final String? description;
  final String? error;
  final bool isEnabled;
  final bool isError;

  const TCheckBox({
    super.key,
    required this.initialValue,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.borderColor,
    this.label,
    this.description,
    this.error,
    this.isEnabled = true,
    this.isError = false,
  });

  @override
  State<TCheckBox> createState() => _TCheckBoxState();
}

class _TCheckBoxState extends State<TCheckBox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.isEnabled == false) return;
          _isChecked = !_isChecked;
          widget.onChanged(_isChecked);
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            margin: EdgeInsets.only(top: 2),
            duration: const Duration(milliseconds: 300),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: widget.isEnabled
                  ? _isChecked
                      ? widget.isError
                          ? theme.destructive
                          : widget.activeColor
                      : widget.inactiveColor
                  : widget.inactiveColor,
              border: Border.all(
                color: widget.isEnabled
                    ? _isChecked
                        ? widget.borderColor ?? Colors.transparent
                        : theme.border
                    : theme.border,
                width: widget.borderColor == null ? 0 : 1,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: widget.isEnabled
                ? _isChecked
                    ? Icon(
                        Icons.check,
                        color: theme.primaryForeground,
                        size: 10,
                      )
                    : null
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  widget.label ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TFontRegular.body(context).copyWith(
                    color: widget.isError
                        ? theme.destructive
                        : !widget.isEnabled
                        ? theme.mutedForeground
                        : theme.foreground,
                  ),
                ),
                Text(
                  widget.description ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TFontRegular.footNote(context).copyWith(
                    color: !widget.isEnabled
                        ? theme.mutedForeground
                        : theme.foreground,
                  ),
                ),
                Visibility(
                  visible: widget.isError,
                  child: Text(
                    widget.error ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TFontRegular.footNote(context).copyWith(
                      color: theme.destructive,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
