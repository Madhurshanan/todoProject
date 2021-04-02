import 'package:dartz/dartz.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/features/agenda/domain/entites/agendaEntities.dart';

abstract class AgendaRepository {
  Future<Either<Failure, List<AgendaEntities>>> getTodo();
  Future<Either<Failure, void>> deleteTodo(String docId);
  Stream <List<AgendaEntities>> getTodoStream();
}
