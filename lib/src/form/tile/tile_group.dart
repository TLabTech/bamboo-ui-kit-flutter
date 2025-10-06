import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TGroupTile<T> extends StatefulWidget {
  final String? title;
  final List<TTile<T>> tiles;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool enable;
  final bool enableBorder;
  final bool enableRadio;
  final T? initialValue;
  final ValueChanged<T?>? onChanged;

  const TGroupTile({
    super.key,
    this.title,
    required this.tiles,
    this.backgroundColor,
    this.borderColor,
    this.enable = true,
    this.enableBorder = true,
    this.enableRadio = false,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<TGroupTile<T>> createState() => _TGroupTileState<T>();
}

class _TGroupTileState<T> extends State<TGroupTile<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  void _handleSelection(T? value) {
    setState(() {
      selectedValue = value;
    });
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Text(
              widget.title!,
              style: TFontRegular.body(context).copyWith(
                color: theme.foreground,
              ),
            ),
          ),
        Container(
          decoration: BoxDecoration(
            color: widget.enable
                ? widget.backgroundColor ?? theme.background
                : HexColor(gray050),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.borderColor ?? theme.border,
            ),
          ),
          child: Column(
            children: [
              for (int i = 0; i < widget.tiles.length; i++) ...[
                GestureDetector(
                  onTap: widget.tiles[i].onPress,
                  child: widget.tiles[i].copyWith(
                    borderColor: Colors.transparent,
                    borderRadius: _getBorderRadius(i, widget.tiles.length),
                    showRadio: widget.enableRadio,
                    value: widget.tiles[i].value,
                    groupValue: selectedValue,
                    onChanged: widget.enableRadio ? _handleSelection : null,
                  ),
                ),
                if (widget.enableBorder && i != widget.tiles.length - 1)
                  Divider(
                    color: theme.border,
                    height: 1,
                    thickness: 1,
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  BorderRadius _getBorderRadius(int index, int total) {
    if (total == 1) {
      return BorderRadius.circular(8);
    } else if (index == 0) {
      return BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      );
    } else if (index == total - 1) {
      return BorderRadius.only(
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      );
    } else {
      return BorderRadius.zero;
    }
  }
}
