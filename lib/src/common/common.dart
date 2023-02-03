import '../model/User.dart';
import '../model/News.dart';
import '../model/Job.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase _database = FirebaseDatabase.instance;

// Future<UserDetails> _getUserDetails() async {
//   var uid = FirebaseAuth.instance.currentUser!.uid;
//   final userData = await _database.ref().child("users").child(uid).get();
//   // var userList = userData.value as List<dynamic>;
//   // var userMap = userList.first as Map<String, dynamic>;
//   Map<String, dynamic> snapshotValue =
//       Map<String, dynamic>.from(userData.value as Map);
//   return UserDetails.fromJson(snapshotValue);
// }

Future<List<News>> getAllNews() async {
  final refNews = _database.ref().child('News');
  List<News> news = [];
  final snapshot = await refNews.get();
  for (final child in snapshot.children) {
    // var jss = json.decode(json.encode(child.value)) as Map<String, dynamic>;
    Map<String, dynamic> snapshotValue =
        Map<String, dynamic>.from(child.value as Map);
    news.add(News.fromJson(snapshotValue));
  }

  refNews.onValue.listen(
    (event) {
      for (final child in event.snapshot.children) {
        Map<String, dynamic> snapshotValue =
            Map<String, dynamic>.from(child.value as Map);
        news.add(News.fromJson(snapshotValue));
      }
    },
  );

  return news;
}

Future<List<Job>> getAllJobs() async {
  final refJobs = _database.ref().child('Jobs');
  List<Job> jobs = [];
  final snapshot = await refJobs.get();
  for (final child in snapshot.children) {
    // var jss = json.decode(json.encode(child.value)) as Map<String, dynamic>;
    Map<String, dynamic> snapshotValue =
        Map<String, dynamic>.from(child.value as Map);
    jobs.add(Job.fromJson(snapshotValue));
  }

  refJobs.onValue.listen(
    (event) {
      for (final child in event.snapshot.children) {
        Map<String, dynamic> snapshotValue =
            Map<String, dynamic>.from(child.value as Map);
        jobs.add(Job.fromJson(snapshotValue));
      }
    },
  );

  return jobs;
}

// sign in with email and password
Future signInWithEmailAndPassword(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

Future signOut() async {
  try {
    return await FirebaseAuth.instance.signOut();
  } catch (error) {
    print(error.toString());
    return null;
  }
}

Future registerWithEmailAndPassword(String email, String password) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

Future<bool> checkIfLoggedIn() async {
  // replace with actual logic to check if the user is logged in
  // bool isLoggedIn =
  return await checkAuthStatus();
}

Future<bool> checkAuthStatus() async {
  // for now, let's assume that the user is logged in
  if (FirebaseAuth.instance.currentUser != null) {
    return true;
  } else {
    return false;
  }
}

// TODO the following method should be

Future<UserDetails> getCurrentUserDetails() async {
  late UserDetails userDetails;
  if (FirebaseAuth.instance.currentUser != null) {
    var uid = FirebaseAuth.instance.currentUser!.uid;

    final snapshot = await _database.ref().child("users").child(uid).get();
    if (snapshot.exists) {
      var data = snapshot.value as Map<String, dynamic>;
      userDetails = UserDetails.fromJson(data);
      print(data);
    } else {
      print('No data available.');
    }
  }
  return userDetails;
}

// Future<bool> isUserAdmin() async {
//   UserDetails userDetails = await getCurrentUserDetails();

//   if (userDetails.role == "admin") {
//     return true;
//   } else {
//     return false;
//   }
// }
