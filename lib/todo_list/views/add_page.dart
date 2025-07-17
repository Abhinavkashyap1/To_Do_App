import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  /// create a controller....
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Todo")),
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
              onPressed: submitData,
              child: Text('submit', style: TextStyle(color: Colors.white)),
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

  Future<void> submitData() async {
    print("submit button taped");

    /// (1.)get the data from form...
    ///(a.) access the controller value of title...
    final Title = title.text;

    ///(b.) access the controller value of description...
    final Description = description.text;


    /// (c.)  below is the "REQUEST BODY" which i will send to the server when i am creating a to-do list....
    final body = {
      "title": Title,
      "description": Description,
      "is_completed": false,
    };

    /// submit data from server...
    final url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    /// show success and failed message based on the status....
    if (response.statusCode == 201) {
      title.text = '';
      description.text = '';
      showSuccessMessage('creation successfully');
      Navigator.pop(context, true);
    } else {
      showErrorMessage('creation failled');
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
