import 'dart:ffi';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/todo/domain/entities/todoEntites.dart';
import 'package:mobileuiintern/features/todo/domain/repositories/todoRepository.dart';
import 'package:mobileuiintern/features/todo/domain/usecases/todoUseCaseGetTodo.dart';
import 'package:mockito/mockito.dart';

class MockGettodoTodoRepository extends Mock implements TodoRepository {}

void main() {
  final List<TodoEntites> inputs = [
    TodoEntites(docId: '', description: 'AAA', title: 'BBB'),
    TodoEntites(docId: '', description: 'CCC', title: 'DDD'),
    TodoEntites(docId: '', description: 'EEE', title: 'FFF'),
    TodoEntites(docId: '', description: 'GGG', title: 'GGG'),
  ];

  MockGettodoTodoRepository mockGettodoTodoRepository;
  TodoUseCaseGetTodo todoUseCaseGetTodo;

  setUp(() {
    mockGettodoTodoRepository = MockGettodoTodoRepository();
    todoUseCaseGetTodo =
        TodoUseCaseGetTodo(todoRepository: mockGettodoTodoRepository);
  });

  test("It should return pass when called", () async {
    when(mockGettodoTodoRepository.getTodo())
        .thenAnswer((_) async => Right(inputs));
    expect(await todoUseCaseGetTodo(NoParams()), Right(inputs));
  });

  test("It will fail when called", () async {
    when(mockGettodoTodoRepository.getTodo())
        .thenAnswer((_) async => Left(ExcepitionIsGoingOn(error: 'Error')));
    expect(await todoUseCaseGetTodo(NoParams()),
        Left(ExcepitionIsGoingOn(error: 'Error')));
  });
}
