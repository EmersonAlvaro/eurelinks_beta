import '../model/Calendar.dart';
// import '../model/User.dart';
import '../model/News.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase _database = FirebaseDatabase.instance;

// import 'package:cloud_firestore/cloud_firestore.dart';

// FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

Future<void> addNews(News news) async {
  var newsReference = _database.ref().child("news").push();
  newsReference.set(news);
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
