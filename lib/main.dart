import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileuiintern/serviceLocator.dart';
import 'package:provider/provider.dart';
import 'features/login/presentation/pages/loginPage.dart';
import 'features/todo/presentation/pages/todo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUpServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => todoProvider(),
        child: GetMaterialApp(
          home: LoginPage(),
        ),
      );
}
