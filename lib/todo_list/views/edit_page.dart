import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditPage extends StatefulWidget {
  final Map todo;
  final String? title;
  final String? description;

  const EditPage({
    super.key,
    required this.todo,
    required this.title,
    required this.description,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  /// create a controller....
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    title.text = widget.title != null ? widget.title! : "";
    description.text = widget.description != null ? widget.description! : "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// this textformfield is for title......
            TextFormField(
              // uses of controller inside the TextFormField.....
              controller: title,
              decoration: InputDecoration(hintText: 'Title'),
            ),

            /// this textformfield is for description.....
            SizedBox(height: 20),
            TextFormField(
              /// uses of controller inside the TextFormField.....
              controller: description,
              decoration: InputDecoration(hintText: 'Description'),
              keyboardType: TextInputType.multiline,
              minLines: 3,
              maxLines: 8,
            ),

            /// Submit button for add list.......
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: UpdateData,
              child: Text('Update', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> UpdateData() async {
    final todo = widget.todo;
    // if (todo == null) {
    //   print('you can not call updated without todo data');
    //   return;
    // }
    final id = todo['_id'];

    /// (1.)get the data from form...
    final Title = title.text;

    ///(a.) access the controller value of title...
    final Description = description.text;

    ///(b.) access the controller value of description...
    /// (c.)  below is the "REQUEST BODY" which i will send to the server when i am creating a to-do list....
    final body = {
      "title": Title,
      "description": Description,
      "is_completed": false,
    };

    /// updated data to the server...
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    /// show success and failed message based on the status....
    if (response.statusCode == 200) {
      showSuccessMessage('Renamed');
      Navigator.pop(context, true);
    } else {
      showErrorMessage('failled');
      print(response.body);
      Navigator.pop(context, true);
    }
  }

  /// create a popup messenger by using snackBar for successs creation
  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// create a popup messenger by using snackBar for failed creation
  void showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
