import 'User.dart';


class Comment {
  String text;
  UserDetails author;
  DateTime timestamp;

  Comment({required this.text, required this.author, required this.timestamp});
}