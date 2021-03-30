
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/agenda/domain/repositories/agendaRepository.dart';

class AgendaUsecase extends UseCase {
  final AgendaRepository agendaRepository;

  AgendaUsecase({@required this.agendaRepository})
      : assert(agendaRepository != null, "Agenda Repository cannot be");

  @override
  Future<Either<Failure, String>> call(params) {
    return agendaRepository.showList(params.title, params.description);

  }
}

class Params extends Equatable {
  final String title;
  final String description;

  Params({@required this.title, @required this.description})
      : assert(description != null, "Description canot be null"),
        assert(title != null, "Title canot be null");


  List<Object> get props => [title,description];
}
