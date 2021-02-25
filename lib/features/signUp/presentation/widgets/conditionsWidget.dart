import 'package:flutter/material.dart';

class ConditionsWidget extends StatelessWidget {
  const ConditionsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}



