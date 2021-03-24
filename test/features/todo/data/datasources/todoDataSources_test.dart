import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/features/todo/data/datasources/todoDataSources.dart';
import 'package:mobileuiintern/features/todo/data/models/todoModels.dart';
import 'package:mobileuiintern/features/todo/domain/entities/todoEntites.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import '../../../../mocks/firebaseMocks.dart';

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockQueryDocSnapshot extends Mock implements QueryDocumentSnapshot {}

class MockUuid extends Mock implements Uuid {}

void main() {
  MockFirebaseFirestore mockFirebaseFirestore;
  MockCollecitonreference mockCollecitonreference;
  TodoDataSourcesImpl todoDataSourcesImpl;
  //MockQuerySnapshot mockQuerySnapshot;
  //MockQueryDocSnapshot mockQueryDocSnapshot;
  MockDocRef mockDocRef;
  MockUuid mockUuid;

  setUp(() {
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockCollecitonreference = MockCollecitonreference();
    //mockQuerySnapshot = MockQuerySnapshot();
    //mockQueryDocSnapshot = MockQueryDocSnapshot();
    mockDocRef = MockDocRef();
    todoDataSourcesImpl = TodoDataSourcesImpl(firestore: mockFirebaseFirestore);
    mockUuid = MockUuid();
    todoDataSourcesImpl =
        TodoDataSourcesImpl(firestore: mockFirebaseFirestore, uuid: mockUuid);
  });

  final todo = TodoModels(docId: '123', title: 'A', description: 'B');

  final todo1 = TodoEntites(docId: '', title: 'AA', description: 'BB');

  final Map<String, dynamic> tData = {
    'docID': '',
    'title': "AA",
    'task': "BB",
  };

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
    TodoModels todoModels =TodoModels(title: 'A', description: 'B', docId: 'b');
    when(mockCollecitonreference.doc(any)).thenReturn(mockDocRef);
    when(mockDocRef.set(todoModels.toMap())).thenAnswer((realInvocation) async => throw Exception('Error'));

    final call = todoDataSourcesImpl.insertTodo;

    expect(() => call(todoModels.title,todoModels.description), throwsException);
  });
}
