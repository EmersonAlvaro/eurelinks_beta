import 'package:flutter/material.dart';
import 'edit-bde-bds-view.dart';

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
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.post_add_outlined),
        label: const Text('edit'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EditBDESInfo()),
          );
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: SizedBox(
                width: 200,
                height: 150,
                child: Image.asset('assets/images/eurelink-logo.jpg'),
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
