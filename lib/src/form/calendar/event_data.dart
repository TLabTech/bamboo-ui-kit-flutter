class EventData {
  final DateTime date;
  final String title;
  final String? description;
  final DateTime? startTime;
  final DateTime? endTime;

  EventData({
    required this.date,
    required this.title,
    this.description,
    this.startTime,
    this.endTime
  });
}