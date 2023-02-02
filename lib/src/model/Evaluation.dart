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

  Map<String, dynamic> toJson() => {
        "course_organization_score": course_organization_score,
        "course_content_score": course_content_score,
        "course_teaching_score": course_teaching_score,
        "course_general_score": course_general_score
      };
}
