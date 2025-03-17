import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bamboo_ui_kit/gen/assets.gen.dart';
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

  const TDropdownSearch({
    super.key,
    this.hint = "",
    required this.list,
    required this.value,
    required this.onChanged,
    required this.textEditingController,
    this.readOnly = false,
    this.borderColor,
    this.backgroundColor,
  });

  @override
  TDropdownSearchState<T> createState() => TDropdownSearchState<T>();
}

class TDropdownSearchState<T> extends State<TDropdownSearch<T>> {
  List<T> _filteredList = [];

  @override
  void initState() {
    super.initState();
    _filteredList = widget.list;
  }

  void _search(String query) {
    setState(() {
      _filteredList = widget.list
          .where((item) =>
              item.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 46.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: widget.borderColor ?? HexColor(neutral300)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
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
                    style: TFontRegular.body.copyWith(
                      color: HexColor(neutral500),
                    ),
                  ),
                  items: _filteredList
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  value: widget.value,
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
                    height: 40.0,
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  ),
                  dropdownSearchData: DropdownSearchData(
                    searchController: widget.textEditingController,
                    searchInnerWidgetHeight: 60,
                    searchInnerWidget: Padding(
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
                              colorFilter: const ColorFilter.mode(
                                Colors.black,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.grey,
                        ),
                  onMenuStateChange: (isOpen) {
                    if (!isOpen) {
                      widget.textEditingController.clear();
                      _search('');
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
