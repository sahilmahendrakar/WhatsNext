import 'package:flutter/material.dart';

import './widgets/todo_item.dart';

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

  // void _incrementCounter() {
  //   setState(() {

  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("What's Next?", style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.normal),),
            SizedBox(height: 50),
            TodoItem(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
}
