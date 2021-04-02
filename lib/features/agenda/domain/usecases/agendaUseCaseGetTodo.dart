import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/agenda/domain/entites/agendaEntities.dart';
import 'package:mobileuiintern/features/agenda/domain/repositories/agendaRepository.dart';

class AgendaUseCaseGetTodo extends UseCase<List<AgendaEntities>, NoParams> {
  final AgendaRepository agendaRepository;

  AgendaUseCaseGetTodo({@required this.agendaRepository})
      : assert(agendaRepository != null, "The repository canot be null");

  @override
  Future<Either<Failure, List<AgendaEntities>>> call(NoParams params) async {
    return await agendaRepository.getTodo();
  }


}
