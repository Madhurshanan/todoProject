import 'package:flutter/material.dart';
import 'todo.dart';
import 'package:provider/provider.dart';
import 'loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) =>todoProvider(),

    child: MaterialApp(
      home: loginPage(),
    ),
    );

}
