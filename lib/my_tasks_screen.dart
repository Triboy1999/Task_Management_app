import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tasks'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddTaskDialog(); // Same as implemented in Home tab
                },
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tasks found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return TaskItem(taskName: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final String taskName;

  const TaskItem({required this.taskName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskName),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return EditTaskDialog(taskName: taskName); // Dialog for editing a task
            },
          );
        },
      ),
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

class EditTaskDialog extends StatelessWidget {
  final String taskName;

  const EditTaskDialog({required this.taskName});

  @override
  Widget build(BuildContext context) {
    // Implement the UI for editing a task dialog
    return AlertDialog(
      title: Text('Edit Task: $taskName'),
      // Similar to AddTaskDialog, provide fields for editing task details
      actions: [
        TextButton(
          onPressed: () {
            // Implement functionality to edit the task
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Save'),
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

// Save tasks to shared preferences
void saveTasks(List<String> tasks) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('tasks', tasks);
}

// Retrieve tasks from shared preferences
Future<List<String>> getTasks() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? tasks = prefs.getStringList('tasks');
  return tasks ?? []; // Return empty list if tasks are null
}
