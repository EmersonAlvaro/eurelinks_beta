import 'package:eurelinks_beta/src/model/Comment.dart';
import 'package:flutter/material.dart';
import '../model/Course.dart';
import 'Evaluate.dart';
import 'package:intl/intl.dart';

/// Displays detailed information about a SampleItem.
class SampleCourseItemDetailsView extends StatelessWidget {
  const SampleCourseItemDetailsView({super.key, required this.courseItem});

  final Course courseItem;

  @override
  Widget build(BuildContext context) {
    double sumOrganization = 0;
    double sumContent = 0;
    double sumTeaching = 0;
    double sumGeneral = 0;

    for (final eval in courseItem.evaluations) {
      sumOrganization += eval.course_organization_score;
      sumContent += eval.course_content_score;
      sumTeaching += eval.course_teaching_score;
      sumGeneral += eval.course_general_score;
    }

    sumOrganization = sumOrganization / courseItem.evaluations.length;
    sumContent = sumContent / courseItem.evaluations.length;
    sumGeneral = sumGeneral / courseItem.evaluations.length;
    sumTeaching = sumTeaching / courseItem.evaluations.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('${courseItem.name} Details'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.post_add_outlined),
        label: const Text('Evaluate'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EvaluationPage(
                      courseItem: courseItem,
                    )),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 184,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Ink.image(
                      image: NetworkImage(
                          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
                      fit: BoxFit.cover,
                      child: Container(),
                    ),
                  ),
                ],
              ),
            ),
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 16.0),
                  Text(
                    'Name: ${courseItem.name}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(width: 16.0),
                  const SizedBox(width: 16.0),
                  Text('\nDescription:  ${courseItem.description}',
                      maxLines: 10,
                      style: Theme.of(context).textTheme.subtitle1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ]
                // ),
                ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'General Evaluation',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '${sumGeneral.toString()} /5',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Content Evaluation ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '${sumContent.toString()} /5',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Teaching Evaluation',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '${sumTeaching.toString()} /5',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Organization Evaluation',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '${sumOrganization.toString()} /5',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16.0),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: courseItem.comments.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(width: 16.0),
                        const CircleAvatar(
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons.comment_bank,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                courseItem.comments[index].text,
                                style: Theme.of(context).textTheme.subtitle1,
                                maxLines: 5,
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                "Post Date: ${DateFormat.yMMMd().format(courseItem.comments[index].timestamp)}",
                                style: Theme.of(context).textTheme.caption,
                              ),
                              const SizedBox(width: 16.0)
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const CircleAvatar(
          backgroundColor: Colors.black12,
          child: Icon(
            Icons.comment_bank,
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                comment.text,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 8.0),
              Text(
                "Post Date: ${DateFormat.yMMMd().format(comment.timestamp)}",
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
