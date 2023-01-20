class Job {
  final String title;
  final String company;
  final String location;
  final String description;
  final String urlpost;
  final DateTime postedDate;

  Job(
      {required this.title,
      required this.company,
      required this.location,
      required this.description,
      required this.urlpost,
      required this.postedDate});
}
