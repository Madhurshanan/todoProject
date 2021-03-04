import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/login/domain/repositories/loginRepository.dart';

class LoginUseCase extends UseCase<String, Params> {
  final LoginRepository repository;
  LoginUseCase({
    @required this.repository,
  }) : assert(repository != null, 'Repository cannot be null');
  @override
  Future<Either<Failure, String>> call(Params params) {
    return repository.login(params.email, params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;
  Params({
    @required this.email,
    @required this.password,
  })  : assert(email != null, 'Email cannot be null'),
        assert(password != null, 'Password cannot be null');

  @override
  List<Object> get props => [email, password];
}
