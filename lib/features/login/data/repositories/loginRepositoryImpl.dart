

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/login/data/datasources/loginDataSource.dart';
import 'package:mobileuiintern/features/login/domain/repositories/loginRepository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource loginDataSource;
  LoginRepositoryImpl({
    @required this.loginDataSource,
  }) : assert(loginDataSource != null, 'Login data source cannot be null');
  @override
  Future<Either<Failure, String>> login(String email, String password) async {
    try {
      return Right(await loginDataSource.login(password, email));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    }
  }
}
