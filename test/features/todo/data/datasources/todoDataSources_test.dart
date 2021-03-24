

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
  });


    test('should add todo list Successfully', () async {
    when(mockFirebaseFirestore.collection(any)).thenReturn(
        mockCollecitonreference);
    when(mockFirebaseFirestore.collection('todo'))
        .thenReturn(mockCollecitonreference);
    when(mockUuid.v1()).thenAnswer((_)  => 'Void');
    when(mockCollecitonreference.doc(any)).thenReturn(mockDocRef);
    when(mockDocRef.set({
      'title': 'title',
      'description': 'description',
    })).thenAnswer((_) async => Void);

    expect(
        todoDataSourcesImpl.insertTodo('title', 'description'), isA<Future<void>>());
    });
    /*when(mockCollecitonreference.doc(any)).thenReturn(mockDocRef);
    when(mockDocRef.set({
      'title': 'title',
      'description': 'description',
    })).thenAnswer((_) async => Void);
    expect(todoDataSourcesImpl.insertTodo("title", "description"), isA<Future<void>>());
  });*/


  test('should throw  exception when trying to insert ', () async {
    when(mockFirebaseFirestore.collection(any)).thenReturn(
        mockCollecitonreference);

    when(mockCollecitonreference.doc(any)).thenReturn(mockDocRef);
    when(mockDocRef.set({
      'title': 'title',
      'description': 'description',
    })).thenAnswer((realInvocation) async => throw Exception('Error'));

    final call = todoDataSourcesImpl.insertTodo;
    expect(() => call("title", "description"), throwsException);

  });
}

















/*void main(){
  MockFirebaseFirestore mockFirebaseFirestore;
  MockCollecitonreference mockCollecitonreference;
  MockDocRef mockDocRef;
  TodoDataSourcesImpl todoDataSourcesImpl;

  setUp((){
    mockFirebaseFirestore = MockFirebaseFirestore();
    todoDataSourcesImpl = TodoDataSourcesImpl(firestore: mockFirebaseFirestore);});

    test('It should sucsess when it returns', () async {
      when(mockFirebaseFirestore.collection('todo')).thenReturn(mockCollecitonreference);

      when(mockCollecitonreference.doc(any)).thenReturn(mockDocRef);
      when(mockDocRef.set({
        'title': 'title',
        'description': 'description',
      })).thenAnswer((_) async => Void);

      expect(await todoDataSourcesImpl.insertTodo('title','task'), 'Data added succesfull');
    });*/