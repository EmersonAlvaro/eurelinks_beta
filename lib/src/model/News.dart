class News {
  String title;
  String description;
  String author;
  String imageurl;
  DateTime date_created;

  News(
      {required this.title,
      required this.description,
      required this.author,
      required this.imageurl, 
      required this.date_created});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      description: json['description'],
      author: json['author'],
      imageurl: json['imageurl'],
      date_created: json['date_created'],
    );
  }
}


