import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key key,
    this.title = "",
    this.description = "",
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(height: 8),
            buildDescription(),
            SizedBox(height: 32),
            buildButton(),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title.isEmpty) {
            return "The Title cannot be empty";
          }
          return null;
        },
        decoration:
            InputDecoration(border: UnderlineInputBorder(), labelText: "Title"),
      );

  Widget buildDescription() => TextFormField(
    initialValue: description,
    onChanged: onChangedDescription,
    decoration: InputDecoration(
        border: UnderlineInputBorder(), labelText: "Description"),
  );

  Widget buildButton()=> SizedBox(
    width: double.infinity,
    height: 33.0,
    child: ElevatedButton(style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.yellow)
    ), onPressed: onSavedTodo, child: Text("Save")),
  );

}

