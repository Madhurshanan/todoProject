
import 'package:mobileuiintern/features/agenda/domain/entites/agendaEntities.dart';

class AgendaModel extends AgendaEntities {

  final String title;
  final String description;
  final String docId;

  AgendaModel({this.title, this.description, this.docId}) 
  : super (title: title, description: description,docId: docId);


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'id': docId,
    };
  }

  factory AgendaModel.fromMap(Map<String, dynamic> map) {
    return AgendaModel(
      title: map['title'],
      description: map['description'],
      docId: map['id'],
    );
  }

  
}
