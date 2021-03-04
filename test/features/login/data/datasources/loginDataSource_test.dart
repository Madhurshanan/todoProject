

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/features/login/data/datasources/loginDataSource.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUseCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

void main() {
  MockFirebaseAuth mockFirebaseAuth;
  MockUseCredential mockUseCredential;
  MockUser mockUser;
  LoginDataSourceImpl dataSourceImpl;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUseCredential = MockUseCredential();
    mockUser = MockUser();
    dataSourceImpl = LoginDataSourceImpl(firebaseAuth: mockFirebaseAuth);
  });

  test('should return success string when authentication was successful',
      () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: 'afs', password: 'afs'))
        .thenAnswer((realInvocation) async => mockUseCredential);

    when(mockUseCredential.user).thenReturn(mockUser);
    expect(await dataSourceImpl.login('afs', 'afs'), 'Login succesfull');
  });
  test('should return exceptiuon when no user is provided', () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: 'afs', password: 'afs'))
        .thenAnswer((realInvocation) async => mockUseCredential);

    final call = dataSourceImpl.login;

    expect(() => call('afs', 'afs'), throwsException);
  });

  test('should throw exception when called rfirebase', () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: 'afs', password: 'afs'))
        .thenAnswer((realInvocation) async => throw Exception('Error'));

    final call = dataSourceImpl.login;

    expect(() => call('afs', 'afs'), throwsException);
  });
}
