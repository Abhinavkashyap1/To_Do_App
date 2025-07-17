import 'package:flutter/material.dart';
import 'dart:convert';
import '../model/user_model.dart';
class PracticeFirst extends StatefulWidget {
  const PracticeFirst({super.key});

  @override
  State<PracticeFirst> createState() => _PracticeFirstState();
}

class _PracticeFirstState extends State<PracticeFirst> {

///You will write code here to call API and get data


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
    );
  }
}
