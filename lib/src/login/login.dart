import 'package:flutter/material.dart';
import '../common/common.dart';
import '../homepage/homepage.dart';

import 'package:flutter/services.dart';

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

enum _State {
  login,
  homepage,
}

class _LoginDemoState extends State<LoginDemo> {
  _State state = _State.login;

  @override
  Widget build(BuildContext context) {
    var homePage = const HomePage();

    var loginPage = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Center(
            child: SizedBox(
                width: 200,
                height: 150,
                /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                child: Image.asset('assets/images/flutter_logo.png')),
          ),
        ),
        const Padding(
          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter valid email id as abc@gmail.com'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
          //padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter secure password'),
          ),
        ),
        TextButton(
          onPressed: () {
            //TODO FORGOT PASSWORD SCREEN GOES HERE
          },
          child: const Text(
            'Forgot Password',
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          child: TextButton(
            onPressed: () {
              homePage;
              // state = _State.homepage;
            },
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ],
    );

    Widget body;

    switch (state) {
      case _State.login:
        body = loginPage;
        break;
      case _State.homepage:
        body = homePage;
        break;
      default:
        body = homePage;
        break;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: body,
      ),
    );
  }
}
