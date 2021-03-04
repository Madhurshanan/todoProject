import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/features/login/domain/repositories/loginRepository.dart';
import 'package:mobileuiintern/features/login/domain/usecases/loginUseCase.dart';
import 'package:mockito/mockito.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  MockLoginRepository mockLoginRepository;
  LoginUseCase loginUseCase;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    loginUseCase = LoginUseCase(repository: mockLoginRepository);
  });

  test('should success return data from repo when called', () async {
    when(mockLoginRepository.login('afs', 'afs'))
        .thenAnswer((_) async => Right('I logged in'));
    expect(await loginUseCase(Params(email: 'afs', password: 'afs')),
        Right('I logged in'));
  });

  test('should return failures when called', () async {
    when(mockLoginRepository.login('afs', 'afs'))
        .thenAnswer((_) async => Left(AuthFailure('Error')));
    expect(await loginUseCase(Params(email: 'afs', password: 'afs')),
        Left(AuthFailure('Error')));
  });
}
