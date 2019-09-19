import 'package:flutter/material.dart';

import './main.dart';
import './widgets/todo_item.dart';

class addTask extends StatefulWidget {
  @override
  _addTaskState createState() => _addTaskState();
}

class _addTaskState extends State<addTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text("Add Task"),
        actions: <Widget>[
          IconButton(
          icon: const Icon(Icons.check),
          tooltip: 'Add Task',
          onPressed: () {
            todo.add(TodoItem());
            Navigator.pop(context);
          },
        ),
        ],
      ),
      body: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Task'
        ),
      ),
    );
  }
}