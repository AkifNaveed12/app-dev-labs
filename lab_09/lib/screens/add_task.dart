
import 'package:flutter/material.dart';
import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _taskController =
      TextEditingController();

  String _category = 'Development';
  String _priority = 'Medium';

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  void saveTask() {

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final newTask = Task(
      title: _taskController.text.trim(),
      category: _category,
      priority: _priority,
    );

    // Return the task to HomeScreen
    Navigator.pop(context, newTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const Text(
                'Task Title',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              TextFormField(
                controller: _taskController,

                decoration: const InputDecoration(
                  hintText: 'Enter your task',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.task),
                ),

                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Please enter a task title';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 24),

              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                initialValue: _category,

                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),

                items: [
                  'Development',
                  'Study',
                  'Personal',
                  'Project',
                ].map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),

                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _category = value;
                    });
                  }
                },
              ),

              const SizedBox(height: 24),

              const Text(
                'Priority',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                initialValue: _priority,

                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),

                items: [
                  'Low',
                  'Medium',
                  'High',
                ].map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),

                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _priority = value;
                    });
                  }
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: saveTask,

                  child: const Text('Save Task'),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,

                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  child: const Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
