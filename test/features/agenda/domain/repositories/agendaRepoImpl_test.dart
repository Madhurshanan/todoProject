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

//==================================STREMS=========================================
  group('This is story of Streams Data Source Implementation', () {
    test('Should return data when if there is data', () {
      when(mockAgendaDataSources.getStream())
          .thenAnswer((_) => Stream.fromIterable([todo]));
      expect(agendaRepositoryImpl.getTodoStream(), emitsInOrder([todo]));
    });

    test('Should throw Error when if there is error', () {
      when(mockAgendaDataSources.getStream())
          .thenAnswer((_) => Stream.error("Error"));
      expect(agendaRepositoryImpl.getTodoStream(), emitsError("Error"));
    });

    test('should therow nul when its empty', () {
      when(mockAgendaDataSources.getStream()).thenAnswer((_) => Stream.empty());
      expect(agendaRepositoryImpl.getTodoStream(), emitsDone);
    });
  });
}
