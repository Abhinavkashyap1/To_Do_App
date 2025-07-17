import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/practice_api/views/example_two.dart';
import 'package:todo_app/practice_api/views/home_screen.dart';
import 'package:todo_app/signup/views/signup_screen.dart';
import 'package:todo_app/todo_list/views/todo_list.dart';
import 'package:todo_app/with_model/views/screen_withmodel.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.grey),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'To-Do app',
      initialRoute: '/',
      routes: {
        '/': (context) => WithModel(),
      //  '/': (context) => SignupScreen(),
     //   '/': (context) => TodoList(),
        '/home':(context) => HomeScreen(),
        '/example':(context) => ExampleTwo(),

      },
    );
  }
}
