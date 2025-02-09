import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileuiintern/core/userEmail.dart';
import 'package:mobileuiintern/features/login/presentation/pages/loginViewModel.dart';
import 'package:mobileuiintern/features/register/presentation/pages/registerPage.dart';
import 'package:mobileuiintern/serviceLocator.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, widget) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  height: Get.height,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ClipOval(
                          child: Image.asset("images/1.jpg"),
                        ),
                      ),
                      TextFormFieldCustom(
                        textEditingController: model.nameOCntroller,
                      ),
                      // Password(textEditingController:),
                      TextFormFieldCustom(
                        textEditingController: model.passwordOCntroller,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: Container(
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60.0,
                            onPressed: () async {
                              // Get.to(Agenda());
                              await model.login();
                            },
                            color: Colors.yellow,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't Joined Yet!"),
                          FlatButton(
                            onPressed: () {
                              Get.to(() => CreateAccount());
                            },
                            child: Text(
                              " Join",
                              style: TextStyle(color: Colors.purple),
                            ),
                          ),
                          //SizedBox(height: 50.0),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => locator<LoginViewModel>());
  }
}

Widget input({obscureText = false, hint}) {
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
