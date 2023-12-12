import 'package:flutter/material.dart';

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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tasks'), // Update title to 'My Tasks'
        actions: [
          TextButton(
            onPressed: () {
              // Navigate to My Tasks tab
              // Implement navigation to the My Tasks tab
            },
            child: Text(
              'See All',
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Date: ${DateTime.now().toString()}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            // Display upcoming tasks as tiles
            // For now, let's use placeholders
            TaskTile(taskName: 'Office', taskTime: '9:00 AM - 5:00 PM'),
            TaskTile(taskName: 'Sleep', taskTime: '10:00 PM - 6:00 AM'),
            TaskTile(taskName: 'Exercise', taskTime: '7:00 AM - 8:00 AM'),
            TaskTile(taskName: 'Others', taskTime: 'Anytime'),

            SizedBox(height: 20), // Add spacing

            // On Going Tasks section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'On Going Tasks',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Task items for On Going Tasks
                  OngoingTaskTile(
                    taskName: 'Office',
                    startTime: '11:45 AM, Jun 05, 2021',
                    description: 'Some description here',
                    location: 'School',
                  ),
                  OngoingTaskTile(
                    taskName: 'Meeting',
                    startTime: '12:20 PM, Jun 05, 2021',
                    description: 'Another description here',
                    location: 'Cafeteria',
                  ),
                  // Add more OngoingTaskTile widgets for other tasks
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement dialog for adding a task
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddTaskDialog(); // Create AddTaskDialog widget
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final String taskName;
  final String taskTime;

  const TaskTile({required this.taskName, required this.taskTime});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskName),
      subtitle: Text(taskTime),
      onTap: () {
        // Implement onTap functionality for each task
      },
    );
  }
}

class AddTaskDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement the UI for adding a task dialog
    return AlertDialog(
      title: Text('Add Task'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            // Widgets for name, description, start date, end date, start time, end time
            // Add appropriate TextFields, DatePickers, TimePickers, etc.
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Implement functionality to add the task
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Add'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}

class OngoingTaskTile extends StatelessWidget {
  final String taskName;
  final String startTime;
  final String description;
  final String location;

  const OngoingTaskTile({
    required this.taskName,
    required this.startTime,
    required this.description,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(taskName),
          subtitle: Text(startTime),
          trailing: Text('On Going', style: TextStyle(color: Colors.green)),
          onTap: () {
            // Implement onTap functionality for each task
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Icon(Icons.access_time),
              SizedBox(width: 5),
              Text(description),
              Spacer(),
              Text(location),
            ],
          ),
        ),
        Divider(), // Add a divider between task items
      ],
    );
  }
}
