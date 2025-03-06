import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/form/calendar_custom/calendar_event.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  final List<CalendarEvent> events;
  final Function(CalendarEvent)? onEventTap;

  const CustomCalendar({
    super.key,
    this.events = const [],
    this.onEventTap,
  });

  @override
  CustomCalendarState createState() => CustomCalendarState();
}

class CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late Map<DateTime, List<CalendarEvent>> _eventsMap;

  @override
  void initState() {
    super.initState();
    _eventsMap = _groupEventsByDate(widget.events);
    _selectedDay = _focusedDay; // Default to today
  }

  Map<DateTime, List<CalendarEvent>> _groupEventsByDate(
      List<CalendarEvent> events) {
    final Map<DateTime, List<CalendarEvent>> grouped = {};
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
    setState(() {
      _focusedDay =
          DateTime(_focusedDay.year, _focusedDay.month - 1, _focusedDay.day);
    });
  }

  void _goToNext() {
    setState(() {
      _focusedDay =
          DateTime(_focusedDay.year, _focusedDay.month + 1, _focusedDay.day);
    });
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final isCurrentMonth =
        today.month == _focusedDay.month && today.year == _focusedDay.year;
    final isCurrentYear = today.year == _focusedDay.year;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header with navigation
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left, size: 24),
                  onPressed: _goToPrevious,
                  color: Colors.grey[600],
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Select Month/Year'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DropdownButton<int>(
                              value: _focusedDay.year,
                              items: List.generate(10, (index) => 2020 + index)
                                  .map((year) => DropdownMenuItem<int>(
                                        value: year,
                                        child: Text('$year'),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    _focusedDay = DateTime(value,
                                        _focusedDay.month, _focusedDay.day);
                                  });
                                  Navigator.pop(context);
                                }
                              },
                            ),
                            DropdownButton<int>(
                              value: _focusedDay.month,
                              items: List.generate(12, (index) => index + 1)
                                  .map((month) => DropdownMenuItem<int>(
                                        value: month,
                                        child: Text(DateFormat('MMMM')
                                            .format(DateTime(2025, month))),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    _focusedDay = DateTime(_focusedDay.year,
                                        value, _focusedDay.day);
                                  });
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateFormat.yMMMM().format(_focusedDay),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.arrow_drop_down,
                          size: 20, color: Colors.grey),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right, size: 24),
                  onPressed: _goToNext,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
          // Calendar
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
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
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.grey),
              weekendStyle: TextStyle(color: Colors.grey),
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: const BoxDecoration(
                color: Color(0xFF00DE9C), // Vibrant green for today
                shape: BoxShape.circle,
              ),
              selectedDecoration: const BoxDecoration(
                color: Color(0xFFEAFFF6), // Light green for selected
                shape: BoxShape.circle,
              ),
              defaultDecoration: isCurrentMonth || isCurrentYear
                  ? const BoxDecoration(color: Color(0xFFEAFFF6))
                  : const BoxDecoration(),
              weekendDecoration: const BoxDecoration(),
              outsideDaysVisible: false,
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, date, events) {
                final isToday = isSameDay(date, DateTime.now());
                final isSelected = isSameDay(date, _selectedDay);

                print('CalendarBuilders isSelected $isSelected');
                print('CalendarBuilders _selectedDay $_selectedDay');
                print('CalendarBuilders isToday $isToday');

                return Center(
                  child: Text(
                    '${date.day}',
                    style: TextStyle(
                      color: isToday
                          ? Colors.white // White for today
                          : isSelected
                              ? const Color(0xFF00DE9C) // #00DE9C for selected
                              : isCurrentMonth || isCurrentYear
                                  ? Colors.black // Black for current month/year
                                  : Colors.grey, // Grey for others
                    ),
                  ),
                );
              },
              markerBuilder: (context, date, events) {
                if (_eventsMap[date]?.isNotEmpty ?? false) {
                  return Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  void _handleDayTap(DateTime day) {
    final events = _eventsMap[day] ?? [];
    if (events.isNotEmpty && widget.onEventTap != null) {
      widget.onEventTap!(events.first);
    }
  }
}
