import 'package:eurelinks_beta/src/common/clubsdata.dart';
import 'package:flutter/material.dart';
import 'club_item_details.dart';
import '../model/Club.dart';

class ClubsView extends StatefulWidget {
  const ClubsView({super.key});

  @override
  State<ClubsView> createState() => _ClubsPageState();
}

final List<Club> clubItems = createlistclubs();

class _ClubsPageState extends State<ClubsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clubsss"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(clubItems.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 2,
              vertical: 2,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SampleClubItemDetailsView(clubItem: clubItems[index]),
                  ),
                );
              },
              child: Text(clubItems[index].name),
            ),
          );
        }),
      ),
    );
  }
}
