import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/todo/domain/repositories/todoRepository.dart';

class TodoUsecaeInsert extends UseCase<void, Params> {
  final TodoRepository toDoRepository;

  TodoUsecaeInsert({@required this.toDoRepository})
      : assert(toDoRepository != null, 'Todo can not be null');

  @override
  Future<Either<Failure, void>> call(Params params) {
    return toDoRepository.insertTodo(params.title, params.description);
  }
}

class Params extends Equatable {
  final String title;
  final String description;
  Params({
    @required this.title,
    @required this.description,
  })  : assert(description != null, 'description cannot be null'),
        assert(title != null, 'title cannot be null');

  @override
  List<Object> get props => [title, description];
}
