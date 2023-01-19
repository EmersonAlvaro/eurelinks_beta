class User {
  String lastName;
  String firstName;
  String email;
  String password;
  String username;
  String role;

  User(
      {required this.lastName,
      required this.firstName,
      required this.email,
      required this.username,
      required this.role,
      required this.password});
}

class Event {
  String name;
  String description;
  DateTime date;

  Event({required this.name, required this.description, required this.date});
}

class EventCalendar extends Event {
  String location;

  EventCalendar(
      {required super.name,
      required super.description,
      required super.date,
      required this.location});
}

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

class EventTimelime extends Event {
  String mediaResoureURL;

  EventTimelime(
      {required super.name,
      required super.description,
      required super.date,
      required this.mediaResoureURL});
}

class Timeline {
  List<EventTimelime> events;

  Timeline({required this.events});

  void addEvent(EventTimelime event) {
    events.add(event);
  }

  void removeEvent(EventTimelime event) {
    events.remove(event);
  }
}

class News {
  String title;
  String description;
  String author;
  String imageurl;

  News(
      {required this.title,
      required this.description,
      required this.author,
      required this.imageurl});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      description: json['description'],
      author: json['author'],
      imageurl: json['imageurl'],
    );
  }
}

class Comment {
  String text;
  User author;
  DateTime timestamp;

  Comment({required this.text, required this.author, required this.timestamp});
}

class Evaluation {
  int course_organization_score;
  int course_content_score;
  int course_teaching_score;
  int course_general_score;

  Evaluation(
      {required this.course_organization_score,
      required this.course_content_score,
      required this.course_teaching_score,
      required this.course_general_score});
}

class Course {
  String name;
  String description;
  List<Comment> comments;
  List<Evaluation> evaluations;

  Course(
      {required this.name,
      required this.description,
      required this.comments,
      required this.evaluations});
}
