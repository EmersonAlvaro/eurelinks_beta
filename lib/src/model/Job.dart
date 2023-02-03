class Job {
  final String title;
  final String company;
  final String location;
  final String description;
  final String urlpost;
  // final DateTime postedDate;

  Job(
      {required this.title,
      required this.company,
      required this.location,
      required this.description,
      required this.urlpost,
      // required this.postedDate,
      });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json['title'],
      company: json['company'],
      location: json['location'],
      description: json['description'],
      urlpost: json['urlpost'],
      // postedDate: DateTime.parse(json['postedDate']),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'company': company,
        'location': location,
        'description': description,
        'urlpost': urlpost,
        // 'postedDate': postedDate
      };
}
