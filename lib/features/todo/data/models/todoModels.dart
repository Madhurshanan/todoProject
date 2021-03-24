import 'dart:convert';

import 'package:mobileuiintern/features/todo/domain/entities/todoEntites.dart';

class TodoModels extends TodoEntites {

  final String title;
  final String description;
  final String docId;

  TodoModels({this.title, this.description, this.docId}) 
  : super (title: title, description: description,docId: docId);


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'docId': docId,
    };
  }

  factory TodoModels.fromMap(Map<String, dynamic> map) {
    return TodoModels(
      title: map['title'],
      description: map['description'],
      docId: map['docId'],
    );
  }

  
}
