import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/features/agenda/data/datasource/agendaDataSource.dart';
import 'package:mobileuiintern/features/agenda/data/models/agendaModel.dart';
import 'package:mobileuiintern/features/todo/data/models/todoModels.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import '../../../../mocks/firebaseMocks.dart';
import '../../domain/repositories/agendaRepoImpl_test.dart';

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockQueryDocSnapshot extends Mock implements QueryDocumentSnapshot {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

class MockUuid extends Mock implements Uuid {}

void main() {
  MockFirebaseFirestore mockFirebaseFirestore;
  MockCollecitonreference mockCollecitonreference;
  AgendaDataSource agendaDataSourceImpl;
  AgendaDataSourcesImpl agendaDataSourcesImpl;
  MockQueryDocSnapshot mockQueryDocSnapshot;
  MockDocumentSnapshot mockDocumentSnapshot;
  MockAgendaDataSources mockAgendaDataSources;
  MockQuerySnapshot mockQuerySnapshot;
  MockDocRef mockDocRef;

  MockUuid mockUuid;

  setUp(() {
    mockQueryDocSnapshot = MockQueryDocSnapshot();
    mockQuerySnapshot = MockQuerySnapshot();
    mockAgendaDataSources = MockAgendaDataSources();
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockDocumentSnapshot = MockDocumentSnapshot();
    mockCollecitonreference = MockCollecitonreference();
    mockDocRef = MockDocRef();
    agendaDataSourceImpl = AgendaDataSourcesImpl(firestore: mockFirebaseFirestore);
  });

  final todo = AgendaModel(docId: '123', title: 'A', description: 'B');

  final Map<String, dynamic> tData = {
    'docID': '',
    'title': "AA",
    'task': "BB",
  };

//==================================GetTodo===============================================
  group('Get TODO', () {
    test('It should return succsess when it call', () async {
      when(mockFirebaseFirestore.collection('todos'))
          .thenReturn(mockCollecitonreference);
      when(mockCollecitonreference.get())
          .thenAnswer((_) async => mockQuerySnapshot);
      when(mockQuerySnapshot.docs).thenReturn([mockQueryDocSnapshot]);
      when(mockQueryDocSnapshot.data()).thenReturn(todo.toMap());

      expect(await agendaDataSourceImpl.getTodo(), [todo]);
    });

    test('It Should fail When it called', () async {
      when(mockFirebaseFirestore.collection(any))
          .thenReturn((mockCollecitonreference));
      when(mockCollecitonreference.get())
          .thenAnswer((_) async => throw Exception("Error"));
      final call = agendaDataSourceImpl.getTodo;
      expect(() => call(), throwsException);
    });

    test('It Should failed when the data is null', () async {
      when(mockFirebaseFirestore.collection("todos"))
          .thenReturn(mockCollecitonreference);
      when(mockCollecitonreference.get()).thenAnswer((_) async => null);
      final call = agendaDataSourceImpl.getTodo;
      expect(() => call(), throwsException);
    });

    test('It Should fail When doc is null', () async {
      when(mockFirebaseFirestore.collection(any))
          .thenReturn((mockCollecitonreference));
      when(mockCollecitonreference.get())
          .thenAnswer((_) async => mockQuerySnapshot);
      when(mockQuerySnapshot.docs).thenReturn(null);

      final call = agendaDataSourceImpl.getTodo;

      expect(() => call(), throwsException);
    });

    test('It Should fail if doc is empty', () async {
      when(mockFirebaseFirestore.collection(any))
          .thenReturn((mockCollecitonreference));
      when(mockCollecitonreference.get())
          .thenAnswer((_) async => mockQuerySnapshot);
      when(mockQuerySnapshot.docs).thenReturn([]);

      final call = agendaDataSourceImpl.getTodo;

      expect(() => call(), throwsException);
    });
  });

  //==========================================DELETE========================================  group('Delete todo test', () {
  group('Delete TODO', () {
    test('Should delete when it calls', () async {
      when(mockFirebaseFirestore.collection('todos'))
          .thenReturn(mockCollecitonreference);
      when(mockCollecitonreference.doc(any)).thenReturn(mockDocRef);
      when(mockDocRef.delete()).thenAnswer((_) async => Void);
      expect(agendaDataSourceImpl.deleteTodo('docID'), isA<Future<void>>());
    });
    test('Should fail when it calls', () async {
      when(mockFirebaseFirestore.collection('todos'))
          .thenReturn(mockCollecitonreference);
      when(mockCollecitonreference.doc(any)).thenReturn(mockDocRef);
      when(mockDocRef.delete())
          .thenAnswer((_) async => throw Exception("Error"));

      final call = agendaDataSourceImpl.deleteTodo;
      expect(() => call("docID"), throwsException);
    });
  });
}
