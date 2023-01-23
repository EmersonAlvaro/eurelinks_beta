import 'package:flutter/material.dart';
import '../common/common.dart';
import 'create_news.dart';
import '../model/News.dart';
import '../common/dumydata.dart';
import 'package:intl/intl.dart';

bool _isPressed = true;

final List<News> newsItems = createNewsList();

class FeedNews extends StatelessWidget {
  const FeedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        restorationId: "list-news-feed-news",
        // padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        children: [
          for (final news in newsItems) NewsCard(news: news),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.post_add_outlined),
        label: const Text('post'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePostPage()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 4, right: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.account_circle_outlined),
                  onPressed: () {},
                ),
                Text(news.author),
              ],
            ),
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
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  // icon: const Icon(Icons.favorite_outline_rounded),
                  icon: _isPressed
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_outlined),
                  onPressed: () {
                    _isPressed = !_isPressed;
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.comment_bank_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.share_sharp),
                  onPressed: () {},
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            //   child: DefaultTextStyle(
            //     softWrap: false,
            //     overflow: TextOverflow.ellipsis,
            //     style: Theme.of(context).textTheme.subtitle1!,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           'Titule: ${news.title}',
            //           // style: const TextStyle(fontSize: 20),
            //           style: Theme.of(context).textTheme.headline6,
            //         ),
            //         SizedBox(height: 8.0),
            //         Text(
            //           'Description:  ${news.description}',
            //           maxLines: 10,
            //           style: Theme.of(context).textTheme.bodyText2,
            //           // style: Theme.of(context).primaryTextTheme.subtitle2!,
            //           // overflow: TextOverflow.ellipsis,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Text(
              'Titule: ${news.title}',
              // style: const TextStyle(fontSize: 20),
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8.0),
            Text(
              'Description:  ${news.description}',
              maxLines: 10,
              style: Theme.of(context).textTheme.bodyText2,
              // style: Theme.of(context).primaryTextTheme.subtitle2!,
              // overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8.0),
            Text(
              "Post Date: ${DateFormat.yMMMd().format(news.dateCreated)}",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
