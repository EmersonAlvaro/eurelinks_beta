import 'package:flutter/material.dart';

class ProflieView extends StatefulWidget {
  const ProflieView({super.key});

  @override
  State<ProflieView> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProflieView> {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: SizedBox(
                width: 200,
                height: 150,
                child: Icon(
                  Icons.person,
                ),
                // Image.asset('assets/images/Eurecom.png'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "UserName ",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  void _submit() {
    Navigator.pop(context);
  }
}
