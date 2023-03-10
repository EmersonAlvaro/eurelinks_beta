import 'package:flutter/material.dart';
import '../common/dumydata.dart';
import 'package:intl/intl.dart';
import 'create-event-timeline.dart';

class TimelineView extends StatefulWidget {
  const TimelineView({super.key});

  @override
  State<TimelineView> createState() => _CreateTimelinePageState();
}

class _CreateTimelinePageState extends State<TimelineView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.post_add_outlined),
        label: const Text('add'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CreateEventTimeline()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: <Widget>[
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: double.infinity,
                    // height: selectedIndex == index ? 150 : 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    DateFormat.MMM()
                                        .format(events[index].date)
                                        .toString(),
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    textAlign: TextAlign.right,
                                  ),
                                  Text(
                                    DateFormat.d()
                                        .format(events[index].date)
                                        .toString(),
                                    textAlign: TextAlign.right,
                                  ),
                                  Text(
                                    DateFormat.y()
                                        .format(events[index].date)
                                        .toString(),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 40.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    events[index].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(events[index].description),
                                  const SizedBox(height: 10),
                                  Text(DateFormat.yMMMd()
                                      .format(events[index].date)
                                      .toString()),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black12,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
