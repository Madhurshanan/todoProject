import 'package:dartz/dartz.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}