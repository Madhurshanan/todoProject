import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/agenda/domain/entites/agendaEntities.dart';
import 'package:mobileuiintern/features/agenda/domain/repositories/agendaRepository.dart';

class AgendaStreamUsecase
    extends StreamUseCase<List<AgendaEntities>, NoParams> {
  final AgendaRepository agendaRepository;

  AgendaStreamUsecase({this.agendaRepository})
      : assert(agendaRepository != null, "Agenda Repository Canot be null");

  @override
  Stream<List<AgendaEntities>> call(NoParams params) {
     return agendaRepository.getTodoStream();
  }


}
