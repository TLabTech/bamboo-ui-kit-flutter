import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';

class YearSelector extends StatefulWidget {
  final int selectedYear;
  final Function(int) onYearSelected;
  final int startYear;
  final int endYear;

  const YearSelector({
    super.key,
    required this.selectedYear,
    required this.onYearSelected,
    required this.startYear,
    required this.endYear,
  });

  @override
  YearSelectorState createState() => YearSelectorState();
}

class YearSelectorState extends State<YearSelector> {
  late PageController _pageController;
  static const int _yearsPerPage = 15; // 3 columns × 5 rows
  int _totalPages = 0;
  int _initialPage = 0;

  @override
  void initState() {
    super.initState();
    _totalPages =
        ((widget.endYear - widget.startYear + 1) / _yearsPerPage).ceil();
    int currentYearPage =
        ((widget.selectedYear - widget.startYear) / _yearsPerPage).floor();
    _initialPage = currentYearPage;
    _pageController = PageController(initialPage: _initialPage);
  }

  void _onYearTap(int year) {
    if (year > widget.endYear) return; // Prevent selecting disabled years
    widget.onYearSelected(year);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Adjust height based on grid
      child: PageView.builder(
        controller: _pageController,
        itemCount: _totalPages,
        itemBuilder: (context, pageIndex) {
          int pageStartYear = widget.startYear + (pageIndex * _yearsPerPage);
          return GridView.builder(
            padding: EdgeInsets.all(8),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 columns
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 2.5,
            ),
            itemCount: _yearsPerPage,
            itemBuilder: (context, index) {
              int year = pageStartYear + index;
              bool isDisabled = year > widget.endYear;
              bool isSelected = widget.selectedYear == year;
              bool isCurrentYear = DateTime.now().year == year;

              return GestureDetector(
                onTap: isDisabled ? null : () => _onYearTap(year),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Color(0xFF00DE9C) // Selected
                        : isDisabled
                            ? Colors.transparent
                            : isCurrentYear
                                ? Color(0xFFEAFFF6) // Current Year Highlight
                                : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '$year',
                    style: TFontRegular.body.copyWith(
                      color: isSelected
                          ? Colors.white
                          : isDisabled
                              ? Colors.grey
                              : isCurrentYear
                                  ? HexColor(primary500)
                                  : Colors.black54,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
