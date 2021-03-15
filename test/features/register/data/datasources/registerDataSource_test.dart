import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/features/register/data/datasources/registerDataSource.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/firebaseMocks.dart';

void main() {
  MockFirebaseAuth mockFirebaseAuth;
  MockFirebaseFirestore mockFirebaseFirestore;
  RegisterDataSourceImpl registerDataSourceImpl;
  MockUseCredential mockUseCredential;
  MockUser mockUser;
  MockDocRef mockDocRef;
  MockCollecitonreference mockCollecitonreference;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockCollecitonreference = MockCollecitonreference();
    mockUser = MockUser();
    mockDocRef = MockDocRef();
    mockUseCredential = MockUseCredential();
    mockFirebaseFirestore = MockFirebaseFirestore();
    registerDataSourceImpl = RegisterDataSourceImpl(
        firebaseAuth: mockFirebaseAuth,
        firebaseFirestore: mockFirebaseFirestore);
  });
  test('should return string use is logged and data is written to firebase',
      () async {
    when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: 'afs', password: 'afs'))
        .thenAnswer((realInvocation) async => mockUseCredential);
    when(mockUseCredential.user).thenReturn(mockUser);
    when(mockFirebaseFirestore.collection(any))
        .thenReturn(mockCollecitonreference);
    when(mockCollecitonreference.doc(any)).thenReturn(mockDocRef);
    when(mockDocRef.set(any)).thenAnswer((realInvocation) async => Void);

    expect(await registerDataSourceImpl.register('afs', 'afs', 'afs'),
        'Register succesfull');
  });

  test('should throw Exception when called', () async {
    when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: 'afs', password: 'afs'))
        .thenAnswer((realInvocation) async => throw Exception('error'));

    final call = registerDataSourceImpl.register;
    expect(() => call('afs', 'afs', 'afs'), throwsException);
  });
  test('should throw Exception when called', () async {
    when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: 'afs', password: 'afs'))
        .thenAnswer((realInvocation) async => mockUseCredential);

    final call = registerDataSourceImpl.register;
    expect(() => call('afs', 'afs', 'afs'), throwsException);
  });
}
