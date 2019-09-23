import 'package:flutter/material.dart';


class Task extends StatefulWidget {
  final String name;

  const Task({Key key, this.name}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool _done = false;

  @override
  Widget build(BuildContext context) {
    return Container (
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: InkWell(
              onTap: () {
                setState(() {
                  _done = !_done;
                });
              },
              child: _done ? Container(
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Icon(
                    Icons.check,
                    size: 35,
                    color: Colors.blue,
                  )
                ),
              )
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, border: Border.all(color: Colors.black45, width: 3)
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 8)
                    ),
                  ),
              ),
            ),
          ),
          SizedBox(width: 5),
          Flexible(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.name, style: TextStyle(color: _done ? Colors.grey[700] : Colors.black, fontSize: 20, fontWeight: FontWeight.w400, decoration: _done ? TextDecoration.lineThrough : TextDecoration.none),),
              ],
            ),
          ),
        ],
      ),
    );
  }

}