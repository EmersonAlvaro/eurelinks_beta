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
    final userData = await _database.ref().child("users").child(uid).once();
    var userMap = userData.snapshot.value as Map<String, dynamic>;
    // Convert the map to a UserDetails object
    _userDetails = UserDetails.fromJson(userMap);
    print(_userDetails);
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
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Last Name:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("${_userDetails.lastName}"),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("First Name:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("${_userDetails.firstName}"),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Email:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("${_userDetails.email}"),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Role:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("${_userDetails.role}"),
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
