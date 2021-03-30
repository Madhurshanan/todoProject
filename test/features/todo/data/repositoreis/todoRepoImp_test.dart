import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/todo/data/datasources/todoDataSources.dart';
import 'package:mobileuiintern/features/todo/data/models/todoModels.dart';
import 'package:mobileuiintern/features/todo/data/repositories/todoRepositoryImpl.dart';
import 'package:mockito/mockito.dart';

class MockTodoDataSources extends Mock implements TodoDataSources {}

void main() {
  final todo = [TodoModels(docId: 'a', title: 'b', description: 'c')];

  MockTodoDataSources mockTodoDataSources;
  TodoRepositoryImpl todoRepositoryImpl;

  setUp(() {
    mockTodoDataSources = MockTodoDataSources();
    todoRepositoryImpl =
        TodoRepositoryImpl(todoDataSources: mockTodoDataSources);
  });

//==================================ISERT TODO==================================
  group('Insert', () {
    test('Should return success', () async {
      when(mockTodoDataSources.insertTodo("title", "description"))
          .thenAnswer((realInvocation) async => Void);
      expect(await todoRepositoryImpl.insertTodo("title", "description"),
          Right(Void));
    });

    test('Should return Failure', () async {
      when(mockTodoDataSources.insertTodo("title", "description")).thenAnswer(
          (realInvocation) async => throw ExceptionMessage(error: "Failed"));
      expect(await todoRepositoryImpl.insertTodo("title", "description"),
          Left(ExcepitionIsGoingOn(error: "Failed")));
    });
  });


//==================================DELETE======================================
  group('Delete', () {
    test('Should return sucseess', () async {
      when(mockTodoDataSources.deleteTodo('docid'))
          .thenAnswer((_) async => Void);
      expect(await todoRepositoryImpl.deleteTodo('docid'), Right(Void));
    });

    test('Should return Failiure when called', () async {
      when(mockTodoDataSources.deleteTodo('docid')).thenAnswer(
          (realInvocation) async => throw ExceptionMessage(error: "Failed"));
      expect(await todoRepositoryImpl.deleteTodo('docid'),
          Left(ExcepitionIsGoingOn(error: "Failed")));
    });
  });
//================================UPDATE========================================
  group('Update', () {
    test('Should return sucseess', () async {
      when(mockTodoDataSources.updateTodo('title', 'description'))
          .thenAnswer((_) async => Void);
      expect(await todoRepositoryImpl.updateTodo('title', 'description'),
          Right(Void));
    });
    test('Should return failiure', () async {
      when(mockTodoDataSources.updateTodo('title', 'description'))
          .thenAnswer((_) async => throw ExceptionMessage(error: "Failed"));
      expect(await todoRepositoryImpl.updateTodo('title', 'description'),
          Left(ExcepitionIsGoingOn(error: 'Failed')));
    });
  });
}
//==============================================================================