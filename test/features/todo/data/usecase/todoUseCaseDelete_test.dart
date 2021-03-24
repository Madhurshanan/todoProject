import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/features/todo/domain/repositories/todoRepository.dart';
import 'package:mobileuiintern/features/todo/domain/usecases/todoUsecaseDelete.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

class MockDeleteTodoRepository extends Mock implements TodoRepository{}

void main() {
  MockDeleteTodoRepository mockDeleteTodoRepository;
  TodoUsecaeDelete todoUsecaeDelete;

  setUp(() {
    mockDeleteTodoRepository = MockDeleteTodoRepository();
    todoUsecaeDelete = TodoUsecaeDelete(todoRepository: mockDeleteTodoRepository);
  });

  test("It should return pass when called", () async {
    when(mockDeleteTodoRepository.deleteTodo("A"))
        .thenAnswer((_) async => Right(Void));
    expect(await todoUsecaeDelete(Params(docId: "A")),
        Right(Void));
  });

  test("It will fail when called", () async {
    when(mockDeleteTodoRepository.deleteTodo("B"))
        .thenAnswer((_) async => Left(ExcepitionIsGoingOn(error: 'Error')));
    expect(await todoUsecaeDelete(Params(docId: "B")),
        Left(ExcepitionIsGoingOn( error: 'Error')));
  });
}
