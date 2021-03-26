import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/todo/domain/repositories/todoRepository.dart';

class TodoUseCaseUpdate extends UseCase<void, Params> {
  final TodoRepository todoRepository;


  TodoUseCaseUpdate({@required this.todoRepository})
      : assert(todoRepository != null, 'Todo can not be nul');

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return todoRepository.updateTodo(params.title, params.description);
  }
}

class Params extends Equatable {
  final String title;
  final String description;

  Params({@required this.title, @required this.description})
      : assert(description != null, 'description cannot be null'),
        assert(title != null, 'title cannot be null');

  @override
  List<Object> get props => [title, description];
}
