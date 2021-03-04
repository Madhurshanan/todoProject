import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final Color color;
  final String titile;
  final String subtitle;
  const TaskWidget({
    @required this.color,
    @required this.titile,
    this.subtitle = 'THis ca be null',
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
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 4),
            ),
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          // )
          Column(
            children: [
              Text(
                titile,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Text(
                subtitle,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
