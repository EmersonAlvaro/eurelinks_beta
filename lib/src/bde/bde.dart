import 'package:flutter/material.dart';

class BDEView extends StatefulWidget {
  const BDEView({super.key});

  @override
  State<BDEView> createState() => _BDEPageState();
}

class _BDEPageState extends State<BDEView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BDE"),
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
              "BDE Page ",
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
