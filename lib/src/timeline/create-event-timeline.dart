import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';

class CreateEventTimeline extends StatefulWidget {
  const CreateEventTimeline({super.key});

  @override
  State<CreateEventTimeline> createState() => _CreateEventTimelineState();
}

class _CreateEventTimelineState extends State<CreateEventTimeline> {
  final _formKey = GlobalKey<FormState>();
  late String _eventName;
  late String _description;
  late DateTime _postedDate;
  late DateTime? _end_datetime;
  late DateTime? _start_datetime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event Timeline'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.post_add_outlined,
            ),
            onPressed: _submit,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Event Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(Icons.title),
                  ),
                  onSaved: (value) => _eventName = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter event title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(Icons.description),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description of the job';
                    }
                    return null;
                  },
                  onSaved: (value) => _description = value!,
                ),
                SizedBox(height: 16.0),
                DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Date and time',
                  ),
                  mode: DateTimeFieldPickerMode.dateAndTime,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onSaved: (value) => _start_datetime = value,
                  dateFormat: DateFormat('yyyy-MM-dd HH:mm'),
                  onDateSelected: (DateTime value) {
                    // print(value)
                    _start_datetime = value;
                  },
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
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
