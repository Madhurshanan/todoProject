import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/todo/data/models/todoModels.dart';
import 'package:uuid/uuid.dart';

abstract class TodoDataSources {
  Future<void> insertTodo(String title, String description);
  Future<List<TodoModels>> getTodo();
  Future<void> deleteTodo(String docID);
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

  //============================GET TODO PART====================================
  @override
  Future<List<TodoModels>> getTodo() async {
    try {
      final result = await firestore.collection("todos").get();
      if (result != null && result.docs != null && result.docs.isNotEmpty) {
        return result.docs.map((e) => TodoModels.fromMap(e.data())).toList();
      }
      throw Exception('Cannot Load list');
    } on Exception catch (e) {
      throw ExceptionMessage(error: e.toString());
    }
  }

//===========================DELETE PART========================================

  @override
  Future<void> deleteTodo(String docID) async {
    try {
      return firestore.collection('todos').doc(docID).delete();
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
