import 'package:flutter/material.dart';
class WithModel extends StatefulWidget {
  const WithModel({super.key});

  @override
  State<WithModel> createState() => _WithModelState();
}

class _WithModelState extends State<WithModel> {
  /// call api function.....

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Single Data'),
      ),
    );
  }
}
