import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/features/agenda/data/datasource/agendaDataSource.dart';
import 'package:mobileuiintern/features/agenda/data/models/agendaModel.dart';
import 'package:mobileuiintern/features/agenda/domain/repositories/agendaRepository.dart';

//===============================GET TODO=======================================

class AgendaRepositoryImpl implements AgendaRepository {
  final AgendaDataSource agendaDataSource;

  AgendaRepositoryImpl({@required this.agendaDataSource})
      : assert(agendaDataSource != null, "Agenda data Source Cannot be null");

  @override
  Future<Either<Failure, List<AgendaModel>>> getTodo() async {
    try {
      return Right(await agendaDataSource.getTodo());
    } catch (e) {
      return Left(ExcepitionIsGoingOn(error: e.error.toString));
    }
  }
}

