//============================GET TODO PART====================================

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/agenda/data/models/agendaModel.dart';

abstract class AgendaDataSource {
  Stream<List<AgendaModel>> getStream();
  Future<List<AgendaModel>> getTodo();
  Future<void> deleteTodo(String docID);
}

class AgendaDataSourcesImpl implements AgendaDataSource {
  final FirebaseFirestore firestore;

  AgendaDataSourcesImpl({this.firestore})
      : assert(firestore != null, 'this data source cant be null');

  @override
  Future<List<AgendaModel>> getTodo() async {
    try {
      final result = await firestore.collection("todos").get();
      if (result != null && result.docs != null && result.docs.isNotEmpty) {
        return result.docs.map((e) => AgendaModel.fromMap(e.data())).toList();
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

  @override
  Stream<List<AgendaModel>> getStream() {
    return firestore
        .collection("todos")
        .snapshots()
        .map((e) => e.docs.map((e) => AgendaModel.fromMap(e.data())).toList());

    //return result.docs.map((e) => AgendaModel.fromMap(e.data())).toList();

    //return firestore.collection("todos").snapshots().map((snapshot))
  }
}
//Stream<S> map<S>(S Function(QuerySnapshot) convert)
//
//
//     return StreamBuilder<QuerySnapshot>(
//   stream: firestore.collection("todos").snapshots(),
//   builder: (context,snapshot){
//     if(snapshot.hasData) 
//     {
//       final message = snapshot.data.docs;
//       List<AgendaModel>
//     }
//   },
// );
