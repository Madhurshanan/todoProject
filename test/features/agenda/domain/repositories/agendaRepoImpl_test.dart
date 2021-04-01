import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/agenda/data/datasource/agendaDataSource.dart';
import 'package:mobileuiintern/features/agenda/data/models/agendaModel.dart';
import 'package:mobileuiintern/features/agenda/data/repositories/agendaRepositoriesImpl.dart';
import 'package:mockito/mockito.dart';

class MockAgendaDataSources extends Mock implements AgendaDataSource {}

void main() {
  final todo = [AgendaModel(docId: 'a', title: 'b', description: 'c')];

  MockAgendaDataSources mockAgendaDataSources;
  AgendaRepositoryImpl agendaRepositoryImpl;

  setUp(() {
    mockAgendaDataSources = MockAgendaDataSources();
    agendaRepositoryImpl =
        AgendaRepositoryImpl(agendaDataSource: mockAgendaDataSources);
  });
  //=================================GetTODO======================================
  group('GetTodo', () {
    test('Should return sucseess', () async {
      when(mockAgendaDataSources.getTodo()).thenAnswer((_) async => todo);
      expect(await agendaRepositoryImpl.getTodo(), Right(todo));
    });

    test('Should return Failiure when called', () async {
      when(mockAgendaDataSources.getTodo()).thenAnswer(
          (realInvocation) async => throw ExceptionMessage(error: "Failed"));
      expect(await agendaRepositoryImpl.getTodo(),
          Left(ExcepitionIsGoingOn(error: "Failed")));
    });
  });
  //==================================DELETE======================================
  group('Delete', () {
    test('Should return sucseess', () async {
      when(mockAgendaDataSources.deleteTodo('docid'))
          .thenAnswer((_) async => Void);
      expect(await agendaRepositoryImpl.deleteTodo('docid'), Right(Void));
    });

    test('Should return Failiure when called', () async {
      when(mockAgendaDataSources.deleteTodo('docid')).thenAnswer(
          (realInvocation) async => throw ExceptionMessage(error: "Failed"));
      expect(await agendaRepositoryImpl.deleteTodo('docid'),
          Left(ExcepitionIsGoingOn(error: "Failed")));
    });
  });
}
