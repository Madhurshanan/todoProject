import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/todo/data/datasources/todoDataSources.dart';
import 'package:mobileuiintern/features/todo/data/models/todoModels.dart';
import 'package:mobileuiintern/features/todo/domain/repositories/todoRepository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSources todoDataSources;

  TodoRepositoryImpl({
    @required this.todoDataSources,
  }) : assert(todoDataSources != null, 'Todo data source cannot be null');

//==========================ISERT TODO==========================================
  @override
  Future<Either<Failure, void>> insertTodo(
      String title, String description) async {
    try {
      return Right(await todoDataSources.insertTodo(title, description));
    } on ExceptionMessage catch (e) {
      return Left(ExcepitionIsGoingOn(error: e.error.toString()));
    }
  }

//=============================DELETE TODO======================================
  @override
  Future<Either<Failure, void>> deleteTodo(String docId) async {
    try {
      return Right(await todoDataSources.deleteTodo(docId));
    } on ExceptionMessage catch (e) {
      return Left(ExcepitionIsGoingOn(error: e.error.toString()));
    }
  }

//===============================GET TODO=======================================
  @override
  Future<Either<Failure, List<TodoModels>>> getTodo() async {
    try {
      return Right(await todoDataSources.getTodo());
    } on ExceptionMessage catch (e) {
      return Left(ExcepitionIsGoingOn(error: e.error.toString()));
    }
  }

//==============================UPDATE TODO=====================================
  @override
  Future<Either<Failure, void>> updateTodo(
      String title, String desciption) async {
    try {
      return Right(await todoDataSources.updateTodo(title, desciption));
    } on ExceptionMessage catch (e) {
      return Left(ExcepitionIsGoingOn(error: e.error.toString()));
    }
  }
}
