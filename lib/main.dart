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
        //fontFamily: 'Montserrat',
        textTheme: TextTheme(
          //headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          //title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          //body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
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
            Text("What's Next?", style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.normal),), //.bold
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
          Dismissible (
            background: Container(color: Colors.red),
            key: ValueKey(item), 
            onDismissed: (direction) {
              setState(() {
                todo.remove(item);
              });
            },
            child: ListTile(title: item),            
            // onTap: () {
            //   setState(() {
            //     _done = !_done;
            //   });
            // },
          ),
      ],
    );
  }

  //Adds a task new page for advanced editing
  // void _addTaskScreen() {
  //   Navigator.of(context).push(
  //     new MaterialPageRoute(
  //       builder: (context) {
  //         return new Scaffold(
  //           appBar: new AppBar(
  //             title: new Text('Add a new task')
  //           ),
  //           body: new TextField(
  //             autofocus: true,
  //             onSubmitted: (val) {
  //               _addTask(val);
  //               Navigator.pop(context); // Close the add todo screen
  //             },
  //             decoration: new InputDecoration(
  //               hintText: 'Enter something to do...',
  //               contentPadding: const EdgeInsets.all(16.0)
  //             ),
  //           )
  //         );
  //       }
  //     ),
  //   );
  // }

  void _addTaskScreen() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
      ),
      builder: (BuildContext context){
          return Container(
            child: new Wrap(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(vertical: 50),),
              new TextField(
                maxLines: 3,
                autofocus: true,
                textInputAction: TextInputAction.go,
                onSubmitted: (val) {
                  Navigator.pop(context);
                  _addTask(val);
                },
                decoration: new InputDecoration(
                  hintText: 'Add Task',
                  contentPadding: const EdgeInsets.all(16.0),
                  focusedBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white)
                  ),
                ),
              ),
              Padding (padding: EdgeInsets.symmetric(vertical: 180),),
            ],
          ),
        );
      }
    );
  }

  void _addTask(String name) {
    if(name.length > 0) {
      setState(() => todo.add(Task(name: name,))); //Task(name)
    }
  }
}
