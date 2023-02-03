import 'package:eurelinks_beta/src/common/coursedata.dart';
import 'package:flutter/material.dart';
import '../model/Course.dart';
import 'course_item_details.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key});

  @override
  State<CourseView> createState() => _CoursePageState();
}

final List<Course> courseItems = createlistcourse();

class _CoursePageState extends State<CourseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(courseItems.length, (index) {
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
                    builder: (context) => SampleCourseItemDetailsView(
                        courseItem: courseItems[index]),
                  ),
                );
              },
              child: Text(courseItems[index].nameShort),
            ),
          );
        }),
      ),
    );
  }
}
