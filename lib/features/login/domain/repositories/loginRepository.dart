import 'package:dartz/dartz.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> login(String email, String password);
}
