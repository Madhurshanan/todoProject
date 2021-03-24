
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/features/todo/domain/repositories/todoRepository.dart';
import 'package:mobileuiintern/features/todo/domain/usecases/todoUseCaseGetTodo.dart';
import 'package:mockito/mockito.dart';

class MockGettodoTodoRepository extends Mock implements TodoRepository{}

void main(){

MockGettodoTodoRepository mockGettodoTodoRepository;
TodoUseCaseGetTodo todoUseCaseGetTodo;

 setUp(() {
    mockGettodoTodoRepository = MockGettodoTodoRepository();
    todoUseCaseGetTodo = TodoUseCaseGetTodo(todoRepository: mockGettodoTodoRepository);
  });

  test("It should return pass when called", () async {
    when(mockGettodoTodoRepository.getTodo("title",'description'))
        .thenAnswer((_) async => Right(Void));
    expect(await todoUseCaseGetTodo(Params(title: 'title', description: 'description')),
        Right(Void));
  });

  test("It will fail when called", () async {
    when(mockGettodoTodoRepository.getTodo("title","description"))
        .thenAnswer((_) async => Left(ExcepitionIsGoingOn(error: 'Error')));
    expect(await todoUseCaseGetTodo(Params(title: 'title', description: 'description')),
        Left(ExcepitionIsGoingOn( error: 'Error')));
  });
}