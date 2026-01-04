import 'package:hive/hive.dart';

class TaskDatabase {
  List taskList = [];

  // Reference the box
  final _myBox = Hive.box('task_tracker_box');

  // Initial data for new users
  void createInitialData() {
    taskList = [
      ["Welcome Task", "Swipe left to delete me!", false],
    ];
  }

  // Load the data from the box
  void loadData() {
    taskList = _myBox.get("TASKLIST");
  }

  // Update the database
  void updateDatabase() {
    _myBox.put("TASKLIST", taskList);
  }
}