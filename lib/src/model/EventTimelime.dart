import 'Event.dart';

class EventTimeline extends Event {
  String mediaResoureURL;

  EventTimeline(
      {required super.name,
      required super.description,
      required super.date,
      required this.mediaResoureURL});
}
