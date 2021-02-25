import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'agenda.dart';
import 'TodoFormWidget.dart';

class Addtodo extends StatefulWidget {
  @override
  _AddtodoState createState() => _AddtodoState();
}

class _AddtodoState extends State<Addtodo> {
  final _fromKey = GlobalKey<FormState>();
  String title = "";
  String description = "";

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add To do",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            TodoFormWidget(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedTodo: () {},
            ),
          ],
        ),
      );
}

/*const SizedBox(height: 8.0),
      TodoFormWidget(
          onChangedTitle:(title) => setState(()=>this.title = title
       ),
          onChangedDescription(description) =>
          setState(()=>this.description=description),
  onSavedTodo:(){}, onChangedDescription: (String value) {  },
       ),*/
