import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/features/todo/domain/repositories/todoRepository.dart';
import 'package:mobileuiintern/features/todo/domain/usecases/todoUsecaseUpdate.dart';
import 'package:mockito/mockito.dart';

class MockUpdateTodoRepository extends Mock implements TodoRepository {}

void main() {
  MockUpdateTodoRepository mockUpdateTodoRepository;
  TodoUseCaseUpdate todoUseCaseUpdate;

  setUp(() {
    mockUpdateTodoRepository = MockUpdateTodoRepository();
    todoUseCaseUpdate =
        TodoUseCaseUpdate(todoRepository: mockUpdateTodoRepository);
  });

  test('Should pass the test when it called', () async {
    when(mockUpdateTodoRepository.updateTodo('title', 'description'))
        .thenAnswer((_) async => Right(Void));
    expect(
        await todoUseCaseUpdate(
            Params(description: 'description', title: 'title')),
        Right(Void));
  });

  test('Should fail the test when it called', () async {
    when(mockUpdateTodoRepository.updateTodo('title', 'description'))
        .thenAnswer((_) async => Left(ExcepitionIsGoingOn(error: "Error")));
    expect(
        await todoUseCaseUpdate(
            Params(description: 'description', title: 'title')),
        Left(ExcepitionIsGoingOn(error: 'Error')));
  });
}
