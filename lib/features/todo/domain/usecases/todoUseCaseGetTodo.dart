import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/todo/domain/repositories/todoRepository.dart';

class TodoUseCaseGetTodo extends UseCase<void, Params> {
  final TodoRepository todoRepository;

  TodoUseCaseGetTodo({@required this.todoRepository})
      : assert(todoRepository != null, "The repository canot be null");

  @override
  Future<Either<Failure, void>> call(Params params) {
    return todoRepository.getTodo(params.title, params.description);
  }
}

class Params extends Equatable {
  final String title;
  final String description;
  Params({
    @required this.title,
    @required this.description, String docId,
  })  : assert(description != null, 'description cannot be null'),
        assert(title != null, 'title cannot be null');

  @override
  List<Object> get props => [title, description];
}
