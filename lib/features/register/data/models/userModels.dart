

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileuiintern/features/register/domain/entites/userEntites.dart';

class UserModel extends UsersEntites {
  UserModel({ String name, String email, String password}): super(name, email, password);

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
        name: json['name'],
        email: json['email'],
        password: json['password']
    );
  }
  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot){
    return UserModel(
      name: documentSnapshot.data()['name'],
      email: documentSnapshot.data()['email'],
      password: documentSnapshot.data()['password'],
    );
  }
  Map<String,dynamic> toDocument(){
    return {
      "name":name,
      "email":email,
      "password":password,
    };
  }
}