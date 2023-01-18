import 'package:flutter/material.dart';
import '../common/common.dart';

import '../calendar/calendar.dart';
import '../feed/feed.dart';
import '../jobs/jobs.dart';
import '../menu/menu.dart';
import '../timeline/timeline.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<HomePage> {
  
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FeedNews(),
    CalendarView(),
    TimelineView(),
    JobsView(),
    MenuView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EURELINK'),
        actions: [
          IconButton(
            // tooltip: localization.starterAppTooltipFavorite,
            icon: const Icon(
              Icons.account_circle_outlined,
            ),
            onPressed: () {},
          ),
          IconButton(
            // tooltip: localization.starterAppTooltipSearch,
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        backgroundColor: Theme.of(context).colorScheme.onPrimary,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline_outlined),
            label: 'TimeLine',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
