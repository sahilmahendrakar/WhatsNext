import 'package:flutter/material.dart';
import './todo_item.dart';

class Todo extends StatelessWidget {
  final List<TodoItem> todo;
  Todo(this.todo);

  Widget _buildTodoList(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Text("Hey", style: TextStyle(color: Colors.deepPurple))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: todo.length,
      itemBuilder: _buildTodoList,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}