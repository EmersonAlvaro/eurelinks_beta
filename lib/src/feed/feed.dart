import 'package:flutter/material.dart';
import '../common/common.dart';
import 'create_news.dart';
import '../model/News.dart';
import 'package:intl/intl.dart';

bool _isPressed = true;

class FeedNewsView extends StatefulWidget {
  const FeedNewsView({super.key});
  @override
  State<FeedNewsView> createState() => _FeedNewsPageState();
}

class _FeedNewsPageState extends State<FeedNewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: FutureBuilder<List<News>>(
        future: getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView(
                restorationId: "list-news-feed-news",
                children: [
                  for (final news in snapshot.data!) NewsCard(news: news),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
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
      margin: const EdgeInsets.all(8),
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
            Text(
              'Titule: ${news.title}',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Description:  ${news.description}',
              maxLines: 10,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 8.0),
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
