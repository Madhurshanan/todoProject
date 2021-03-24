import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/features/todo/domain/repositories/todoRepository.dart';
import 'package:mobileuiintern/features/todo/domain/usecases/todoUsecaseInsert.dart';
import 'package:mockito/mockito.dart';

class MockInsertTodoRepository extends Mock
  implements TodoRepository {}

 void main(){
   MockInsertTodoRepository mockInsertTodoRepository;
  TodoUsecaeInsert todoUsecae;

  setUp((){
    mockInsertTodoRepository =MockInsertTodoRepository();
    todoUsecae = TodoUsecaeInsert(toDoRepository: mockInsertTodoRepository);
  });

  test("It should return pass when called", () async {
    when(mockInsertTodoRepository.insertTodo('A', 'B'))
        .thenAnswer((_) async => Right(Void));
    expect(await todoUsecae(Params(title: 'A', description: 'B')),
    Right(Void));
  });


  test("It will fail when called", () async {
    when(mockInsertTodoRepository.insertTodo('a', 'b'))
        .thenAnswer((_) async => Left(AuthFailure('Error')));
    expect(await todoUsecae(Params(title: 'a',description: 'b')),
    Left(AuthFailure('Error')));
  });
 }