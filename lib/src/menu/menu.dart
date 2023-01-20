import 'package:flutter/material.dart';
import '../course/course.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuView> {
  final List<String> _buttonLabels = ['Courses', 'Clubs', 'BDE', 'BDS'];

  final List<Widget> _functions = [
    const CourseView(),
    const CourseView(),
    const CourseView(),
    const CourseView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(_buttonLabels.length, (index) {
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
                    builder: (context) => _functions[index],
                  ),
                );
              },
              child: Text(_buttonLabels[index]),
            ),
          );
        }),
      ),
    );
  }
}
