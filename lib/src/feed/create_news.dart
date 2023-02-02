import 'package:flutter/material.dart';
import '../common/common.dart';
import '../model/News.dart';

import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// import 'package:camera/camera.dart';

String formatDateTime(DateTime dateTime) {
  return DateFormat('MMM d, HH:mm').format(dateTime);
}

FirebaseDatabase _database = FirebaseDatabase.instance;
FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

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
  late String _imageurl;

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
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.title),
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
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(Icons.description),
                    hintText: "Write the post description",
                    helperText: "Write the post description",
                    labelText: "Write the post description",
                  ),
                  maxLines: 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.add_a_photo_outlined, size: 18),
                      label: const Text("Camera"),
                      onPressed: _takePicture,
                      // _takePicture,
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

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Use the data from the form fields to create a new account
      News news = News(
          author: "_author",
          description: _description,
          title: _title,
          imageurl: "eurelink-logo.jpg",
          dateCreated: DateTime.now());

      _database.ref().child("News").push().set(news.toJson());

      Navigator.pop(context);
    }
  }

  void _takePicture() async {
    // final _cameras = await availableCameras();
    // final firstCamera = _cameras.first;
    final ImagePicker _picker = ImagePicker();

    var permissionStatus = await Permission.camera.status;

    if (permissionStatus.isGranted) {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
     }

  }

  void _uploadPicture() async {
    // PickedFile image;
    //Check Permissions
    await Permission.photos.request();

    final ImagePicker _picker = ImagePicker();
    // Pick an image

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      // if (image != null){
      //   //Upload to Firebase
      //   var snapshot = await _firebaseStorage.ref()
      //   .child('images/imageName')
      //   .putFile(image);

      //   var _imageurl = await snapshot.ref.getDownloadURL();

      //   setState(() {
      //     _imageurl = _imageurl;
      //   });
      // } else {
      //   print('No Image Path Received');
      // }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }
}
