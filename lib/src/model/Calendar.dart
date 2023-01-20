import 'EventCalendar.dart';

class Calendar {
  List<EventCalendar> events;

  Calendar({required this.events});

  void addEvent(EventCalendar event) {
    events.add(event);
  }

  void removeEvent(EventCalendar event) {
    events.remove(event);
  }
}
