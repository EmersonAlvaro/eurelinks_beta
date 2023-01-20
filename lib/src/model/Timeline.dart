import 'EventTimelime.dart';

class Timeline {
  List<EventTimeline> events;

  Timeline({required this.events});

  void addEvent(EventTimeline event) {
    events.add(event);
  }

  void removeEvent(EventTimeline event) {
    events.remove(event);
  }
}
