import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';

import '../../fondation/tfont.dart';

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
            duration: const Duration(milliseconds: 300),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: widget.isEnabled
                  ? _isChecked
                      ? widget.isError
                          ? HexColor(danger500)
                          : widget.activeColor
                      : widget.inactiveColor
                  : widget.inactiveColor,
              border: Border.all(
                color: widget.isEnabled
                    ? _isChecked
                        ? widget.borderColor ?? Colors.transparent
                        : HexColor(neutral300)
                    : HexColor(neutral300),
                width: widget.borderColor == null ? 0 : 1,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: widget.isEnabled
                ? _isChecked
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                    : null
                : null,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              Text(
                widget.label ?? '',
                style: TFontRegular.body.copyWith(
                  color: widget.isError
                      ? HexColor(danger500)
                      : HexColor(neutral900),
                ),
              ),
              Text(
                widget.description ?? "",
                style: TFontRegular.footNote.copyWith(
                  color: HexColor(neutral500),
                ),
              ),
              Visibility(
                visible: widget.isError,
                child: Text(
                  widget.error ?? "",
                  style: TFontRegular.footNote.copyWith(
                    color: HexColor(danger500),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
