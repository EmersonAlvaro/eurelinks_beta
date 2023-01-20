import 'package:flutter/material.dart';
import '../common/common.dart';

import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  return DateFormat('MMM d, HH:mm').format(dateTime);
}

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _formKey = GlobalKey<FormState>();
  late String _author;
  late String _description;
  late String _title;
  late DateTime _date;
  late Image _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.post_add_outlined,
            ),
            onPressed: _submit,
          ),
        ],
      ),
      body: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 4, right: 4, bottom: 15),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.account_circle_outlined),
                onPressed: () {},
              ),
              Column(
                children: [
                  Text("news.author"),
                  Text(formatDateTime(DateTime.now())),
                ],
              ),
            ],
          ),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                    onSaved: (value) => _title = value!,
                    // decoration: const InputDecoration(labelText: 'last name'),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Write the post title",
                      helperText: "Write the post title ",
                      labelText: "Write the post title",
                    ),
                    maxLines: 2,
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                    onSaved: (value) => _description = value!,
                    // decoration: const InputDecoration(labelText: 'first name'),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Write the post description",
                      helperText: "Write the post description",
                      labelText: "Write the post description",
                    ),
                    maxLines: 4,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.add_a_photo_outlined, size: 18),
                      label: const Text("Camera"),
                      onPressed: _takePicture,
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.photo_library_outlined, size: 18),
                      label: const Text("Photo/Video"),
                      onPressed: _uploadPicture,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Use the data from the form fields to create a new account

    }
    Navigator.pop(context);
  }

  void _takePicture() {}

  void _uploadPicture() {}
}
