import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback? onDelete;

  const TaskCard({super.key, required this.task, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,

          child: Icon(
            Icons.task_alt,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),

        title: Text(
          task.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        subtitle: Text('${task.category} • ${task.priority} Priority'),

        trailing: onDelete == null
            ? const Icon(Icons.arrow_forward_ios, size: 16)
            : IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: onDelete,
              ),
      ),
    );
  }
}
