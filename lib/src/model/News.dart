import 'dart:convert';

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
      dateCreated: DateTime.parse(json['date_created']),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'author': author,
        'imageurl': imageurl,
        'date_created': dateCreated.toIso8601String(),
      };
}

News newsFromJson(String str) {
  final jsonData = json.decode(str);
  return News.fromJson(jsonData);
}

String newsToJson(News data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
