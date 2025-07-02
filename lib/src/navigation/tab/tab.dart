import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TTabs extends StatefulWidget {
  final TabController controller;
  final List<String> tabs;
  final Function(int) onTabSelected;
  final int initialIndex;
  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? activeTextColor;
  final Color? inactiveTextColor;

  const TTabs({
    super.key,
    required this.controller,
    required this.tabs,
    required this.onTabSelected,
    this.initialIndex = 0,
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
    this.activeTextColor,
    this.inactiveTextColor,
  });

  @override
  State<TTabs> createState() => _TTabsState();
}

class _TTabsState extends State<TTabs> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;

    widget.controller.animation!.addListener(() {
      final newIndex = widget.controller.animation!.value.round();
      if (newIndex != selectedIndex) {
        setState(() {
          selectedIndex = newIndex;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    Color activeTextColor = theme.primaryForeground;
    Color inactiveTextColor = theme.mutedForeground;

    if (widget.activeTextColor != null) {
      activeTextColor = widget.activeTextColor!;
    }

    if (widget.inactiveTextColor != null) {
      inactiveTextColor = widget.inactiveTextColor!;
    }

    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? theme.accent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.tabs.length, (index) {
          final isSelected = index == selectedIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.controller.animateTo(index);
                widget.onTabSelected(index);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? widget.activeColor ?? theme.primary
                      : widget.inactiveColor ?? theme.accent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    widget.tabs[index],
                    style: TFontRegular.subHeadline(context).copyWith(
                      color: isSelected
                          ? activeTextColor
                          : inactiveTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}