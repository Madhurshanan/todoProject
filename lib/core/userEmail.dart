import 'package:flutter/material.dart';

class Useremail extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  const Useremail({
    Key key,
    this.textEditingController, this.hintText,
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
            decoration: InputDecoration(
                hintText:hintText?? 'Email',
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
