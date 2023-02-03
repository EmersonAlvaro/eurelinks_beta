import 'package:flutter/material.dart';
import '../common/dumydata.dart';
import 'package:intl/intl.dart';
import 'createjob.dart';
import '../model/Job.dart';
import '../common/common.dart';

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
      body: FutureBuilder<List<Job>>(
        future: getAllJobs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView(
                restorationId: "list-job-feed-job",
                children: [
                  for (final job in snapshot.data!) JobCard(job: job),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          // launch(job.urlpost);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 8.0),
              Text(job.title, style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  const CircleAvatar(
                    backgroundColor: Colors.black12,
                    child: Icon(
                      Icons.business_center,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          job.company,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          job.location,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                job.description,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(height: 8.0),
              Text(
                "Post Date: ${DateFormat.yMMMd().format(job.postedDate)}",
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
