# Calendar

Overview
- A flexible, themable calendar widget for selecting single, multiple, or ranged dates. Use it when you need event markers, range selection with business-day or calendar-day limits, or programmatic navigation/selection from parent widgets.
- Component source: [`TCalendar`](../../lib/src/form/calendar/calendar.dart) — [lib/src/form/calendar/calendar.dart](../../lib/src/form/calendar/calendar.dart)

Features
- Single, multi, and range selection modes via [`SelectionMode`](../../lib/src/form/calendar/calendar.dart).
- Event markers and event tap callback using [`EventData`](../../lib/src/form/calendar/event_data.dart).
- Programmatic control through a `GlobalKey<TCalendarState>`: jump/animate and select dates.
- Range limits: max calendar days (`maxRangeLength`) and max working days (`maxWorkingDays`).
- Year/month navigation with compact month & year pickers.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage 

```dart
TCalendar(
  firstDay: DateTime(2000, 4, 4),
  lastDay: DateTime(2030, 1, 2),
  selectionMode: SelectionMode.range,
  maxWorkingDays: 2,
  maxRangeLength: 5,
  onSelectionChanged: (selectedDates) {
    final state = calendarKey.currentState;
    if (state?.isRangeComplete == true) {
      print('Range: ${state?.rangeStart} to ${state?.rangeEnd}');
    }
    print('Selected ${selectedDates.length} dates: $selectedDates');

    final workingDays = selectedDates
        .where((d) => d.weekday >= DateTime.monday && d.weekday <= DateTime.friday)
        .toList();
    print('Selected: ${selectedDates.length} calendar days, ${workingDays.length} working days');
  },
  events: [
    EventData(
      date: DateTime(2025, 2, 18),
      title: 'Meeting',
      description: 'Discuss project updates',
    ),
    EventData(
      date: DateTime(2025, 3, 1),
      title: 'Deadline',
    ),
  ],
  onEventTap: (event) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tapped: ${event.title}')),
    );
  },
)
```

UI Preview

![Calendar Preview](../assets/calendar/calendar_preview.gif)

## Additional Usage Examples

```dart
// Attach a GlobalKey<TCalendarState> (calendarKey) and call:
calendarKey.currentState?.jumpToAndSelectDate(DateTime.now());
```

Single-date calendar (example variant)
```dart
// Example: Single selection calendar with events
final GlobalKey<TCalendarState> calendarKey = GlobalKey<TCalendarState>();

TCalendar(
  key: calendarKey,
  firstDay: DateTime(2000, 4, 4),
  lastDay: DateTime(2030, 1, 2),
  selectionMode: SelectionMode.single,
  onSelectionChanged: (selectedDates) {
    print('Selected ${selectedDates.length} dates: $selectedDates');
  },
  events: [
    EventData(date: DateTime(2025, 2, 18), title: 'Meeting'),
  ],
  onEventTap: (event) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tapped: ${event.title}')),
    );
  },
)
```
