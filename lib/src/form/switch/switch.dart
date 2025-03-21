import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';

import '../../fondation/hex_color.dart';

class TSwitch extends StatefulWidget {
  final String label;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? error;
  final bool isEnabled;
  final bool isError;

  const TSwitch({
    super.key,
    required this.label,
    required this.description,
    required this.value,
    required this.onChanged,
    this.error,
    this.isEnabled = false,
    this.isError = false,
  });

  @override
  State<TSwitch> createState() => _TSwitchState();
}

class _TSwitchState extends State<TSwitch> {
  bool _internalValue = false; // To manage tap and error display

  @override
  void initState() {
    super.initState();
    _internalValue = widget.value;

    if (widget.isEnabled == false) _internalValue = false;
  }

  @override
  void didUpdateWidget(covariant TSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _internalValue = widget.value;
    }

    if (widget.isEnabled == false) _internalValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.error == null && widget.isEnabled) {
          setState(() {
            _internalValue = !_internalValue;
          });
          widget.onChanged(_internalValue);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Switch(
            value: _internalValue,
            onChanged: (newValue) {
              if (widget.isEnabled) {
                setState(() {
                  _internalValue = newValue;
                });
                widget.onChanged(newValue);
              } else if (!widget.isEnabled) {
                setState(() {
                  _internalValue = false;
                });
                widget.onChanged(_internalValue);
              }
            },
            activeColor: HexColor(gray050),
            activeTrackColor:
                widget.isError ? HexColor(red500) : HexColor(primary500),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: TFontRegular.body(context).copyWith(
                  color: widget.isError
                      ? HexColor(red500)
                      : HexColor(gray900),
                ),
              ),
              Text(
                widget.description,
                style: TFontRegular.footNote(context).copyWith(
                  color: HexColor(gray500),
                ),
              ),
              if (widget.error != null) ...[
                const SizedBox(height: 4),
                Text(
                  widget.error!,
                  style: TFontRegular.footNote(context).copyWith(
                    color: HexColor(red500),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
