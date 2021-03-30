
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileuiintern/features/agenda/presentation/widgets/taskWidget.dart';
import 'package:mobileuiintern/features/profile/presentation/pages/profile.dart';
import 'package:mobileuiintern/features/todo/presentation/pages/todoViewModel.dart';
import 'package:mobileuiintern/features/todo/presentation/widgets/displayTodo.dart';
import 'package:stacked/stacked.dart';

import '../../../../serviceLocator.dart';
import '../widgets/taskWidget.dart';

class Agenda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodoViewModel>.reactive(
        onModelReady: (model) async {
          await model.showList();
        },
        builder: (context, model, widget) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.to(Profile());
                },
                icon: Icon(
                  Icons.account_circle_sharp,
                  size: 50.0,
                  color: Colors.black,
                ),
              ),
              title: Text("Agenda"),
            ),
            body: Column(
              children: [
                Expanded(
                  child: TaskWidget(
                    color: Colors.red,
                     titile: 'This is in Agenda Title',
                     description: 'Finally Got the Description',
                  ),
                ),
                Container(
                  child: MaterialButton(
                    child: Icon(Icons.add, color: Colors.white, size: 50.0),
                    minWidth: double.infinity,
                    height: 60.0,
                    onPressed: () => showDialog(
                      context: context,
                      child: AddTodo(),
                      barrierDismissible: false,
                    ),
                    color: Colors.purple,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ],
            ),
          );
        },
        viewModelBuilder: () => locator<TodoViewModel>());
  }
}
