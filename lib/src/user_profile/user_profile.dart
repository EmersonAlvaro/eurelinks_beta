import 'package:flutter/material.dart';
import '../common/common.dart';
import '../login/login.dart';
import '../model/User.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseDatabase _database = FirebaseDatabase.instance;

class ProflieView extends StatefulWidget {
  @override
  State<ProflieView> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProflieView> {
  var _userDetails;

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

  void _getUserDetails() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    final userData = await _database.ref().child("users").child(uid).get();
    var userList = userData.value as List<dynamic>;
    Map<String, dynamic> snapshotValue =
        Map<String, dynamic>.from(userList.first as Map);
    _userDetails = UserDetails.fromJson(snapshotValue);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_outlined,
            ),
            onPressed: _submit,
          ),
        ],
      ),
      body: _userDetails == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text("Last Name:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("${_userDetails.lastName}"),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text("First Name:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("${_userDetails.firstName}"),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text("Email:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("${_userDetails.email}"),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text("Role:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("${_userDetails.role}"),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void _submit() {
    signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
