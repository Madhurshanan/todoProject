//============================GET TODO PART====================================

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/agenda/data/models/agendaModel.dart';

abstract class AgendaDataSource {
  Future<List<AgendaModel>> getTodo();
}

class AgendaDataSourcesImpl implements AgendaDataSource {
  final FirebaseFirestore firestore;

  AgendaDataSourcesImpl(this.firestore)
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
}



