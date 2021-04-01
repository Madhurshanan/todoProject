//============================GET TODO PART====================================

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/agenda/data/models/agendaModel.dart';

abstract class AgendaDataSource {
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
}
// StreamController<String> controller = StreamController<String>.broadcast();
// Stream stream = controller.stream;;
// StreamSubscription<String> streamSubscription = stream.listen((value) {
//       print('Value from controller: $value');
// }); 
// controller.sink.add("1"); // prints "Value from controller: 1"
// controller.sink.add("2"); // prints "Value from controller: 2"

// stream.someMethod() ; // prints
//                       // Value from controller: 1
//                       // Value from controller: 2
// controller.sink.add("3"); // prints "Value from controller: 3" by the someMethod()