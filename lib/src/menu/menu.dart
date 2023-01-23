import 'package:flutter/material.dart';
import '../course/course.dart';
import '../clubs/clubs.dart';
import '../bde/bde.dart';
import '../bds/bds.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuView> {
  final List<String> _buttonLabels = [
    'Courses',
    'Clubs',
    'BDE',
    'BDS'
    // ,
    // 'Lab Parterner',
    // 'CarPooling',
    // 'Offices Info',
    // 'General Info'
  ];

  final List<Widget> _functions = [
    const CourseView(),
    const ClubsView(),
    const BDEView(),
    const BDSView()
  ];

  final List<IconData> _icon = [
    Icons.school_outlined,
    Icons.groups_outlined,
    Icons.book,
    Icons.book
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
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _functions[index],
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(_icon[index], size: 50, color: Colors.white),
                    const SizedBox(height: 10),
                    Text(_buttonLabels[index],
                        style: const TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: GridView.count(
  //       crossAxisCount: 2,
  //       children: List.generate(_buttonLabels.length, (index) {
  //         return Padding(
  //           padding: const EdgeInsets.symmetric(
  //             horizontal: 2,
  //             vertical: 2,
  //           ),
  //           child: TextButton(
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => _functions[index],
  //                 ),
  //               );
  //             },
  //             child: Text(_buttonLabels[index]),
  //           ),
  //         );
  //       }),
  //     ),
  //   );
  // }
}
