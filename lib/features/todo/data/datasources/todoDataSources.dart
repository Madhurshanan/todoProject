import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/todo/data/models/todoModels.dart';
import 'package:uuid/uuid.dart';

abstract class TodoDataSources {
  Future<void> insertTodo(String title, String description);

  Future<void> updateTodo(String title, String description);
}

class TodoDataSourcesImpl implements TodoDataSources {
  final FirebaseFirestore firestore;
  final Uuid uuid;

  TodoDataSourcesImpl({
    this.uuid,
    this.firestore,
  }) : assert(firestore != null, 'this data source cant be null');

//================================INSERT PART===================================
  @override
  Future<void> insertTodo(String title, String description) async {
    try {
      final uid = uuid.v1();
      return firestore.collection("todos").doc(uid).set(
          TodoModels(description: description, docId: uid, title: title)
              .toMap());
    } on ExceptionMessage catch (e) {
      throw ExceptionMessage(error: e.error);
    } on Exception catch (e) {
      throw ExceptionMessage(error: e.toString());
    }
  }

//===========================UPDATE PART========================================
  @override
  Future<void> updateTodo(String title, String description) async {
    try {
      final uid = uuid.v1();
       return await firestore
          .collection("todos")
          .doc(uid)
          .update(TodoModels(description: description,title: title, docId: uid).toMap());
    } on Exception catch (e) {
      throw ExceptionMessage(error: e.toString());
    }
  }
}
