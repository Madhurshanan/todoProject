import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mobileuiintern/features/todo/domain/entities/todoEntites.dart';

abstract class TodoRepository {
  Future<Either<Failure, void>> insertTodo(String title, String description);
  Future<Either<Failure, void>>updateTodo(String title,String desciption); 
  Future<Either<Failure, void>> deleteTodo(String docId);


}
