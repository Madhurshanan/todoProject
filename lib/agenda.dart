import 'package:flutter/material.dart';
import 'package:mobileuiintern/profile.dart';

class Agenda extends StatefulWidget {
  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:() {
      Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => profile()
      ));
      },
          icon: Icon(
            Icons.account_circle_sharp,
            size: 50.0,
            color: Colors.black,
          ),
        ),
        title: Text("Agenda"),
      ),
      body: FloatingActionButton(
        backgroundColor: Colors.red,
      )
    );
  }
}
