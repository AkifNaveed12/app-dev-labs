import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/task_card.dart';

class AllTasksScreen extends StatefulWidget {
  final List<Task> tasks;
  final Function(Task) onDelete;

  const AllTasksScreen({
    super.key,
    required this.tasks,
    required this.onDelete,
  });

  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  late List<Task> _allTasks;

  @override
  void initState() {
    super.initState();

    _allTasks = List.from(widget.tasks);
  }

  void deleteTask(Task task) {
    setState(() {
      _allTasks.remove(task);
    });

    widget.onDelete(task);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Task deleted successfully')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Tasks')),

      body: _allTasks.isEmpty
          ? const Center(
              child: Text(
                'No tasks available!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),

              itemCount: _allTasks.length,

              itemBuilder: (context, index) {
                final task = _allTasks[index];

                return TaskCard(
                  task: task,
                  onDelete: () {
                    deleteTask(task);
                  },
                );
              },
            ),
    );
  }
}
