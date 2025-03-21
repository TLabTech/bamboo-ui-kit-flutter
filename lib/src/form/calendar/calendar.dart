import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bamboo_ui_kit/gen/assets.gen.dart';
import 'package:flutter_bamboo_ui_kit/src/form/calendar/year_selector.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

enum CalendarView { year, month, date }

class TCalendar extends StatefulWidget {
  final List<EventData> events;
  final Function(EventData)? onEventTap;
  final DateTime firstDay;
  final DateTime lastDay;

  const TCalendar({
    super.key,
    this.events = const [],
    this.onEventTap,
    required this.firstDay,
    required this.lastDay,
  });

  @override
  TCalendarState createState() => TCalendarState();
}

class TCalendarState extends State<TCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
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
    _selectedDay = _focusedDay;
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

  @override
  Widget build(BuildContext context) {
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
                    _hasPrevious ? HexColor(gray900) : HexColor(gray300),
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
                        color: HexColor(gray900),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: HexColor(gray900),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: _currentView != CalendarView.month ? _goToNext : null,
                child: SvgPicture.asset(
                  Assets.svg.nextCircle,
                  colorFilter: ColorFilter.mode(
                    _hasNext ? HexColor(gray900) : HexColor(gray300),
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
          isCurrentMonth: isCurrentMonth,
          isCurrentYear: isCurrentYear,
        ),
      ],
    );
  }

  Widget _buildCalendarContent({
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
        return _buildMonthSelector();
      case CalendarView.date:
        return _buildCalendarView(
          isCurrentMonth: isCurrentMonth,
          isCurrentYear: isCurrentYear,
        );
    }
  }

  Widget _buildMonthSelector() {
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
                  ? Color(0xFF00DE9C)
                  : isSelected
                      ? Color(0xFFEAFFF6)
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              DateFormat('MMM').format(DateTime(2025, month)),
              style: TFontRegular.body(context).copyWith(
                color: isCurrentMonth
                    ? Colors.white
                    : isSelected
                        ? Color(0xFF00DE9C)
                        : Colors.black54,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCalendarView({
    required bool isCurrentMonth,
    required bool isCurrentYear,
  }) {
    return TableCalendar(
      firstDay: DateTime.utc(widget.firstDay.year, 1, 1),
      lastDay: DateTime.utc(widget.lastDay.year, 12, 31),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
        _handleDayTap(selectedDay);
      },
      onPageChanged: _onPageChanged,
      headerVisible: false,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TFontRegular.caption2(context).copyWith(color: Colors.grey),
        weekendStyle: TFontRegular.caption2(context).copyWith(color: Colors.grey),
        dowTextFormatter: (date, locale) =>
            ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'][date.weekday % 7],
      ),
      calendarFormat: CalendarFormat.month,
      calendarStyle: CalendarStyle(
        markersMaxCount: 3,
        todayDecoration: BoxDecoration(
          color: HexColor(primary500),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6),
        ),
        todayTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        selectedDecoration: BoxDecoration(
          color: HexColor(primary050),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6),
        ),
        selectedTextStyle: TextStyle(
          color: HexColor(primary500),
          fontWeight: FontWeight.bold,
        ),
        defaultDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        weekendDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        outsideDaysVisible: true,
        outsideTextStyle: const TextStyle(color: Colors.grey),
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, date, events) {
          final isToday = isSameDay(date, DateTime.now());
          final isSelected = isSameDay(date, _selectedDay);

          return Center(
            child: Text(
              '${date.day}',
              style: TFontRegular.body(context).copyWith(
                color: isSelected
                    ? HexColor(gray500)
                    : isToday
                        ? HexColor(gray500)
                        : isCurrentMonth || isCurrentYear
                            ? HexColor(gray500)
                            : HexColor(gray500),
              ),
            ),
          );
        },
        outsideBuilder: (context, date, _) {
          return Center(
            child: Text(
              '${date.day}',
              style: TextStyle(color: Colors.grey),
            ),
          );
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
                      color: HexColor(primary500),
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

  void _handleDayTap(DateTime date) {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final events = _eventsMap[normalizedDate] ?? [];
    if (events.isNotEmpty && widget.onEventTap != null) {
      widget.onEventTap!(events.first);
    }
  }
}
