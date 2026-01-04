import 'package:flutter/material.dart';

class AddTaskPage extends StatelessWidget {
  final _titleController = TextEditingController(); // Controller for Title
  final _descController = TextEditingController();   // Controller for Description

  AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create New Task")),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Task Title", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: "Description", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Send data back to Home Screen
                  Navigator.pop(context, {
                    "title": _titleController.text,
                    "desc": _descController.text,
                  });
                },
                child: const Text("Save Task"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}