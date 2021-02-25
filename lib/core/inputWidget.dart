import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: Column(
        children: [
          SizedBox(height: 10.0),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: '',
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
}
