import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileuiintern/core/userEmail.dart';
import 'package:mobileuiintern/features/register/presentation/pages/registerViewModel.dart';
import 'package:mobileuiintern/features/register/presentation/widgets/conditionsWidget.dart';
import 'package:mobileuiintern/serviceLocator.dart';
import 'package:stacked/stacked.dart';


class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        builder: (context, model, widget) {
          return Scaffold(
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: Get.height,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ClipOval(
                            child: Image.asset("images/1.jpg"),
                          ),
                        ),
                        TextFormFieldCustom(textEditingController: model.emailOCntroller,),
                        TextFormFieldCustom(hintText: 'User Name', textEditingController: model.nameOCntroller,),
                        TextFormFieldCustom(hintText: "Password", textEditingController: model.passwordOCntroller,),
                        SizedBox(height: 10.0),
                        Container(
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60.0,
                            onPressed: () async {
                              await model.register();
                            },
                            color: Colors.yellow,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const ConditionsWidget()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => locator<RegisterViewModel>());
  }
}
