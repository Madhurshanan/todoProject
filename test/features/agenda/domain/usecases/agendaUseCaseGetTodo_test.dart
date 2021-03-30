import 'dart:ffi';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/agenda/domain/entites/agendaEntities.dart';
import 'package:mobileuiintern/features/agenda/domain/repositories/agendaRepository.dart';
import 'package:mobileuiintern/features/agenda/domain/usecases/agendaUseCaseGetTodo.dart';
import 'package:mockito/mockito.dart';

class MockAgendaGettodoTodoRepository extends Mock implements AgendaRepository {
}

void main() {
  final List<AgendaEntities> inputs = [
    AgendaEntities(docId: '', description: 'AAA', title: 'BBB'),
    AgendaEntities(docId: '', description: 'CCC', title: 'DDD'),
    AgendaEntities(docId: '', description: 'EEE', title: 'FFF'),
    AgendaEntities(docId: '', description: 'GGG', title: 'GGG'),
  ];

  MockAgendaGettodoTodoRepository mockAgendaGettodoTodoRepository;
  AgendaUseCaseGetTodo agendaUseCaseGetTodo;

  setUp(() {
    mockAgendaGettodoTodoRepository = MockAgendaGettodoTodoRepository();
    agendaUseCaseGetTodo =
        AgendaUseCaseGetTodo(agendaRepository: mockAgendaGettodoTodoRepository);
  });

  test("It should return pass when called", () async {
    when(mockAgendaGettodoTodoRepository.getTodo())
        .thenAnswer((_) async => Right(inputs));
    expect(await agendaUseCaseGetTodo(NoParams()), Right(inputs));
  });

  test("It will fail when called", () async {
    when(mockAgendaGettodoTodoRepository.getTodo())
        .thenAnswer((_) async => Left(ExcepitionIsGoingOn(error: 'Error')));
    expect(await agendaUseCaseGetTodo(NoParams()),
        Left(ExcepitionIsGoingOn(error: 'Error')));
  });
}
