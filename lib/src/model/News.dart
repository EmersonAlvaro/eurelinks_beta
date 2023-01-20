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


List<News> createNewsList() {
  List<News> newsList = [];
  for (int i = 1; i <= 30; i++) {
    News news = News(
        title: "News $i",
        description:
            "EURECOM_$i is a French Graduate school and a research center in digital sciences. It is part of the Institut Mines-Télécom and it is a founding member of the SophiaTech Campus in Sophia Antipolis ",
        author: "Author $i",
        imageurl:
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
        date_created: DateTime.now());

    newsList.add(news);
  }
  return newsList;
}
