import 'Comment.dart';
import 'Evaluation.dart';

class Course {
  String name;
  String nameShort;
  String description;
  List<Comment> comments;
  List<Evaluation> evaluations;

  Course({
    required this.name,
    required this.nameShort,
    required this.description,
    required this.comments,
    required this.evaluations,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "nameShort": nameShort,
        "description": description,
        "comments": [],
        "evaluations": []
      };
}
