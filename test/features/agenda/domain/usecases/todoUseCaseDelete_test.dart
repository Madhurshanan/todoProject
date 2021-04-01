import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/features/agenda/domain/repositories/agendaRepository.dart';
import 'package:mobileuiintern/features/agenda/domain/usecases/todoUsecaseDelete.dart';
import 'package:mockito/mockito.dart';

class MockDeleteTodoRepository extends Mock implements AgendaRepository{}

void main() {
  MockDeleteTodoRepository mockDeleteTodoRepository;
  AgendaUsecaeDelete agendaUsecaeDelete;

  setUp(() {
    mockDeleteTodoRepository = MockDeleteTodoRepository();
    agendaUsecaeDelete = AgendaUsecaeDelete(agendaRepository: mockDeleteTodoRepository);
  });

  test("It should return pass when called", () async {
    when(mockDeleteTodoRepository.deleteTodo("A"))
        .thenAnswer((_) async => Right(Void));
    expect(await agendaUsecaeDelete(Params(docId: "A")),
        Right(Void));
  });

  test("It will fail when called", () async {
    when(mockDeleteTodoRepository.deleteTodo("B"))
        .thenAnswer((_) async => Left(ExcepitionIsGoingOn(error: 'Error')));
    expect(await agendaUsecaeDelete(Params(docId: "B")),
        Left(ExcepitionIsGoingOn( error: 'Error')));
  });
}
