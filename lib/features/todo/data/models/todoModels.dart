
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileuiintern/features/todo/domain/entities/todoEntites.dart';


class TodoModels extends TodoEntites{
  TodoModels({ String title, String description, String docId})
      : super(title: title,description: description, docId: docId);

  factory TodoModels.fromJson(Map<String,dynamic> json){
    return TodoModels(

        title: json['title'],
        description: json['description'],
          docId: json['']
    );
  }
  Map<String, dynamic> toMap(TodoEntites todoEntites) {
    return {
      'docId': docId,
      'title': title,
      'description': description,
    };
  }

  factory TodoModels.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TodoModels(
      docId: map['docId'],
      title: map['title'],
      description: map['description'],
    );
  }

}
