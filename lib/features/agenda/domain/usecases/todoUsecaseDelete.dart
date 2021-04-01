import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/agenda/domain/repositories/agendaRepository.dart';

class AgendaUsecaeDelete extends UseCase<void, Params> {
  final AgendaRepository agendaRepository;

  AgendaUsecaeDelete({@required this.agendaRepository})
      : assert(agendaRepository != null, "this repository cant be null");

  @override
  Future<Either<Failure, void>> call(Params params) {
    return agendaRepository.deleteTodo(params.docId);
  }
}

class Params extends Equatable {
  final String docId;

  Params({
    @required this.docId, docID,
  }) : assert(docId != null, 'Document ID cannot be null');

  @override
  List<Object> get props => [docId];
}
