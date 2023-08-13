import 'package:flutter/material.dart';
import 'package:todo_list_game/data/task_inherited.dart';
import 'package:todo_list_game/screens/form_screen.dart';


import 'screens/initial_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskInherited(child: const InitialScreen())
    );
  }
}



