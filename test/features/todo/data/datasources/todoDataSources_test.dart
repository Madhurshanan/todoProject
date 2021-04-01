import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/features/todo/data/datasources/todoDataSources.dart';
import 'package:mobileuiintern/features/todo/data/models/todoModels.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import '../../../../mocks/firebaseMocks.dart';
import '../repositoreis/todoRepoImp_test.dart';

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockQueryDocSnapshot extends Mock implements QueryDocumentSnapshot {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

class MockUuid extends Mock implements Uuid {}

void main() {
  MockFirebaseFirestore mockFirebaseFirestore;
  MockCollecitonreference mockCollecitonreference;
  TodoDataSourcesImpl todoDataSourcesImpl;
  MockQueryDocSnapshot mockQueryDocSnapshot;
  MockDocumentSnapshot mockDocumentSnapshot;
  MockTodoDataSources mockTodoDataSources;
  MockQuerySnapshot mockQuerySnapshot;
  MockDocRef mockDocRef;

  MockUuid mockUuid;

  setUp(() {
    mockQueryDocSnapshot = MockQueryDocSnapshot();
    mockQuerySnapshot = MockQuerySnapshot();
    mockTodoDataSources = MockTodoDataSources();
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockDocumentSnapshot = MockDocumentSnapshot();
    mockCollecitonreference = MockCollecitonreference();
    mockDocRef = MockDocRef();
    todoDataSourcesImpl = TodoDataSourcesImpl(firestore: mockFirebaseFirestore);
    mockUuid = MockUuid();
    todoDataSourcesImpl =
        TodoDataSourcesImpl(firestore: mockFirebaseFirestore, uuid: mockUuid);
  });

  final todo = TodoModels(docId: '123', title: 'A', description: 'B');

  final Map<String, dynamic> tData = {
    'docID': '',
    'title': "AA",
    'task': "BB",
  };

//===============================Insert===================================================
  group('Insert TODO', () {
    test('should add todo list Successfully', () async {
      when(mockFirebaseFirestore.collection('todos'))
          .thenReturn(mockCollecitonreference);
      when(mockUuid.v1()).thenAnswer((_) => 'id');
      when(mockCollecitonreference.doc(any)).thenReturn(mockDocRef);
      when(mockDocRef.set({
        'title': 'title',
        'description': 'description',
      })).thenAnswer((_) async => Void);
      expect(todoDataSourcesImpl.insertTodo('title', 'description'),
          isA<Future<void>>());
    });

    test('should throw  exception when trying to insert ', () async {
      when(mockFirebaseFirestore.collection(any))
          .thenReturn(mockCollecitonreference);

      when(mockUuid.v1()).thenAnswer((_) => "b");
      TodoModels todoModels =
          TodoModels(title: 'A', description: 'B', docId: 'b');
      when(mockCollecitonreference.doc(any)).thenReturn(mockDocRef);
      when(mockDocRef.set(todoModels.toMap()))
          .thenAnswer((realInvocation) async => throw Exception('Error'));

      final call = todoDataSourcesImpl.insertTodo;

      expect(() => call(todoModels.title, todoModels.description),
          throwsException);
    });
  });


  

//=====================================UPDATE===============================================
  group('UPDATE TODO', () {
    final todoModel = TodoModels(description: 'd', title: 't', docId: "i");
    test('Should Pass when it calls', () async {
      when(mockUuid.v1()).thenReturn(todoModel.docId);
      when(mockFirebaseFirestore.collection('todos'))
          .thenReturn(mockCollecitonreference);
      when(mockCollecitonreference.doc(any)).thenReturn(mockDocRef);
      when(mockDocRef.set(todoModel.toMap())).thenAnswer((_) async => Void);
      expect(
          todoDataSourcesImpl.updateTodo(
              todoModel.title, todoModel.description),
          isA<Future<void>>());
    });

    test('Should faild when it called', () async {
      when(mockUuid.v1()).thenReturn(todoModel.docId);
      when(mockFirebaseFirestore.collection(any))
          .thenReturn(mockCollecitonreference);
      when(mockCollecitonreference.doc(any)).thenReturn(mockDocRef);
      when(mockDocRef.update(todoModel.toMap()))
          .thenAnswer((_) async => throw Exception("Error"));

      final call = todoDataSourcesImpl.updateTodo;
      expect(
          () => call(todoModel.title, todoModel.description), throwsException);
    });
  });
}
