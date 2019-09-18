import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
   bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      
      children: <Widget>[
        SizedBox(width: 20),
        Center(
          child: InkWell(
            onTap: () {
              setState(() {
                _value = !_value;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: _value ? Colors.blue :Colors.white, border: Border.all(color: Colors.black45)),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: _value
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
        Text("This is an example task", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),),
      ],
    );
  }
}