import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/task_card.dart';

import 'add_task.dart';
import 'all_tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const HomeScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Main task list
  final List<Task> _tasks = [
    Task(
      title: 'Complete Flutter Practice',
      category: 'Development',
      priority: 'High',
    ),

    Task(
      title: 'Read Software Engineering',
      category: 'Study',
      priority: 'Medium',
    ),

    Task(title: 'Build a Mobile UI', category: 'Project', priority: 'Low'),
  ];

  // Navigate to Add Task Screen
  Future<void> navigateToAddTask() async {
    final newTask = await Navigator.push<Task>(
      context,
      MaterialPageRoute(builder: (context) => const AddTaskScreen()),
    );

    // Check whether a task was returned
    if (newTask != null) {
      setState(() {
        _tasks.add(newTask);
      });

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Task added successfully!')));
    }
  }

  // Navigate to All Tasks Screen
  void navigateToAllTasks() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllTasksScreen(
          tasks: _tasks,

          onDelete: (task) {
            setState(() {
              _tasks.remove(task);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TaskFlow',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        actions: [
          IconButton(
            onPressed: widget.onThemeToggle,

            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),

            tooltip: 'Toggle Theme',
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Good Morning!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            Text(
              'Here is your task overview.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),

            const SizedBox(height: 24),

            // Task Summary
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Text('Total Tasks'),

                        const SizedBox(height: 8),

                        Text(
                          '${_tasks.length}',

                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const Icon(Icons.task_alt, size: 45, color: Colors.indigo),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // My Tasks Heading
            const Text(
              'My Tasks',

              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // Display latest three tasks
            if (_tasks.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('No tasks yet. Add your first task!'),
                ),
              )
            else
              ..._tasks.take(3).map((task) {
                return TaskCard(task: task);
              }),

            const SizedBox(height: 20),

            // Add Task Button
            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                onPressed: navigateToAddTask,

                icon: const Icon(Icons.add),

                label: const Text('Add New Task'),
              ),
            ),

            const SizedBox(height: 12),

            // View All Tasks Button
            SizedBox(
              width: double.infinity,

              child: OutlinedButton(
                onPressed: navigateToAllTasks,

                child: const Text('View All Tasks'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
