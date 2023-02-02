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

import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase _database = FirebaseDatabase.instance;

List<Course> createlistcourse() {
  List<Course> courselist = [];
  Course courses = Course(
      name: "MACHINE LEARNING AND INTELLIGENT SYSTEM",
      nameShort: "Malis",
      description:
          "The objective of this course is to give students a solid background in Machine Learning (ML) techniques.\n ML techniques are used to build efficient models for problems for which an optimal solution is unknown. This course will introduce\n the basic theories of Machine Learning, together with the most common families of classifiers and predictors.\n It will identify the basic ideas underlying the mechanism of learning, and will specify the practical problems that are encountered\n when applying these techniques, optimization, overfitting, validation, together with possible solutions to manage those difficulties.",
      comments: [],
      evaluations: []);

  courselist.add(courses);
  // _database.ref().child("courses").child("Malis").set(courses.toJson());

  courses = Course(
      name: "DISTRIBUTED SYSTEMS AND CLOUD COMPUTING",
      nameShort: "Clouds",
      description:
          "The goal of this course is to provide a comprehensive view on recent topics and trends in distributed systems\n and cloud computing. We will discuss the software techniques employed to construct and program reliable, highly-scalable systems.\n We will also cover architecture design of modern datacenters and virtualization techniques that constitute \na central topic of the cloud computing paradigm. The course is complemented by a number of lab sessions to get hands-on experience with\n Hadoop and the design of scalable algorithms with MapReduce",
      comments: [],
      evaluations: []);

  courselist.add(courses);
  // _database.ref().child("courses").child("Clouds").set(courses.toJson());

  courses = Course(
      name: "DATABASE MANAGEMENT SYSTEM IMPLEMENTATION",
      nameShort: "Dbsys",
      description:
          "This course covers the implementation of database systems by addressing the main topics, including data storage,\n indexing, querying; query optimization and execution; concurrency control and transaction management.",
      comments: [],
      evaluations: []);

  courselist.add(courses);
  // _database.ref().child("courses").child("Dbsys").set(courses.toJson());

  courses = Course(
      name: "Image and Video Compression",
      nameShort: "Imcod",
      description:
          "Because multimedia data (in particular image and video) require efficient compression techniques in order to be stored\n and delivered, image and video compression is a crucial element of an effective communication system.",
      comments: [],
      evaluations: []);

  courselist.add(courses);
  // _database.ref().child("courses").child("Imcod").set(courses.toJson());

  courses = Course(
      name: "Quantum information science",
      nameShort: "Quantis",
      description:
          "Interested in learning how to communicate using quantum bits? Curious about how quantum algorithms and quantum\n computers work? This is an introductory course to quantum communication, computation, and information processing. We will cover\n various aspects of quantum information science and systems, introducing in a simple manner key principles and concepts, which are\n often considered “hard” or mysterious",
      comments: [],
      evaluations: []);

  courselist.add(courses);
  // _database.ref().child("courses").child("Quantis").set(courses.toJson());

  courses = Course(
      name: "INTERACTION DESIGN AND DEVELOPMENT OF MODERN WEB APPLICATIONS",
      nameShort: "Webint",
      description:
          "Human-computer interaction (HCI) is the study of interaction between people (users) and computers, as the intersection\n of computer science, behavioral sciences, design and several other fields of study. This course aims to provide the basic concepts\n of user centered design when developing web applications. It will offer a deep dive presentation of modern web technologies: \nHTML5, CSS3 and Javascript. Finally, this course will provide techniques for evaluating user interfaces.",
      comments: [],
      evaluations: []);

  courselist.add(courses);
  // _database.ref().child("courses").child("Webint").set(courses.toJson());

  courses = Course(
      name: "COMPUTER ARCHITECTURE",
      nameShort: "CompArch",
      description:
          "This course presents the architecture of microprocessor-based systems, from the internals of the processors themselves\n to the main peripherals that surround them and make a complete computing machine, capable of running operating systems like GNU/Linux,\n Android, Windows, iOS",
      comments: [],
      evaluations: []);

  courselist.add(courses);
  // _database.ref().child("courses").child("CompArch").set(courses.toJson());

  courses = Course(
      name: "Operating Systems",
      nameShort: "OS",
      description:
          "Would you like to investigate beyond the surface of Windows, MacOS, Linux, Android? Fed up with not understanding the\n origin of segmentation faults, why you need to eject a USB key before physically removing it, or why/how your Android system can execute\n Pokemon Go and Facebook at the same time? You want to delve into the details of the inner workings of the Linux kernel?\n Join us to discover the power of Operating Systems!",
      comments: [],
      evaluations: []);

  courselist.add(courses);
  // _database.ref().child("courses").child("OS").set(courses.toJson());

  return courselist;
 }
