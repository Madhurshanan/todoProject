
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/agenda/data/datasource/agendaDataSource.dart';
import 'package:mobileuiintern/features/agenda/data/repositories/agendaRepositoriesImpl.dart';
import 'package:mobileuiintern/features/todo/data/models/todoModels.dart';
import 'package:mockito/mockito.dart';

class MockAgendaDataSources extends Mock implements AgendaDataSource {}

void main() {
  final todo = [TodoModels(docId: 'a', title: 'b', description: 'c')];

  MockAgendaDataSources mockAgendaDataSources;
  AgendaRepositoryImpl agendaRepositoryImpl;

  setUp(() {
    mockAgendaDataSources = MockAgendaDataSources();
    agendaRepositoryImpl =
        AgendaRepositoryImpl(agendaDataSource: mockAgendaDataSources);

        //=================================GetTODO======================================
  group('GetTodo', () {  
    test('Should return sucseess', () async {
      when(mockAgendaDataSources.getTodo())
          .thenAnswer((_) async => todo);
      expect(await agendaRepositoryImpl.getTodo(), Right(todo));
    });

    test('Should return Failiure when called', () async {
      when(mockAgendaDataSources.getTodo()).thenAnswer(
          (realInvocation) async => throw ExceptionMessage(error: "Failed"));
      expect(await agendaRepositoryImpl.getTodo(),
          Left(ExcepitionIsGoingOn(error: "Failed")));
  });
      });
  });
  }



