import 'package:flutter/material.dart';
import '../common/dumydata.dart';
import 'package:intl/intl.dart';
import 'createjob.dart';

class JobsView extends StatefulWidget {
  const JobsView({super.key});

  @override
  State<JobsView> createState() => _JobsViewPageState();
}

class _JobsViewPageState extends State<JobsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.post_add_outlined),
        label: const Text('job'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateJobPage()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                // launch(jobs[index].urlpost);
              },
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 8.0),
                    Text(jobs[index].title,
                        style: Theme.of(context).textTheme.headline6),
                    SizedBox(height: 8.0),
                    Row(
                      children: <Widget>[
                        const CircleAvatar(
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons.business_center,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                jobs[index].company,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                jobs[index].location,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      jobs[index].description,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Post Date: ${DateFormat.yMMMd().format(jobs[index].postedDate)}",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
