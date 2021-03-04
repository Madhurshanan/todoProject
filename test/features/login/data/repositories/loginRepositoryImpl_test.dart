import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/login/data/datasources/loginDataSource.dart';
import 'package:mobileuiintern/features/login/data/repositories/loginRepositoryImpl.dart';
import 'package:mockito/mockito.dart';

class MockLoginDataSource extends Mock implements LoginDataSource {}

void main() {
  MockLoginDataSource mockLoginDataSource;
  LoginRepositoryImpl loginRepositoryImpl;
  setUp(() {
    mockLoginDataSource = MockLoginDataSource();
    loginRepositoryImpl =
        LoginRepositoryImpl(loginDataSource: mockLoginDataSource);
  });

  test('should return success string from data source', () async {
    when(mockLoginDataSource.login('afs', 'afs'))
        .thenAnswer((realInvocation) async => 'Logged In');
    expect(await loginRepositoryImpl.login('afs', 'afs'), Right('Logged In'));
  });

  test('should return auth failure when exception is thrown from data source',
      () async {
    when(mockLoginDataSource.login('afs', 'afs')).thenAnswer(
        (realInvocation) async => throw AuthException(message: 'you suck'));

    expect(await loginRepositoryImpl.login('afs', 'afs'),
        Left(AuthFailure('you suck')));
  });
}
