import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  final TextEditingController textEditingController;
  const Password({
    Key key,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: Column(
        children: [
          SizedBox(height: 10.0),
          TextField(
            controller: textEditingController,
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Password',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400])),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]))),
          ),
        ],
      ),
    );
  }
}
