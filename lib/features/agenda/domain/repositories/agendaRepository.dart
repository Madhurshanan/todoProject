import 'package:dartz/dartz.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';

abstract class AgendaRepository {
  Future<Either<Failure, String>> showList(String email, String password);
}
