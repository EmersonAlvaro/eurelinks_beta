import 'package:flutter/material.dart';
import '../model/Evaluation.dart';
import '../model/Course.dart';

class EvaluationPage extends StatefulWidget {
  const EvaluationPage({super.key});

  @override
  State<EvaluationPage> createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  final _formKey = GlobalKey<FormState>();
  late Evaluation _evaluation;
  late String _comment;
  final List<int> _scores = List.generate(6, (index) => index);
  late int course_general_score;
  late int course_organization_score;
  late int course_content_score;
  late int course_teaching_score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Evaluation'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Course Organization Score'),
                items: _scores.map((score) {
                  return DropdownMenuItem(
                    value: score,
                    child: Text('$score'),
                  );
                }).toList(),
                onChanged: (value) => course_organization_score = value!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Course Content Score'),
                items: _scores.map((score) {
                  return DropdownMenuItem(
                    value: score,
                    child: Text('$score'),
                  );
                }).toList(),
                onChanged: (value) => course_content_score = value!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Course Teaching Score'),
                items: _scores.map((score) {
                  return DropdownMenuItem(
                    value: score,
                    child: Text('$score'),
                  );
                }).toList(),
                onChanged: (value) => course_teaching_score = value!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Course General Score'),
                items: _scores.map((score) {
                  return DropdownMenuItem(
                    value: score,
                    child: Text('$score'),
                  );
                }).toList(),
                onChanged: (value) => course_general_score = value!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) => _comment = value!,
                // decoration: const InputDecoration(labelText: 'first name'),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Write your comment here",
                  helperText: "Write your comment here",
                  labelText: "Write your comment here",
                ),
                maxLines: 4,
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.send_sharp, size: 18),
                label: const Text("Send",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
                onPressed: _submit,
              ),
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
    }
    Navigator.pop(context);
  }
}
