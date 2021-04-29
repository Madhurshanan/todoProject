import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileuiintern/features/agenda/presentation/pages/agenda.dart';
import 'package:mobileuiintern/features/root/presentation/pages/rootView.dart';
import 'package:mobileuiintern/features/root/presentation/pages/rootViewModel.dart';
import 'package:mobileuiintern/serviceLocator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUpServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetMaterialApp(
        home: RootView()
      ),
    );
  }
}


