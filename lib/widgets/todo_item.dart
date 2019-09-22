import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String name;

  const TodoItem({Key key, this.name}) : super(key: key);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
   bool _done = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 10, height: 35),
        Center(
          child: InkWell(
            onTap: () {
              setState(() {
                _done = !_done;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: _done ? Colors.blue :Colors.white, border: Border.all(color: Colors.black45)),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: _done
                    ? 
                    Icon(
                        Icons.check,
                        size: 22.5,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.check_box_outline_blank,
                        size: 22.5,
                        color: Colors.white,
                      ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Flexible(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.name, style: TextStyle(color: _done ? Colors.grey[700] : Colors.black, fontSize: 20, fontWeight: FontWeight.w400, decoration: _done ? TextDecoration.lineThrough : TextDecoration.none),),
            ],
          ),
        ),
      ],
    );
  }

}