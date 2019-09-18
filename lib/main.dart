import 'package:flutter/material.dart';

import './widgets/todo_item.dart';
import './widgets/todo_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What\'s Next',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'What\'s Next'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoItem> _todo = [TodoItem()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Text("What's Next?", style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.normal),),
            SizedBox(height: 30),
            Expanded(
              child:ListView.separated (
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: _todo.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return new TodoItem();
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _todo.add(TodoItem());
          setState(() {});
        },
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
  
}
