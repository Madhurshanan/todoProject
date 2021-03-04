import 'package:dartz/dartz.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';

abstract class RegisterRepository {
  Future<Either<Failure, String>> register(String email, String password, String username);
}
