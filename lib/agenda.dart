import 'package:flutter/material.dart';
import 'package:mobileuiintern/profile.dart';
import 'addTodo.dart';

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
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => profile()));
          },
          icon: Icon(
            Icons.account_circle_sharp,
            size: 50.0,
            color: Colors.black,
          ),
        ),
        title: Text("Agenda"),
      ),
      body: Container(
        child: MaterialButton(
          child: Icon(Icons.add,color: Colors.white, size: 50.0),
          minWidth: double.infinity,
          height: 60.0,
          onPressed: () =>showDialog(context: context,
            child: Addtodo(),
            barrierDismissible: false,
          ),
          color: Colors.purple,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
        ),
      );
  }
}
