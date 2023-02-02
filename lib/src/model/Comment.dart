import 'User.dart';

class Comment {
  String text;
  DateTime timestamp;

  Comment({required this.text, required this.timestamp});

  Map<String, dynamic> toJson() =>
      {"text": text, "timestamp": timestamp};
}
