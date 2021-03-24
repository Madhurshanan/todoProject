import 'dart:ffi';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/todo/data/datasources/todoDataSources.dart';
import 'package:mobileuiintern/features/todo/data/repositories/todoRepositoryImpl.dart';
import 'package:mockito/mockito.dart';

class MockTodoDataSources extends Mock implements TodoDataSources {}
  void main() {
    MockTodoDataSources mockTodoDataSources;
    TodoRepositoryImpl todoRepositoryImpl;

    setUp(() {
      mockTodoDataSources = MockTodoDataSources();
      todoRepositoryImpl =
          TodoRepositoryImpl(todoDataSources: mockTodoDataSources);
    });

    test('Should return success', () async {
      when(mockTodoDataSources.insertTodo("title", "description"))
          .thenAnswer((realInvocation) async => Void);
      expect(await todoRepositoryImpl.insertTodo("title", "description"),
          Right(Void));
    });

    test('Should return Failure', () async {
      when(mockTodoDataSources.insertTodo("title", "description"))
          .thenAnswer((realInvocation) async => throw ExceptionMessage(error: "Failed"));
      expect(await todoRepositoryImpl.insertTodo("title", "description"),
          Left(ExcepitionIsGoingOn(error: "Failed")));
    });
  }

