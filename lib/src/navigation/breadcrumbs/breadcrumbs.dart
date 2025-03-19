import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';

enum BreadcrumbDirection { left, right }

class TBreadcrumbs extends StatelessWidget {
  final List<TBreadcrumbItem> items;
  final int maxVisibleItems;
  final Widget separator;
  final BreadcrumbDirection direction;

  TBreadcrumbs({
    super.key,
    required this.items,
    this.maxVisibleItems = 10,
    this.separator =
        const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
    this.direction = BreadcrumbDirection.left,
  }) {
    for (final item in items) {
      if (item.label == null && item.icon == null) {
        throw ArgumentError(
            "Each BreadcrumbItem must have at least a label or an icon.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox();

    List<Widget> displayedItems = [];

    if (items.length <= maxVisibleItems) {
      displayedItems = _buildItems(context, items);
    } else {
      displayedItems.add(_buildSingleItem(context, items.first));
      displayedItems
          .add(const Text("...", style: TextStyle(color: Colors.grey)));
      displayedItems.addAll(
        _buildItems(
            context, items.sublist(items.length - (maxVisibleItems - 2))),
      );
    }

    // Reverse the items if the direction is set to right
    if (direction == BreadcrumbDirection.right) {
      displayedItems = displayedItems.reversed.toList();
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: direction == BreadcrumbDirection.left
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _addSeparators(displayedItems),
      ),
    );
  }

  List<Widget> _buildItems(BuildContext context, List<TBreadcrumbItem> items) {
    return [
      for (int i = 0; i < items.length; i++)
        _buildSingleItem(context, items[i], isActive: i == items.length - 1)
    ];
  }

  Widget _buildSingleItem(BuildContext context, TBreadcrumbItem item,
      {bool isActive = false}) {
    return GestureDetector(
      onTap: item.onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (item.icon != null) ...[
            item.icon!,
            if (item.label != null) const SizedBox(width: 4),
          ],
          if (item.label != null)
            Text(
              item.label!,
              style: TFontRegular.caption2(context).copyWith(
                color: isActive ? HexColor(neutral900) : HexColor(neutral500),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _addSeparators(List<Widget> items) {
    List<Widget> result = [];
    for (int i = 0; i < items.length; i++) {
      result.add(items[i]);
      if (i < items.length - 1) {
        result.add(separator);
      }
    }
    return result;
  }
}
