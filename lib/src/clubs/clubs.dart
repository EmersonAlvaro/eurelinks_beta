import 'package:flutter/material.dart';
import '../common/dumydata.dart';

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
              onPressed: () {},
              child: Text(clubs[index].nameShort),
            ),
          );
        }),
      ),
    );
  }
}
