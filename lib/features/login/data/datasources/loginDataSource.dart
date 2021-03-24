

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';

abstract class  LoginDataSource {
  Future<String> login(String password, String email);
}

class LoginDataSourceImpl implements LoginDataSource {
  final FirebaseAuth firebaseAuth;
  LoginDataSourceImpl({
    @required this.firebaseAuth,
  }) : assert(firebaseAuth != null, 'Firebase auth cannot be null');
  @override
  Future<String> login(String password, String email) async {
    try {
      final response = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (response.user == null) {
        throw FirebaseAuthException(message: 'Cannot login some thing happnd');
      }
      return 'Login succesfull';
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message);
    } on Exception catch (e) {
      throw AuthException(message: e.toString());
    }
  }
}
