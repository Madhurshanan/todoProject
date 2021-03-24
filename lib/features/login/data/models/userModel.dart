
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileuiintern/features/login/domain/entites/userEntites.dart';


class UserModel extends UsersEntites{
  UserModel({ String email, String password})
      : super(email, password);

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(

        email: json['email'],
        password: json['password']
    );
  }
  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot){
    return UserModel(
      email: documentSnapshot.data()['email'],
      password: documentSnapshot.data()['password'],
    );
  }
  Map<String,dynamic> toDocument(){
    return {
      "email":email,
      "password":password,
    };
  }
}