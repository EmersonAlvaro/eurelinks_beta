import 'package:flutter/material.dart';
import 'newsItems.dart';
import '../common/common.dart';

final List<News> newsItems = createNewsList();

class FeedNews extends StatelessWidget {
  const FeedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        restorationId: "list-news-feed-news",
        // padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        children: [for (final news in newsItems) NewsCard(news: news)],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 15, left: 4, right: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 184,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Ink.image(
                      image: NetworkImage(news.imageurl),
                      fit: BoxFit.cover,
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text('Author : ${news.author}'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: DefaultTextStyle(
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Titule: ${news.title}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text('Description:  ${news.description}',
                        maxLines: 10,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .caption!
                            .copyWith(color: Colors.black),
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
