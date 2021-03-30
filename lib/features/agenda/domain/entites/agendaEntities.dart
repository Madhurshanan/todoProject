import 'package:equatable/equatable.dart';

class AgendaEntities extends Equatable{

  final String title;
  final String description;
  final String docId;

  AgendaEntities({
  this.docId,
  this.title,
  this.description,
  });

  @override

  List<Object> get props => [docId,title,description];

}
