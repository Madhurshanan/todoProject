
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/register/data/datasources/registerDataSource.dart';
import 'package:mobileuiintern/features/register/domain/repositories/registerRepository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSource registerDataSource;
  RegisterRepositoryImpl({
    @required this.registerDataSource,
  }) : assert(registerDataSource != null, 'Register data source cannot be null');
  @override
  Future<Either<Failure, String>> register(String email, String password,String username) async {
    try {
      return Right(await registerDataSource.register(password, email, username));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    }
  }
}
