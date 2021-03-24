import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final Color color;
  final String titile;
  final String description;
  const TaskWidget({
    @required this.color,
    @required this.titile,
    @required this.description,
  }) : assert(titile != null, 'Title must not be null');
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: Offset(0, 9),
            blurRadius: 20,
            spreadRadius: 1)
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 0,
            ),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 4),
            ),
          ),
          Column(
            children: [
              Text(
                titile,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                description,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
