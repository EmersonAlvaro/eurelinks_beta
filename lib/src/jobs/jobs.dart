import 'package:flutter/material.dart';


class JobsView extends StatelessWidget {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          colorScheme:
              Theme.of(context).colorScheme.copyWith(primary: Colors.purple)),
      child: const Text("Hello JobsView !"),
    );
  }
}