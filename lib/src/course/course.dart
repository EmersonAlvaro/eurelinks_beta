import 'package:flutter/material.dart';
import '../model/Course.dart';
import '../common/dumydata.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key});

  @override
  State<CourseView> createState() => _CoursePageState();
}

class _CoursePageState extends State<CourseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(courses.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 2,
              vertical: 2,
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(courses[index].nameShort),
            ),
          );
        }),
      ),
    );
  }
}



