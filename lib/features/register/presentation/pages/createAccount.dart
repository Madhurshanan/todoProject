import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileuiintern/core/UserPassword.dart';
import 'package:mobileuiintern/core/UserEmail.dart';
import 'package:mobileuiintern/core/userName.dart';
import 'package:mobileuiintern/features/register/presentation/widgets/conditionsWidget.dart';

class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
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
              Useremail(),
              UserName(),
              Password(),
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
              const ConditionsWidget()
            ],
          ),
        ),
      ),
    );
  }
}
