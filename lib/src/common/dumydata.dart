import '../model/Course.dart';
import '../model/Evaluation.dart';
import '../model/User.dart';
import '../model/Comment.dart';
import '../model/Job.dart';
import '../model/Club.dart';
import '../model/EventCalendar.dart';
import '../model/EventTimelime.dart';
import '../model/News.dart';
import '../model/Event.dart';

List<News> createNewsList() {
  List<News> newsList = [];
  for (int i = 1; i <= 30; i++) {
    News news = News(
        title: "News $i",
        description:
            "EURECOM_$i is a French Graduate school and a research center in digital sciences. It is part of the Institut Mines-Télécom and it is a founding member of the SophiaTech Campus in Sophia Antipolis ",
        author: "Author $i",
        imageurl:
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
        dateCreated: DateTime.now());

    newsList.add(news);
  }
  return newsList;
}

final List<User> users = List.generate(
  30,
  (index) => User(
    lastName: 'LastName ${index + 1}',
    firstName: 'FirstName ${index + 1}',
    email: 'user${index + 1}@email.com',
    username: 'user${index + 1}',
    role: 'user',
    password: 'password${index + 1}',
  ),
);

final List<Comment> comments = List.generate(
  30,
  (index) => Comment(
    text: 'This is a comment by user ${index + 1}',
    author: users[index],
    timestamp: DateTime.now(),
  ),
);

final List<Evaluation> evaluations = List.generate(
  30,
  (index) => Evaluation(
    course_organization_score: (index + 1) % 5,
    course_content_score: (index + 1) % 5,
    course_teaching_score: (index + 1) % 5,
    course_general_score: (index + 1) % 5,
  ),
);

final List<Course> courses = List.generate(
  30,
  (index) => Course(
    name: 'Course ${index + 1}',
    nameShort: 'Course_Item_${index + 1}',
    description: 'This is a description for course ${index + 1}',
    comments: List.generate(
      10,
      (index) => Comment(
        text: 'This is a comment by user ${index + 1}',
        author: users[index],
        timestamp: DateTime.now(),
      ),
    ),
    evaluations: List.generate(
      10,
      (i) => Evaluation(
        course_organization_score: (i + 1) % 5,
        course_content_score: (i + 1) % 5,
        course_teaching_score: (i + 1) % 5,
        course_general_score: (i + 1) % 5,
      ),
    ),
  ),
);

final List<Job> jobs = List.generate(
  30,
  (index) => Job(
    title: 'Job ${index + 1}',
    company: 'Company ${index + 1}',
    location: 'Location ${index + 1}',
    description: 'This is a description for job ${index + 1}',
    urlpost: 'https://job${index + 1}.com',
    postedDate: DateTime.now(),
  ),
);

final List<Club> clubs = List.generate(
  30,
  (index) => Club(
    name: 'Club ${index + 1}',
    nameShort: 'Club_Item_${index + 1}',
    description: 'This is a description for club ${index + 1}',
    presidenteName: 'President ${index + 1}',
  ),
);

final List<EventCalendar> calendarEvents = List.generate(
  30,
  (index) => EventCalendar(
    name: 'Event ${index + 1}',
    description: 'This is a description for event ${index + 1}',
    date: DateTime.now(),
    location: 'Location ${index + 1}',
  ),
);

final List<EventTimeline> timelineEvents = List.generate(
  30,
  (index) => EventTimeline(
    name: 'Event ${index + 1}',
    description: 'This is a description for event ${index + 1}',
    date: DateTime.now(),
    mediaResoureURL: 'https://event${index + 1}.com',
  ),
);

final List<Event> events = List.generate(
  30,
  (index) => Event(
    name: 'Event ${index + 1}',
    description: 'Description ${index + 1}',
    date: DateTime.now(),
  ),
);
