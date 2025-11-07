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
  final int? maxRangeLength;
  final int? maxWorkingDays;

  const TCalendar({
    super.key,
    this.events = const [],
    this.onEventTap,
    this.onSelectionChanged,
    this.selectionMode = SelectionMode.single,
    this.initialDate,
    required this.firstDay,
    required this.lastDay,
    this.maxRangeLength,
    this.maxWorkingDays,
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
    _selectedDays = {_focusedDay};

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onSelectionChanged?.call(_selectedDays);
    });
  }

  Set<DateTime> _generateDateRange(DateTime start, DateTime end) {
    final range = <DateTime>{};
    var current = DateTime(start.year, start.month, start.day);
    final endDate = DateTime(end.year, end.month, end.day);

    while (!current.isAfter(endDate)) {
      range.add(current);
      current = current.add(const Duration(days: 1));
    }

    return range;
  }

  int _countWorkingDays(DateTime start, DateTime end) {
    int count = 0;
    var current = DateTime(start.year, start.month, start.day);
    final endDate = DateTime(end.year, end.month, end.day);

    while (!current.isAfter(endDate)) {
      if (current.weekday >= DateTime.monday && current.weekday <= DateTime.friday) {
        count++;
      }
      current = current.add(const Duration(days: 1));
    }
    return count;
  }

  DateTime _trimRangeToMaxWorkingDays(DateTime start, DateTime end, int maxWorkingDays) {
    if (maxWorkingDays <= 0) return start;

    int workingDayCount = 0;
    var current = DateTime(start.year, start.month, start.day);
    final originalEnd = DateTime(end.year, end.month, end.day);

    while (!current.isAfter(originalEnd)) {
      if (current.weekday >= DateTime.monday && current.weekday <= DateTime.friday) {
        workingDayCount++;
        if (workingDayCount >= maxWorkingDays) {
          return current;
        }
      }
      current = current.add(const Duration(days: 1));
    }

    return originalEnd;
  }

  // ✅ Apply both working-day and calendar-day limits
  void _applyRangeLimits(DateTime start, DateTime end, DateTime selectedDay, Function(DateTime, DateTime, Set<DateTime>) onSuccess) {
    DateTime potentialStart = start;
    DateTime potentialEnd = end;

    // Apply working-day limit first (business logic)
    if (widget.maxWorkingDays != null) {
      final workingDaysCount = _countWorkingDays(potentialStart, potentialEnd);
      if (workingDaysCount > widget.maxWorkingDays!) {
        potentialEnd = _trimRangeToMaxWorkingDays(potentialStart, potentialEnd, widget.maxWorkingDays!);
      }
    }

    // Then apply calendar-day limit (if any)
    if (widget.maxRangeLength != null) {
      final diff = potentialEnd.difference(potentialStart).inDays;
      if (diff >= widget.maxRangeLength!) {
        potentialEnd = potentialStart.add(Duration(days: widget.maxRangeLength! - 1));
        if (potentialEnd.isAfter(widget.lastDay)) {
          potentialEnd = widget.lastDay;
        }
      }
    }

    // Ensure validity
    if (potentialStart.isAfter(potentialEnd)) {
      // Fallback: treat as new start (single day)
      onSuccess(selectedDay, selectedDay, {selectedDay});
    } else {
      final newSelected = _generateDateRange(potentialStart, potentialEnd);
      onSuccess(potentialStart, potentialEnd, newSelected);
    }
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
      final previousMonth = DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
      if (previousMonth.isAfter(widget.firstDay)) {
        setState(() {
          _focusedDay = previousMonth;
        });
      }
    } else if (_currentView == CalendarView.year) {
      final yearSelectorState = _yearSelectorKey.currentState;
      if (yearSelectorState != null) {
        yearSelectorState.previousPage();
      }
    }
  }

  void _goToNext() {
    if (_currentView == CalendarView.date) {
      final nextMonth = DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
      if (nextMonth.isBefore(widget.lastDay)) {
        setState(() {
          _focusedDay = nextMonth;
        });
      }
    } else if (_currentView == CalendarView.year) {
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

  void jumpToAndSelectDate(DateTime date) {
    _selectDateInternal(date);
  }

  void animateToAndSelectDate(DateTime date) {
    if (!date.isAtSameMomentAs(_focusedDay)) {
      setState(() {
        _focusedDay = date;
      });
    }
    _selectDateInternal(date);
  }

  void selectDate(DateTime date) {
    _selectDateInternal(date);
  }

  void _selectDateInternal(DateTime date) {
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

  void selectDates(List<DateTime> dates) {
    if (dates.isEmpty) {
      clearSelection();
      return;
    }

    setState(() {
      switch (widget.selectionMode) {
        case SelectionMode.single:
          _selectedDays = {dates.first};
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
            DateTime start = sortedDates.first;
            DateTime end = sortedDates.last;

            if (widget.maxWorkingDays != null || widget.maxRangeLength != null) {
              _applyRangeLimits(start, end, dates.first, (newStart, newEnd, newSelected) {
                _rangeStart = newStart;
                _rangeEnd = newEnd;
                _selectedDays = newSelected;
              });
            } else {
              _rangeStart = start;
              _rangeEnd = end;
              _selectedDays = _generateDateRange(start, end);
            }
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

  void selectDateRange(DateTime start, DateTime end) {
    if (start.isAfter(end)) {
      final temp = start;
      start = end;
      end = temp;
    }

    setState(() {
      if (widget.maxWorkingDays != null || widget.maxRangeLength != null) {
        _applyRangeLimits(start, end, start, (newStart, newEnd, newSelected) {
          _rangeStart = newStart;
          _rangeEnd = newEnd;
          _selectedDays = newSelected;
        });
      } else {
        _rangeStart = start;
        _rangeEnd = end;
        _selectedDays = _generateDateRange(start, end);
      }
    });
    widget.onSelectionChanged?.call(_selectedDays);
  }

  void updateSelection(Set<DateTime> selectedDates) {
    if (selectedDates.isEmpty) {
      clearSelection();
      return;
    }

    setState(() {
      switch (widget.selectionMode) {
        case SelectionMode.single:
          _selectedDays = {selectedDates.first};
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
            DateTime start = sortedDates.first;
            DateTime end = sortedDates.last;

            if (widget.maxWorkingDays != null || widget.maxRangeLength != null) {
              _applyRangeLimits(start, end, start, (newStart, newEnd, newSelected) {
                _rangeStart = newStart;
                _rangeEnd = newEnd;
                _selectedDays = newSelected;
              });
            } else {
              _rangeStart = start;
              _rangeEnd = end;
              _selectedDays = _generateDateRange(start, end);
            }
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

  void clearSelection() {
    setState(() {
      _selectedDays.clear();
      _rangeStart = null;
      _rangeEnd = null;
    });
    widget.onSelectionChanged?.call(_selectedDays);
  }

  Set<DateTime> get selectedDates => Set.from(_selectedDays);

  DateTime? get selectedDate => _selectedDays.isEmpty ? null : _selectedDays.first;

  DateTime? get rangeStart => _rangeStart;

  DateTime? get rangeEnd => _rangeEnd;

  bool get isRangeComplete => _rangeStart != null && _rangeEnd != null;

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
    final isCurrentMonth = today.month == _focusedDay.month && today.year == _focusedDay.year;
    final isCurrentYear = today.year == _focusedDay.year;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: _currentView != CalendarView.month ? _goToPrevious : null,
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
        const SizedBox(height: 24),
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
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
        if (widget.selectionMode != SelectionMode.range) {
          setState(() {
            switch (widget.selectionMode) {
              case SelectionMode.single:
                _selectedDays = {selectedDay};
                _rangeStart = null;
                _rangeEnd = null;
                break;
              case SelectionMode.multi:
                final alreadySelected = _selectedDays.any((d) => isSameDay(d, selectedDay));
                if (alreadySelected) {
                  _selectedDays.removeWhere((d) => isSameDay(d, selectedDay));
                } else {
                  _selectedDays.add(selectedDay);
                }
                _rangeStart = null;
                _rangeEnd = null;
                break;
              case SelectionMode.range:
                _selectedDays = {selectedDay};
                _rangeStart = selectedDay;
                _rangeEnd = null;
                break;
            }
            _focusedDay = focusedDay;
          });
          widget.onSelectionChanged?.call(_selectedDays);
          _handleDayTap(selectedDay);
          return;
        }

        // === RANGE MODE ===
        if (_rangeStart == null || (_rangeStart != null && _rangeEnd != null)) {
          // Start new range
          setState(() {
            _rangeStart = selectedDay;
            _rangeEnd = null;
            _selectedDays = {selectedDay};
            _focusedDay = focusedDay;
          });
          widget.onSelectionChanged?.call(_selectedDays);
          _handleDayTap(selectedDay);
        } else if (_rangeStart != null && _rangeEnd == null) {
          // Complete the range
          DateTime potentialStart = _rangeStart!;
          DateTime potentialEnd = selectedDay;

          if (selectedDay.isBefore(potentialStart)) {
            potentialEnd = potentialStart;
            potentialStart = selectedDay;
          }

          // Apply limits and update state
          _applyRangeLimits(potentialStart, potentialEnd, selectedDay, (newStart, newEnd, newSelected) {
            setState(() {
              _rangeStart = newStart;
              _rangeEnd = newEnd;
              _selectedDays = newSelected;
              _focusedDay = focusedDay;
            });
            widget.onSelectionChanged?.call(_selectedDays);
            _handleDayTap(selectedDay);
          });
        }
      },
      onPageChanged: _onPageChanged,
      headerVisible: false,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TFontRegular.caption2(context).copyWith(color: theme.mutedForeground),
        weekendStyle: TFontRegular.caption2(context).copyWith(color: theme.mutedForeground),
        dowTextFormatter: (date, locale) => ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'][date.weekday % 7],
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
        defaultDecoration: const BoxDecoration(shape: BoxShape.rectangle),
        weekendDecoration: const BoxDecoration(shape: BoxShape.rectangle),
        outsideDaysVisible: true,
        outsideTextStyle: TextStyle(color: theme.mutedForeground),
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, date, events) => _buildDayCell(context, date, theme),
        outsideBuilder: (context, date, _) => _buildDayCell(context, date, theme),
        todayBuilder: (context, date, _) => _buildDayCell(context, date, theme),
        selectedBuilder: (context, date, _) => _buildDayCell(context, date, theme),
        markerBuilder: (context, date, events) {
          final normalizedDate = DateTime(date.year, date.month, date.day);
          if ((_eventsMap[normalizedDate]?.isNotEmpty ?? false)) {
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

    final rangePosition = _getRangePosition(date);

    Decoration? backgroundDecoration;
    Color textColor = isCurrentMonth ? theme.foreground : theme.mutedForeground;

    if (isToday && !isSelected) {
      backgroundDecoration = BoxDecoration(
        color: theme.accent,
        borderRadius: BorderRadius.circular(6),
      );
      textColor = theme.foreground;
    } else if (isSelected) {
      if (widget.selectionMode == SelectionMode.range) {
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
            backgroundDecoration = BoxDecoration(color: theme.primary);
            textColor = theme.primaryForeground;
            break;
          case RangePosition.none:
            break;
        }
      } else {
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
            fontWeight: isToday || isSelected ? FontWeight.bold : FontWeight.normal,
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