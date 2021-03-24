//This Page is Alert Dialog Box it will connect with the text FormFields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileuiintern/features/todo/presentation/pages/todoPage.dart';

class AddTodo extends StatelessWidget {
  String Title = "";
  String Description = "";

  Widget build(BuildContext context) => AlertDialog(
        content: SingleChildScrollView(
          child: Column(
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
              TodoPage(
                  onChangedTitle: (title) => this.Title = title,
                  onChangedDescription: (description) =>
                      this.Description = description, onSavedTodo: () {  },),
            ],
          ),
        ),
      );
}
