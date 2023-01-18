import 'package:flutter/material.dart';
import '../common/common.dart';

List<News> createNewsList() {
  List<News> newsList = [];
  for (int i = 1; i <= 30; i++) {
    News news = News(
        title: "News $i",
        description:
            "EURECOM_$i is a French Graduate school and a research center in digital sciences. It is part of the Institut Mines-Télécom and it is a founding member of the SophiaTech Campus in Sophia Antipolis ",
        author: "Author $i",
        imageurl:
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg");
    newsList.add(news);
  }
  return newsList;
}
