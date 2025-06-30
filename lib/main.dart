import 'package:flutter/material.dart';
import 'package:flutter_assg/provider/todo_provider.dart';
import 'package:flutter_assg/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDoApp',
        home: Home(),
      ),
    );
  }
}
