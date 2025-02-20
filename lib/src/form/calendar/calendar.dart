import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/form/calendar/event_data.dart';
import 'package:intl/intl.dart';

class TCalendar extends StatefulWidget {
  final Function(DateTime)? onTitleTapped;
  final Function(DateTime)? onNextMonth;
  final Function(DateTime)? onPreviousMonth;
  final Function(List<CalendarEventData>, DateTime)? onCellTap;
  final Function(CalendarEventData, DateTime)? onEventTap;
  final Function(CalendarEventData, DateTime)? onEventLongTap;

  const TCalendar({
    super.key,
    this.onTitleTapped,
    this.onNextMonth,
    this.onPreviousMonth,
    this.onCellTap,
    this.onEventTap,
    this.onEventLongTap,
  });

  @override
  State<TCalendar> createState() => TCalendarState();
}

class TCalendarState extends State<TCalendar> {
  final GlobalKey<MonthViewState> keyMonth = GlobalKey<MonthViewState>();
  final keyDay = GlobalKey<DayViewState>();
  final EventController _eventController = EventController();
  final List<CalendarEventData> _events = [];
  DateTime _now = DateTime.now();
  DateTime? _selectedDate;

  void jumpToDate(DateTime date) {
    setState(() {
      _now = date;
    });
    keyDay.currentState?.jumpToDate(date);
  }

  @override
  void initState() {
    super.initState();
    _eventController.addAll(_events);
  }

  void addEvents(List<EventData> events) {
    setState(() {
      final calendarEvents =
          events.map((event) => event.toCalendarEventData()).toList();
      _events.addAll(calendarEvents);
      _eventController.addAll(calendarEvents);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MonthView(
      key: keyMonth,
      controller: _eventController,
      cellAspectRatio: 1,
      useAvailableVerticalSpace: false,
      hideDaysNotInMonth: false,
      showBorder: false,
      showWeekTileBorder: false,
      borderColor: Colors.transparent,
      cellBuilder: (date, events, isToday, isInMonth, _) {
        final isSelected = _selectedDate != null &&
            DateFormat('yyyy-MM-dd').format(_selectedDate!) ==
                DateFormat('yyyy-MM-dd').format(date);

        final isHighlighted = isSelected || isToday;
        return FilledCellSample(
          date: date,
          shouldHighlight: isToday || isSelected,
          backgroundColor: isSelected ? Colors.green : Colors.transparent,
          events: events,
          hideDaysNotInMonth: false,
          isInMonth: isInMonth,
          titleColor: Colors.black,
          highlightColor:
              isHighlighted ? HexColor(neutral400) : Colors.transparent,
        );
      },
      initialMonth: _now,
      onPageChange: (date, pageIndex) {
        setState(() {
          _now = date;
        });
      },
      headerBuilder: (date) {
        return MonthPageHeader(
          headerStyle: HeaderStyle(
            titleAlign: TextAlign.start,
            leftIcon: Icon(Icons.arrow_back, color: Colors.black),
            rightIcon: Icon(Icons.arrow_forward, color: Colors.black),
            headerTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              color: Colors.transparent,
            ),
          ),
          onTitleTapped: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: _now,
              firstDate: DateTime(1990),
              lastDate: DateTime(2050),
            );
            if (selectedDate != null && widget.onTitleTapped != null) {
              widget.onTitleTapped!(selectedDate);
              setState(() {
                _now = selectedDate;
                _selectedDate = selectedDate;
              });
              keyDay.currentState?.jumpToDate(_now);
            }
          },
          onNextMonth: () {
            keyMonth.currentState?.nextPage();
            if (widget.onNextMonth != null) {
              widget.onNextMonth!(_now);
            }
          },
          onPreviousMonth: () {
            keyMonth.currentState?.previousPage();
            if (widget.onPreviousMonth != null) {
              widget.onPreviousMonth!(_now);
            }
          },
          date: date,
        );
      },
      onEventTap: (event, date) {
        if (widget.onEventTap != null) {
          widget.onEventTap!(event, date);
        }
      },
      onCellTap: (events, date) {
        if (widget.onCellTap != null) {
          widget.onCellTap!(events, date);
          setState(() {
            _selectedDate = date;
          });
          jumpToDate(date);
        }
      },
      onEventLongTap: (event, date) {
        if (widget.onEventLongTap != null) {
          widget.onEventLongTap!(event, date);
        }
      },
    );
  }
}

class FilledCellSample extends StatelessWidget {
  final DateTime date;
  final bool shouldHighlight;
  final Color backgroundColor;
  final List<CalendarEventData> events;
  final bool hideDaysNotInMonth;
  final bool isInMonth;
  final Color titleColor;
  final Color highlightColor;

  const FilledCellSample({
    super.key,
    required this.date,
    required this.shouldHighlight,
    required this.backgroundColor,
    required this.events,
    required this.hideDaysNotInMonth,
    required this.isInMonth,
    required this.titleColor,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    final isToday = date.year == DateTime.now().year &&
        date.month == DateTime.now().month &&
        date.day == DateTime.now().day;

    return Container(
      decoration: BoxDecoration(
        color: _getBackgroundColor(isToday, shouldHighlight),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Text(
              DateFormat('d').format(date),
              style: TextStyle(
                color: _getTextColor(isToday, shouldHighlight),
                fontWeight: shouldHighlight || isToday
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            if (events.isNotEmpty)
              Positioned(
                top: -5,
                right: -8,
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
        ),
      ),
    );
  }

  Color _getBackgroundColor(bool isToday, bool isSelected) {
    if (isToday) {
      return HexColor(primary500);
    } else if (isSelected) {
      return HexColor(primary050);
    } else {
      return backgroundColor;
    }
  }

  Color _getTextColor(bool isToday, bool isSelected) {
    if (isToday) {
      return HexColor(primary050);
    } else if (isSelected) {
      return HexColor(primary500);
    } else {
      return isInMonth ? titleColor : Colors.grey;
    }
  }
}
