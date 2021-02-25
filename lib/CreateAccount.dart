import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
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
              Input(hint: "Full Name"),
              Input(hint: "Email"),
              Input(obscureText: true, hint: "Password"),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                child: Container(
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60.0,
                    onPressed: () {},
                    color: Colors.yellow,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("By Pressing 'Join' you agree to our"),
                  FlatButton(
                    onPressed: () {
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        " Terms & Conditions",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ),
                  SizedBox(height: 55.0),
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
