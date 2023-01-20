import 'Event.dart';

class EventCalendar extends Event {
  String location;

  EventCalendar(
      {required super.name,
      required super.description,
      required super.date,
      required this.location});
}

