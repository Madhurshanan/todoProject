import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/todo/domain/entities/todoEntites.dart';
import 'package:mobileuiintern/features/todo/domain/repositories/todoRepository.dart';

class TodoUseCaseGetTodo extends UseCase<List<TodoEntites>, NoParams>{
  final TodoRepository todoRepository;

  TodoUseCaseGetTodo({@required this.todoRepository})
      : assert(todoRepository != null, "The repository canot be null");

 @override
  Future<Either<Failure, List<TodoEntites>>> call(NoParams params) async {
    return await todoRepository.getTodo();
  }
}
