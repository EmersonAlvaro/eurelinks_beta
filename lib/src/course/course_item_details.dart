import 'package:flutter/material.dart';
import '../model/Course.dart';
import 'Evaluate.dart';

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
            MaterialPageRoute(builder: (context) => const EvaluationPage()),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: DefaultTextStyle(
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${courseItem.name}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text('Description:  ${courseItem.description}',
                        maxLines: 10,
                        // style: Theme.of(context).primaryTextTheme.subtitle2!,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'General Evaluation : ${sumGeneral.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Content Evaluation : ${sumContent.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Teaching Evaluation : ${sumTeaching.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Organization Evaluation : ${sumOrganization.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
