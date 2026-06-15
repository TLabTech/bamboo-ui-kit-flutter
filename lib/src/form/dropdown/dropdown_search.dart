import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bamboo_ui_kit/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TDropdownSearch<T> extends StatefulWidget {
  final String hint;
  final List<T> list;
  final T? value;
  final Function(T) onChanged;
  final TextEditingController textEditingController;
  final bool readOnly;
  final Color? borderColor;
  final Color? backgroundColor;
  final String Function(T) displayText;

  const TDropdownSearch({
    super.key,
    this.hint = "",
    required this.list,
    required this.value,
    required this.onChanged,
    required this.textEditingController,
    required this.displayText,
    this.readOnly = false,
    this.borderColor,
    this.backgroundColor,
  });

  @override
  TDropdownSearchState<T> createState() => TDropdownSearchState<T>();
}

class TDropdownSearchState<T> extends State<TDropdownSearch<T>> {
  List<T> _filteredList = [];
  late final ValueNotifier<T?> _valueNotifier;

  @override
  void initState() {
    super.initState();
    _filteredList = widget.list;
    _valueNotifier = ValueNotifier<T?>(widget.value);
  }

  @override
  void didUpdateWidget(TDropdownSearch<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.list != oldWidget.list) {
      setState(() {
        _filteredList = widget.list;
      });
    }
    if (widget.value != oldWidget.value) {
      _valueNotifier.value = widget.value;
    }
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  void _search(String query) {
    setState(() {
      _filteredList = widget.list
          .where((item) =>
          widget.displayText(item).toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;

    return Container(
      height: 46.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: widget.borderColor ?? theme.border),
      ),
      child: Row(
        children: [
          Flexible(
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<T>(
                  isExpanded: true,
                  hint: Text(
                    widget.hint,
                    overflow: TextOverflow.ellipsis,
                    style: TFontRegular.body(context).copyWith(
                      color: theme.mutedForeground,
                    ),
                  ),
                  selectedItemBuilder: (context) => _filteredList.map((item) => Text(
                    widget.displayText(item),
                    overflow: TextOverflow.ellipsis,
                    style: TFontRegular.body(context).copyWith(
                      color: theme.foreground,
                    ),
                  )).toList(),
                  items: _filteredList
                      .map(
                        (item) => DropdownItem<T>(
                      value: item,
                      child: Text(
                        widget.displayText(item),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TFontRegular.body(context).copyWith(
                          color: theme.foreground,
                        ),
                      ),
                    ),
                  )
                      .toList(),
                  valueListenable: _valueNotifier,
                  onChanged: widget.readOnly
                      ? null
                      : (T? value) {
                    if (value != null) widget.onChanged(value);
                  },
                  dropdownStyleData: DropdownStyleData(
                    elevation: 1,
                    isOverButton: true,
                    maxHeight: 400.0,
                    decoration: BoxDecoration(color: Colors.white),
                    scrollPadding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  ),
                  dropdownSearchData: DropdownSearchData(
                    searchController: widget.textEditingController,
                    searchBarWidgetHeight: 60,
                    searchBarWidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: widget.textEditingController,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onChanged: _search,
                      ),
                    ),
                  ),
                  iconStyleData: widget.readOnly
                      ? const IconStyleData(iconSize: 0.0)
                      : IconStyleData(
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 1.0),
                      child: SvgPicture.asset(
                        Assets.svg.chevronDown,
                        width: 20.0,
                        height: 20.0,
                        colorFilter: ColorFilter.mode(
                          theme.foreground,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    iconSize: 14,
                    iconEnabledColor: theme.foreground,
                    iconDisabledColor: theme.mutedForeground,
                  ),
                  onMenuStateChange: (isOpen) {
                    if (!isOpen) {
                      widget.textEditingController.clear();
                      setState(() {
                        _filteredList = widget.list; // Reset list when menu closes
                      });
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
