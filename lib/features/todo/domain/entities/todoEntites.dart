import 'package:equatable/equatable.dart';

class TodoEntites extends Equatable{

  final String title;
  final String description;
  final String docId;

  TodoEntites({
  this.docId,
  this.title,
  this.description,
  });

  @override

  List<Object> get props => [docId,title,description];

}
