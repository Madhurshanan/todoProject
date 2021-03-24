
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/todo/data/datasources/todoDataSources.dart';
import 'package:mobileuiintern/features/todo/domain/repositories/todoRepository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSources todoDataSources;

  TodoRepositoryImpl({
    @required this.todoDataSources,
  }) : assert(todoDataSources != null, 'Todo data source cannot be null');

  @override
  Future<Either<Failure, void>> insertTodo(String title,
      String description) async {
    try {
      return Right(await todoDataSources.insertTodo(title, description));
    } on ExceptionMessage catch (e) {
      return Left(ExcepitionIsGoingOn(error: e.error.toString()));
    }
  }


  @override
  Future<Either<Failure, void>> deleteTodo(String docId) async {
    try {
      return Right(await todoDataSources.deleteTodo(docId));
    } on ExceptionMessage catch (e) {
      return Left(ExcepitionIsGoingOn(error: e.error.toString()));
    }
  }
}
