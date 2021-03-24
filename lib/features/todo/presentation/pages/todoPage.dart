import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileuiintern/features/todo/presentation/pages/todoViewModel.dart';
import 'package:mobileuiintern/serviceLocator.dart';
import 'package:stacked/stacked.dart';

class TodoPage extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoPage({
    Key key,
    this.title = "",
    this.description = "",
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodoViewModel>.reactive(
        builder: (context, model, widget) {
          return Column(children: [
              TextFormField(
                controller: model.titleOController,
                //initialValue: title,
                onChanged: onChangedTitle,
                validator: (title) {
                  if (title.isEmpty) {
                    return "The Title cannot be empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Title"),
              ),
              TextFormField(
                controller: model.descriptionOController,
                //initialValue: description,
                onChanged: onChangedDescription,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Description"),
              ),
              SizedBox(
                width: double.infinity,
                height: 150.0,

                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.yellow)),
                          onPressed: () async {
                            await model.addTodo();
                          },
                          child: Text("Save")),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Cancel")),
                  ],
                ),
              ),
            ]);

        },
        viewModelBuilder: () => locator<TodoViewModel>());
  }
}
