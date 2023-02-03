import 'package:flutter/material.dart';
import '../model/Club.dart';

/// Displays detailed information about a SampleItem.
class SampleClubItemDetailsView extends StatelessWidget {
  const SampleClubItemDetailsView({super.key, required this.clubItem});

  final Club clubItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${clubItem.name} Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 184,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Ink.image(
                      image: const NetworkImage(
                          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
                      fit: BoxFit.cover,
                      child: Container(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: DefaultTextStyle(
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${clubItem.name}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text('Description:  ${clubItem.description}',
                        maxLines: 10,
                        // style: Theme.of(context).primaryTextTheme.subtitle2!,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
