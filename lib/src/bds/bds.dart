import 'package:flutter/material.dart';

class BDSView extends StatefulWidget {
  const BDSView({super.key});

  @override
  State<BDSView> createState() => _BDSPageState();
}

class _BDSPageState extends State<BDSView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BDS"),
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
              "BDS Page ",
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
