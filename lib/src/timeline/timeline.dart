import 'package:flutter/material.dart';


class TimelineView extends StatelessWidget {
  const TimelineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          colorScheme:
              Theme.of(context).colorScheme.copyWith(primary: Colors.purple)),
      child: const Text("Hello TimelineView !"),
    );
  }
}