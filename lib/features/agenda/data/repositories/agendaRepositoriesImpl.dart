import 'package:dartz/dartz.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/agenda/data/datasource/agendaDataSource.dart';
import 'package:mobileuiintern/features/agenda/domain/entites/agendaEntities.dart';
import 'package:mobileuiintern/features/agenda/domain/repositories/agendaRepository.dart';

//===============================GET TODO=======================================

class AgendaRepositoryImpl implements AgendaRepository {
  final AgendaDataSource agendaDataSource;

  AgendaRepositoryImpl({this.agendaDataSource})
      : assert(agendaDataSource != null, "Agenda data Source Cannot be null");

  @override
  Future<Either<Failure, List<AgendaEntities>>> getTodo() async {
    try {
      return Right(await agendaDataSource.getTodo());
    } on ExceptionMessage catch (e) {
      return Left(ExcepitionIsGoingOn(error: e.error.toString()));
    }
  }
  //=============================DELETE TODO======================================
  @override
  Future<Either<Failure, void>> deleteTodo(String docId) async {
    try {
      return Right(await agendaDataSource.deleteTodo(docId));
    } on ExceptionMessage catch (e) {
      return Left(ExcepitionIsGoingOn(error: e.error.toString()));
    }
  }

}
