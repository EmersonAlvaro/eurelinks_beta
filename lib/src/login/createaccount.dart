import 'package:flutter/material.dart';
import '../common/common.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _email;
  late String _password;
  late String _role = "student";
  late String _lastName;
  late String _firstName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a Last name';
                }
                return null;
              },
              onSaved: (value) => _lastName = value!,
              decoration: const InputDecoration(labelText: 'last name'),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a first name';
                }
                return null;
              },
              onSaved: (value) => _firstName = value!,
              decoration: const InputDecoration(labelText: 'first name'),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
              onSaved: (value) => _username = value!,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an email';
                }
                return null;
              },
              onSaved: (value) => _email = value!,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
              onSaved: (value) => _password = value!,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            DropdownButtonFormField(
              value: _role,
              onChanged: (String? newValue) {
                setState(() {
                  _role = newValue!;
                });
              },
              items: <String>['student', 'professor', 'staff', 'admin']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
            ),
            // DropdownButtonFormField(
            //   value: _role,
            //   items: const [
            //     DropdownMenuItem(
            //       value: 'professor',
            //       child: Text('professor'),
            //     ),
            //     DropdownMenuItem(
            //       value: 'student',
            //       child: Text('student'),
            //     ),
            //     DropdownMenuItem(
            //       value: 'staff',
            //       child: Text('staff'),
            //     ),
            //   ],
            //   onChanged: (value) {
            //     setState(() {
            //       _role = value!;
            //     });
            //   },
            //   decoration: const InputDecoration(
            //     labelText: 'Select an option',
            //   ),
            //   validator: (value) {
            //     if (value == null) {
            //       return 'Please select an option';
            //     }
            //     return null;
            //   },
            // ),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Use the data from the form fields to create a new account
      User user = User(
          email: _email,
          password: _password,
          firstName: _firstName,
          lastName: _lastName,
          username: _username,
          role: _role);
    }
  }
}
