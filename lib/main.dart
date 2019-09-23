import 'package:flutter/material.dart';

import './task.dart';

void main() => runApp(MyApp());

List<Task> todo = [];

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
              child: list(context),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTaskScreen,
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget list(BuildContext context) {
    return ReorderableListView (
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final Task item = todo.removeAt(oldIndex);
          todo.insert(newIndex, item);
        });
      },
      children: <Widget>[
        for (final item in todo)
          //if (todo.indexOf(item) == 0)
          ListTile (
            key: ValueKey(item), 
            title: item,
            
            // onTap: () {
            //   setState(() {
            //     _done = !_done;
            //   });
            // },
          ),
      ],
    );
  }

  //Adds a task
  void _addTaskScreen() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Add a new task')
            ),
            body: new TextField(
              autofocus: true,
              onSubmitted: (val) {
                _addTask(val);
                Navigator.pop(context); // Close the add todo screen
              },
              decoration: new InputDecoration(
                hintText: 'Enter something to do...',
                contentPadding: const EdgeInsets.all(16.0)
              ),
            )
          );
        }
      ),
    );
  }

  void _addTask(String name) {
    if(name.length > 0) {
      setState(() => todo.add(Task(name: name,))); //Task(name)
    }
  }
}
