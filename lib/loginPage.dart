import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileuiintern/agenda.dart';
import 'CreateAccount.dart';

class loginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            //We can use this button in any situation if we add a home screen to it
            /*Navigator.pop(context);*/
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20.0,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ClipOval(
                  child: Image.asset("images/1.jpg"),
                ),
              ),
              Input(hint: "Email"),
              Input(obscureText: true, hint: "Password"),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 100.0),
                child: Container(
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60.0,
                    onPressed: () {

                    },
                    color: Colors.yellow,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: FlatButton(
                      onPressed:() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Agenda()
                        ));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Joined Yet!"),
                  FlatButton(
                    onPressed:() {
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateAccount(),
                  ));
                  },
                    child: Text(
                      " Join",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                  SizedBox(height: 50.0),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget Input({obscureText = false, hint}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
    child: Column(
      children: [
        SizedBox(height: 10.0),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
              hintText: hint,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400])),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]))),
        ),
      ],
    ),
  );
}
