import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileuiintern/features/agenda/presentation/widgets/taskWidget.dart';
import 'package:mobileuiintern/features/profile/presentation/pages/profile.dart';
import 'package:mobileuiintern/features/todo/presentation/widgets/displayTodo.dart';

import '../widgets/taskWidget.dart';

class Agenda extends StatefulWidget {
  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  @override
  Widget build(BuildContext context) {
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
        //crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TaskWidget(
              color: Colors.red,
              titile: 'This is in Agenda Title',
              description: 'Finally Got the Description',
            ),
          ),

          Container(
            //margin: EdgeInsets.only(left: 20, right: 20, top: 15),
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
  }
}
