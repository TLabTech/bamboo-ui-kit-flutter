import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bamboo_ui_kit/gen/assets.gen.dart';
import 'package:flutter_bamboo_ui_kit/src/form/calendar/year_selector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

enum CalendarView { year, month, date }

enum SelectionMode { single, multi, range }

enum RangePosition { none, single, start, middle, end }

class TCalendar extends StatefulWidget {
  final List<EventData> events;
  final Function(EventData)? onEventTap;
  final Function(Set<DateTime>)? onSelectionChanged;
  final SelectionMode selectionMode;
  final DateTime? initialDate;
  final DateTime firstDay;
  final DateTime lastDay;

  const TCalendar({
    super.key,
    this.events = const [],
    this.onEventTap,
    this.onSelectionChanged,
    this.selectionMode = SelectionMode.single,
    this.initialDate,
    required this.firstDay,
    required this.lastDay,
  });

  @override
  TCalendarState createState() => TCalendarState();
}

class TCalendarState extends State<TCalendar> {
  DateTime _focusedDay = DateTime.now();
  Set<DateTime> _selectedDays = {};

  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  late Map<DateTime, List<EventData>> _eventsMap;
  CalendarView _currentView = CalendarView.date;
  DateTime _selectedDate = DateTime.now();
  bool _hasPreviousYear = true;
  bool _hasNextYear = true;

  final GlobalKey<YearSelectorState> _yearSelectorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _eventsMap = _groupEventsByDate(widget.events);
    _focusedDay = widget.initialDate ?? DateTime.now();
    _selectedDate = widget.initialDate ?? DateTime.now();

    _eventsMap = _groupEventsByDate(widget.events);
    _selectedDays = {_focusedDay};
    // Notify parent about initial selection
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onSelectionChanged?.call(_selectedDays);
    });
  }

  // Helper method to generate date range
  Set<DateTime> _generateDateRange(DateTime start, DateTime end) {
    final range = <DateTime>{};
    var current = DateTime(start.year, start.month, start.day);
    final endDate = DateTime(end.year, end.month, end.day);

    while (!current.isAfter(endDate)) {
      range.add(current);
      current = current.add(Duration(days: 1));
    }

    return range;
  }

  Map<DateTime, List<EventData>> _groupEventsByDate(List<EventData> events) {
    final Map<DateTime, List<EventData>> grouped = {};
    for (var event in events) {
      final date = DateTime(event.date.year, event.date.month, event.date.day);
      grouped[date] ??= [];
      grouped[date]!.add(event);
    }
    return grouped;
  }

  void _onPageChanged(DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;
    });
  }

  void _goToPrevious() {
    if (_currentView == CalendarView.date) {
      // Navigate to the previous month
      final previousMonth =
          DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
      if (previousMonth.isAfter(widget.firstDay)) {
        setState(() {
          _focusedDay = previousMonth;
        });
      }
    } else if (_currentView == CalendarView.year) {
      // Navigate to the next year
      final yearSelectorState = _yearSelectorKey.currentState;
      if (yearSelectorState != null) {
        yearSelectorState.previousPage();
      }
    }
  }

  void _goToNext() {
    if (_currentView == CalendarView.date) {
      // Navigate to the next month
      final nextMonth = DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
      if (nextMonth.isBefore(widget.lastDay)) {
        setState(() {
          _focusedDay = nextMonth;
        });
      }
    } else if (_currentView == CalendarView.year) {
      // Navigate to the next year
      final yearSelectorState = _yearSelectorKey.currentState;
      if (yearSelectorState != null) {
        yearSelectorState.nextPage();
      }
    }
  }

  bool get _hasPrevious {
    if (_currentView == CalendarView.date) {
      return _focusedDay.isAfter(widget.firstDay);
    } else if (_currentView == CalendarView.year) {
      return _hasPreviousYear;
    }
    return false;
  }

  bool get _hasNext {
    if (_currentView == CalendarView.date) {
      return _focusedDay.isBefore(widget.lastDay);
    } else if (_currentView == CalendarView.year) {
      return _hasNextYear;
    }
    return false;
  }

  void _updateYearNavigationState() {
    final yearSelectorState = _yearSelectorKey.currentState;
    if (yearSelectorState == null || !yearSelectorState.mounted) {
      return;
    }

    final currentPage = yearSelectorState.pageController.page ?? 0;
    final totalPages = yearSelectorState.totalPages;

    setState(() {
      _hasPreviousYear = currentPage > 0;
      _hasNextYear = currentPage < totalPages - 1;
    });
  }

  void _onMonthSelected(int month) {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, month);
      _currentView = CalendarView.date;
    });
  }

  void _onHeaderTap() {
    setState(() {
      _currentView = CalendarView.year;
    });
  }

  void _onYearSelected(int year) {
    setState(() {
      _focusedDay = DateTime(year, _focusedDay.month);
      _selectedDate = DateTime(year, _selectedDate.month, _selectedDate.day);
      _currentView = CalendarView.month;
    });
  }

  void jumpToDate(DateTime date) {
    setState(() {
      _focusedDay = date;
    });
  }

  void animateToDate(DateTime date) {
    if (!date.isAtSameMomentAs(_focusedDay)) {
      setState(() {
        _focusedDay = date;
      });
    }
  }

  // Method to jump to date AND auto-select it
  void jumpToAndSelectDate(DateTime date) {
    setState(() {
      _focusedDay = date;
      switch (widget.selectionMode) {
        case SelectionMode.single:
          _selectedDays = {date};
          _rangeStart = null;
          _rangeEnd = null;
          break;
        case SelectionMode.multi:
          _selectedDays.add(date);
          _rangeStart = null;
          _rangeEnd = null;
          break;
        case SelectionMode.range:
          _rangeStart = date;
          _rangeEnd = null;
          _selectedDays = {date};
          break;
      }
    });
    widget.onSelectionChanged?.call(_selectedDays);
  }

  // Method to animate to date AND auto-select it
  void animateToAndSelectDate(DateTime date) {
    setState(() {
      if (!date.isAtSameMomentAs(_focusedDay)) {
        _focusedDay = date;
      }
      switch (widget.selectionMode) {
        case SelectionMode.single:
          _selectedDays = {date};
          _rangeStart = null;
          _rangeEnd = null;
          break;
        case SelectionMode.multi:
          _selectedDays.add(date);
          _rangeStart = null;
          _rangeEnd = null;
          break;
        case SelectionMode.range:
          _rangeStart = date;
          _rangeEnd = null;
          _selectedDays = {date};
          break;
      }
    });
    widget.onSelectionChanged?.call(_selectedDays);
  }

  // Method to select date without navigating (if date is in current view)
  void selectDate(DateTime date) {
    setState(() {
      switch (widget.selectionMode) {
        case SelectionMode.single:
          _selectedDays = {date};
          _rangeStart = null;
          _rangeEnd = null;
          break;
        case SelectionMode.multi:
          _selectedDays.add(date);
          _rangeStart = null;
          _rangeEnd = null;
          break;
        case SelectionMode.range:
          _rangeStart = date;
          _rangeEnd = null;
          _selectedDays = {date};
          break;
      }
    });
    widget.onSelectionChanged?.call(_selectedDays);
  }

  // Method to select multiple dates at once (for multi-select mode)
  void selectDates(List<DateTime> dates) {
    setState(() {
      switch (widget.selectionMode) {
        case SelectionMode.single:
          _selectedDays = dates.isEmpty ? {} : {dates.first};
          _rangeStart = null;
          _rangeEnd = null;
          break;
        case SelectionMode.multi:
          _selectedDays.addAll(dates);
          _rangeStart = null;
          _rangeEnd = null;
          break;
        case SelectionMode.range:
          if (dates.length >= 2) {
            final sortedDates = dates.toList()..sort();
            _rangeStart = sortedDates.first;
            _rangeEnd = sortedDates.last;
            _selectedDays = _generateDateRange(_rangeStart!, _rangeEnd!);
          } else if (dates.length == 1) {
            _rangeStart = dates.first;
            _rangeEnd = null;
            _selectedDays = {dates.first};
          }
          break;
      }
    });
    widget.onSelectionChanged?.call(_selectedDays);
  }

  // Method to set date range programmatically
  void selectDateRange(DateTime start, DateTime end) {
    setState(() {
      if (start.isAfter(end)) {
        // Swap if start is after end
        final temp = start;
        start = end;
        end = temp;
      }
      _rangeStart = start;
      _rangeEnd = end;
      _selectedDays = _generateDateRange(start, end);
    });
    widget.onSelectionChanged?.call(_selectedDays);
  }

  // Method to programmatically update selection
  void updateSelection(Set<DateTime> selectedDates) {
    setState(() {
      switch (widget.selectionMode) {
        case SelectionMode.single:
          _selectedDays = selectedDates.isEmpty ? {} : {selectedDates.first};
          _rangeStart = null;
          _rangeEnd = null;
          break;
        case SelectionMode.multi:
          _selectedDays = Set.from(selectedDates);
          _rangeStart = null;
          _rangeEnd = null;
          break;
        case SelectionMode.range:
          if (selectedDates.length >= 2) {
            final sortedDates = selectedDates.toList()..sort();
            _rangeStart = sortedDates.first;
            _rangeEnd = sortedDates.last;
            _selectedDays = _generateDateRange(_rangeStart!, _rangeEnd!);
          } else if (selectedDates.length == 1) {
            _rangeStart = selectedDates.first;
            _rangeEnd = null;
            _selectedDays = {selectedDates.first};
          } else {
            _rangeStart = null;
            _rangeEnd = null;
            _selectedDays = {};
          }
          break;
      }
    });
    widget.onSelectionChanged?.call(_selectedDays);
  }

  // Method to clear all selections
  void clearSelection() {
    setState(() {
      _selectedDays.clear();
      _rangeStart = null;
      _rangeEnd = null;
    });
    widget.onSelectionChanged?.call(_selectedDays);
  }

  // Method to get current selection
  Set<DateTime> get selectedDates => Set.from(_selectedDays);

  // Method to get selected date for single selection mode
  DateTime? get selectedDate =>
      _selectedDays.isEmpty ? null : _selectedDays.first;

  // Methods for range selection
  DateTime? get rangeStart => _rangeStart;

  DateTime? get rangeEnd => _rangeEnd;

  // Check if range is complete (has both start and end)
  bool get isRangeComplete => _rangeStart != null && _rangeEnd != null;

  // Helper method to determine range position
  RangePosition _getRangePosition(DateTime date) {
    if (widget.selectionMode != SelectionMode.range) {
      return RangePosition.none;
    }

    final isSelected = _selectedDays.any((d) => isSameDay(d, date));
    if (!isSelected) return RangePosition.none;

    final isRangeStart = _rangeStart != null && isSameDay(date, _rangeStart!);
    final isRangeEnd = _rangeEnd != null && isSameDay(date, _rangeEnd!);

    if (isRangeStart && isRangeEnd) return RangePosition.single;
    if (isRangeStart) return RangePosition.start;
    if (isRangeEnd) return RangePosition.end;
    return RangePosition.middle;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    final today = DateTime.now();
    final isCurrentMonth =
        today.month == _focusedDay.month && today.year == _focusedDay.year;
    final isCurrentYear = today.year == _focusedDay.year;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap:
                    _currentView != CalendarView.month ? _goToPrevious : null,
                child: SvgPicture.asset(
                  Assets.svg.previousCircle,
                  colorFilter: ColorFilter.mode(
                    _hasPrevious ? theme.mutedForeground : HexColor(gray300),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              GestureDetector(
                onTap: _onHeaderTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 6,
                  children: [
                    Text(
                      DateFormat('MMMM yyyy').format(_focusedDay),
                      style: TFontRegular.body(context).copyWith(
                        color: theme.mutedForeground,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: theme.mutedForeground,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: _currentView != CalendarView.month ? _goToNext : null,
                child: SvgPicture.asset(
                  Assets.svg.nextCircle,
                  colorFilter: ColorFilter.mode(
                    _hasNext ? theme.mutedForeground : HexColor(gray300),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        _buildCalendarContent(
          theme: theme,
          isCurrentMonth: isCurrentMonth,
          isCurrentYear: isCurrentYear,
        ),
      ],
    );
  }

  Widget _buildCalendarContent({
    required TTheme theme,
    required bool isCurrentMonth,
    required bool isCurrentYear,
  }) {
    switch (_currentView) {
      case CalendarView.year:
        return YearSelector(
          key: _yearSelectorKey,
          selectedYear: _selectedDate.year,
          onYearSelected: _onYearSelected,
          startYear: widget.firstDay.year,
          endYear: widget.lastDay.year,
          onPageChanged: _updateYearNavigationState,
        );
      case CalendarView.month:
        return _buildMonthSelector(theme);
      case CalendarView.date:
        return _buildCalendarView(
          theme: theme,
          isCurrentMonth: isCurrentMonth,
          isCurrentYear: isCurrentYear,
        );
    }
  }

  Widget _buildMonthSelector(TTheme theme) {
    int currentMonth = DateTime.now().month;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.5,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        int month = index + 1;
        bool isSelected = month == _focusedDay.month;
        bool isCurrentMonth = month == currentMonth;

        return GestureDetector(
          onTap: () => _onMonthSelected(month),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isCurrentMonth
                  ? theme.accent
                  : isSelected
                      ? theme.primary
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              DateFormat('MMM').format(DateTime(2025, month)),
              style: TFontRegular.body(context).copyWith(
                color: isCurrentMonth
                    ? theme.foreground
                    : isSelected
                        ? theme.primaryForeground
                        : theme.foreground,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCalendarView({
    required TTheme theme,
    required bool isCurrentMonth,
    required bool isCurrentYear,
  }) {
    return TableCalendar(
      firstDay: DateTime.utc(widget.firstDay.year, 1, 1),
      lastDay: DateTime.utc(widget.lastDay.year, 12, 31),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        return _selectedDays.any((d) => isSameDay(d, day));
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          switch (widget.selectionMode) {
            case SelectionMode.single:
              // Single selection logic
              _selectedDays = {selectedDay};
              _rangeStart = null;
              _rangeEnd = null;
              break;

            case SelectionMode.multi:
              // Multi-selection logic
              final alreadySelected =
                  _selectedDays.any((d) => isSameDay(d, selectedDay));
              if (alreadySelected) {
                _selectedDays.removeWhere((d) => isSameDay(d, selectedDay));
              } else {
                _selectedDays.add(selectedDay);
              }
              _rangeStart = null;
              _rangeEnd = null;
              break;

            case SelectionMode.range:
              // Range selection logic
              if (_rangeStart == null ||
                  (_rangeStart != null && _rangeEnd != null)) {
                // Start new range
                _rangeStart = selectedDay;
                _rangeEnd = null;
                _selectedDays = {selectedDay};
              } else if (_rangeStart != null && _rangeEnd == null) {
                // Complete the range
                if (selectedDay.isBefore(_rangeStart!)) {
                  _rangeEnd = _rangeStart;
                  _rangeStart = selectedDay;
                } else {
                  _rangeEnd = selectedDay;
                }
                _selectedDays = _generateDateRange(_rangeStart!, _rangeEnd!);
              }
              break;
          }
          _focusedDay = focusedDay;
        });

        // Notify parent about selection change
        widget.onSelectionChanged?.call(_selectedDays);

        _handleDayTap(selectedDay);
      },
      onPageChanged: _onPageChanged,
      headerVisible: false,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TFontRegular.caption2(context)
            .copyWith(color: theme.mutedForeground),
        weekendStyle: TFontRegular.caption2(context)
            .copyWith(color: theme.mutedForeground),
        dowTextFormatter: (date, locale) =>
            ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'][date.weekday % 7],
      ),
      calendarFormat: CalendarFormat.month,
      calendarStyle: CalendarStyle(
        markersMaxCount: 3,
        todayDecoration: BoxDecoration(
          color: theme.accent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6),
        ),
        todayTextStyle: TextStyle(
          color: theme.foreground,
          fontWeight: FontWeight.bold,
        ),
        selectedDecoration: BoxDecoration(
          color: theme.primary,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6),
        ),
        selectedTextStyle: TextStyle(
          color: theme.primaryForeground,
          fontWeight: FontWeight.bold,
        ),
        defaultDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        weekendDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        outsideDaysVisible: true,
        outsideTextStyle: TextStyle(color: theme.mutedForeground),
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, date, events) {
          return _buildDayCell(context, date, theme);
        },
        outsideBuilder: (context, date, _) {
          return _buildDayCell(context, date, theme);
        },
        todayBuilder: (context, date, _) {
          return _buildDayCell(context, date, theme);
        },
        selectedBuilder: (context, date, _) {
          return _buildDayCell(context, date, theme);
        },
        markerBuilder: (context, date, events) {
          final normalizedDate = DateTime(date.year, date.month, date.day);
          if (_eventsMap[normalizedDate]?.isNotEmpty ?? false) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  right: 10,
                  top: 12,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: theme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            );
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDayCell(BuildContext context, DateTime date, TTheme theme) {
    final isToday = isSameDay(date, DateTime.now());
    final isSelected = _selectedDays.any((d) => isSameDay(d, date));
    final isCurrentMonth = date.month == _focusedDay.month;

    // Determine range position for styling
    final rangePosition = _getRangePosition(date);

    // Determine background decoration based on selection mode
    Decoration? backgroundDecoration;
    Color textColor = isCurrentMonth ? theme.foreground : theme.mutedForeground;

    if (isToday && !isSelected) {
      // Today styling when not selected
      backgroundDecoration = BoxDecoration(
        color: theme.accent,
        borderRadius: BorderRadius.circular(6),
      );
      textColor = theme.foreground;
    } else if (isSelected) {
      // Selected styling
      if (widget.selectionMode == SelectionMode.range) {
        // Range selection styling
        switch (rangePosition) {
          case RangePosition.single:
            backgroundDecoration = BoxDecoration(
              color: theme.primary,
              borderRadius: BorderRadius.circular(6),
            );
            textColor = theme.primaryForeground;
            break;
          case RangePosition.start:
            backgroundDecoration = BoxDecoration(
              color: theme.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
            );
            textColor = theme.primaryForeground;
            break;
          case RangePosition.end:
            backgroundDecoration = BoxDecoration(
              color: theme.primary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            );
            textColor = theme.primaryForeground;
            break;
          case RangePosition.middle:
            backgroundDecoration = BoxDecoration(
              color: theme.primary,
            );
            textColor = theme.primaryForeground;
            break;
          case RangePosition.none:
            break;
        }
      } else {
        // Single or multi selection styling
        backgroundDecoration = BoxDecoration(
          color: theme.primary,
          borderRadius: BorderRadius.circular(6),
        );
        textColor = theme.primaryForeground;
      }
    }

    return Container(
      decoration: backgroundDecoration,
      child: Center(
        child: Text(
          '${date.day}',
          style: TFontRegular.body(context).copyWith(
            color: textColor,
            fontWeight:
                isToday || isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  void _handleDayTap(DateTime date) {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final events = _eventsMap[normalizedDate] ?? [];
    if (events.isNotEmpty && widget.onEventTap != null) {
      widget.onEventTap!(events.first);
    }
  }
}
