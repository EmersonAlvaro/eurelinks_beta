import 'package:flutter/material.dart';
import '../common/dumydata.dart';
import 'club_item_details.dart';

class ClubsView extends StatefulWidget {
  const ClubsView({super.key});

  @override
  State<ClubsView> createState() => _ClubsPageState();
}

class _ClubsPageState extends State<ClubsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clubs"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(clubs.length, (index) {
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
                        SampleClubItemDetailsView(clubItem: clubs[index]),
                  ),
                );
              },
              child: Text(clubs[index].nameShort),
            ),
          );
        }),
      ),
    );
  }
}
