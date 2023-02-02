import 'package:flutter/material.dart';
import '../common/bdeData.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BDEView extends StatefulWidget {
  const BDEView({super.key});

  @override
  State<BDEView> createState() => _BDEPageState();
}

  final bde_team = bde_members_function();

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
      // floatingActionButton: FloatingActionButton.extended(
      //   icon: const Icon(Icons.post_add_outlined),
      //   label: const Text('edit'),
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const EditBDESInfo()),
      //     );
      //   },
      // ),
      body: Column(
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/bde.jpg',
             height: 150,
             width: 150),
          Image.asset(
            'assets/images/bed_rock_logo.png',
             height: 150,
             width: 150),
        ],
      ),
          Padding(
            padding: EdgeInsets.only(top: 2.0, bottom: 10.0, left: 5.0, right: 5.0),
            child: Text(
              '${bde_team.description}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Text(
              "President: ${bde_team.presidentName}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Text(
              "Vice President: ${bde_team.vicePresidentName}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Text(
              "Secretary: ${bde_team.secretaryName}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                      ),
                    ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                    ),
                  onPressed: () => launch("tel://${bde_team.contact}"),
                  child: const Text('Contact Us'),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: "${bde_team.email}"));
                      Fluttertoast.showToast(
                          msg: "Email ID Copied to Clipboard",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      },
                  child: const Text('Email Us'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                    await launch('https://www.google.com/maps/place/Eurecom/@43.614386,7.071125,17z/data=!3m1!4b1!4m5!3m4!1s0x12cc2bbceb8ef3b9:0x22dae297f1be6add!8m2!3d43.614386!4d7.071125');
                  },
                  child: const Text('Locate Us'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _submit() {
    Navigator.pop(context);
  }
}
