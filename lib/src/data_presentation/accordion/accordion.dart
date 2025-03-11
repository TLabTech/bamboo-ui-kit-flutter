import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';

import '../../fondation/hex_color.dart';

class TAccordion extends StatefulWidget {
  final String title;
  final Widget? child;
  final bool initiallyExpanded;
  final Color? borderColor;
  final double borderWidth;
  final bool showDivider;
  final Widget? trailing;
  final TextStyle? titleStyle;
  final EdgeInsets? padding;

  const TAccordion({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
    this.borderColor,
    this.borderWidth = 0.5,
    this.showDivider = true,
    this.titleStyle,
    this.trailing,
    this.padding,
  });

  @override
  State<TAccordion> createState() => _TAccordionState();
}

class _TAccordionState extends State<TAccordion> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: widget.initiallyExpanded,
      collapsedIconColor: HexColor(neutral700),
      iconColor: HexColor(neutral700),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      title: Text(
        widget.title,
        style: widget.titleStyle ??
            TFontBold.body.copyWith(color: HexColor(neutral900)),
      ),
      trailing: AnimatedRotation(
        turns: isExpanded ? 0.5 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: widget.trailing ?? Icon(Icons.expand_more),
      ),
      tilePadding: const EdgeInsets.symmetric(horizontal: 0),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 0),
      onExpansionChanged: (expanded) {
        setState(() {
          isExpanded = expanded;
        });
      },
      children: [
        Padding(
          padding: widget.padding ?? EdgeInsets.zero,
          child: widget.child,
        ),
        if (widget.showDivider)
          Divider(
            color: widget.borderColor ?? HexColor(neutral300),
            thickness: widget.borderWidth,
          ),
      ],
    );
  }
}
