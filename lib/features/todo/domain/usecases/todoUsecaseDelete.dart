import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/todo/domain/repositories/todoRepository.dart';

class TodoUsecaeDelete extends UseCase<void, Params> {
  final TodoRepository todoRepository;

  TodoUsecaeDelete({@required this.todoRepository})
      : assert(todoRepository != null, "this repository cant be null");

  @override
  Future<Either<Failure, void>> call(Params params) {
    return todoRepository.deleteTodo(params.docId);
  }
}

class Params extends Equatable {
  final String docId;

  Params({
    @required this.docId,
  }) : assert(docId != null, 'Document ID cannot be null');

  @override
  List<Object> get props => [docId];
}
