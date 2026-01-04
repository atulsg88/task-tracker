import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../data/database.dart';
import '../util/todo_tile.dart';
import 'add_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('task_tracker_box');
  TaskDatabase db = TaskDatabase();

  @override
  void initState() {
    if (_myBox.get("TASKLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(int index) {
    setState(() {
      db.taskList[index][2] = !db.taskList[index][2];
    });
    db.updateDatabase();
  }

  void deleteTask(int index) {
    setState(() {
      db.taskList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Task Tracker"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskPage()),
          );

          if (result != null) {
            setState(() {
              db.taskList.add([result['title'], result['desc'], false]);
            });
            db.updateDatabase();
          }
        },
      ),
      body: ListView.builder(
        itemCount: db.taskList.length,
        itemBuilder: (context, index) {
          return TaskTile(
            title: db.taskList[index][0],
            description: db.taskList[index][1],
            isCompleted: db.taskList[index][2],
            onChanged: (val) => checkBoxChanged(index),
            deleteFunction: () => deleteTask(index), // Trigger delete directly
          );
        },
      ),
    );
  }
}