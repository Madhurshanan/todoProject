import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';

abstract class RegisterDataSource {
  Future<String> register(String password, String email, String username);
}

class RegisterDataSourceImpl implements RegisterDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  RegisterDataSourceImpl({
    @required this.firebaseAuth,
    @required this.firebaseFirestore,
  })  : assert(firebaseAuth != null, 'Firebase auth cannot be null'),
        assert(firebaseFirestore != null, 'Firebase firestore cannot be null');
  @override
  Future<String> register(
      String password, String email, String username) async {
    try {
      final response = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (response.user == null) {
        throw FirebaseAuthException(
            message: 'Cannot register some thing happnd');
      }
      await firebaseFirestore.collection('users').doc(response.user.uid).set({
        'id': response.user.uid,
        'name': username,
        'email': email,
      });
      return 'Register succesfull';
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message);
    } on Exception catch (e) {
      throw AuthException(message: e.toString());
    }
  }
}
