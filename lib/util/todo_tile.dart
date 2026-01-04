import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String description;
  final bool isCompleted;
  final Function(bool?)? onChanged;
  final VoidCallback deleteFunction; // Simple callback

  const TaskTile({
    super.key,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Checkbox(
            value: isCompleted,
            onChanged: onChanged,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(description),
          // Requirement 3: Simple Delete Button
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: deleteFunction,
          ),
        ),
      ),
    );
  }
}