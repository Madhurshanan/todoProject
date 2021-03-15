import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/register/domain/repositories/registerRepository.dart';

class RegisterUseCase extends UseCase<String, Params> {
  final RegisterRepository repository;
  RegisterUseCase({
    @required this.repository,
  }) : assert(repository != null, 'Repository cannot be null');
  @override
  Future<Either<Failure, String>> call(Params params) {
    return repository.register(params.email, params.password, params.username);
  }
}

class Params extends Equatable {
  final String email;
  final String password;
  final String username;
  Params({
    @required this.email,
    @required this.password,
    @required this.username,
  })  : assert(email != null, 'Email cannot be null'),
        assert(password != null, 'Password cannot be null'),
        assert(username != null, 'Username cannot be null');

  @override
  List<Object> get props => [email, password, username];
}
