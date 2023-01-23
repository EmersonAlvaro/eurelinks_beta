class News {
  String title;
  String description;
  String author;
  String imageurl;
  DateTime dateCreated;

  News(
      {required this.title,
      required this.description,
      required this.author,
      required this.imageurl, 
      required this.dateCreated});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      description: json['description'],
      author: json['author'],
      imageurl: json['imageurl'],
      dateCreated: json['date_created'],
    );
  }
}


