import 'package:flutter/material.dart';
import 'package:task_manager_application/home_screen.dart';
import 'package:task_manager_application/my_tasks_screen.dart';

void main() {
  runApp(TaskManagementApp());
}

class TaskManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Define initial route
      routes: {
        '/': (context) => HomeScreen(), // Define route for HomeScreen
        '/mytasks': (context) => MyTasksScreen(), // Define route for MyTasksScreen
      },
    );
  }
}
