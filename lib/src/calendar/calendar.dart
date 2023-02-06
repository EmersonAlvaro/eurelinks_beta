import 'package:flutter/material.dart';
import 'create-event-calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarViewPage extends StatefulWidget {
  const CalendarViewPage({super.key});

  @override
  State<CalendarViewPage> createState() => _CreateCalendarPageState();
}

class _CreateCalendarPageState extends State<CalendarViewPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: SafeArea(
          child: TableCalendar(
            firstDay: DateTime.utc(2010,10,20),
            lastDay: DateTime.utc(2040,10,20),
            focusedDay: DateTime.now(),
            headerVisible: true,
            daysOfWeekVisible: true,
            sixWeekMonthsEnforced: true,
            shouldFillViewport: false,
            headerStyle: HeaderStyle(titleTextStyle: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.w800)),
            calendarStyle: CalendarStyle(todayTextStyle: TextStyle(fontSize:20, color: Colors.white, fontWeight: FontWeight.bold )),
          ),
        ),
          floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.post_add_outlined),
            label: const Text('add'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const  CreateEventCalendar()),
              );
            },
          )
      ),
    );

  }
}

