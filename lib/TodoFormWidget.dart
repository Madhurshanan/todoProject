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
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title.isEmpty) {
            return "The Title cannot be emoty";
          }
          return null;
        },
        decoration:
            InputDecoration(border: UnderlineInputBorder(), labelText: "Title"),
      );

  Widget buildDescription() => TextFormField(
    onChanged: onChangedDescription,
    decoration: InputDecoration(
        border: UnderlineInputBorder(), labelText: "Description"),
  );

}

