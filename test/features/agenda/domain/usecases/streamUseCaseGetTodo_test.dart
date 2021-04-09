import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/agenda/domain/entites/agendaEntities.dart';
import 'package:mobileuiintern/features/agenda/domain/usecases/streamUseCase.dart';
import 'package:mobileuiintern/serviceLocator.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/agendaMocks.dart';

void main() {
  MockAgendaRepository agendaRepository;
  AgendaStreamUsecase agendaStreamUsecase;

  setUp(() {
    agendaRepository = MockAgendaRepository();
    agendaStreamUsecase = AgendaStreamUsecase(agendaRepository: locator());
  });
  final list = [AgendaEntities()];
  test('Should return data when stream called', () {
    when(agendaRepository.getTodoStream())
        .thenAnswer((_) => Stream.fromIterable([list]));
    expect(agendaStreamUsecase(NoParams()), emitsInOrder([list]));
  });
  test('Should return empty when there is no data', () {
    when(agendaRepository.getTodoStream()).thenAnswer((_) => Stream.empty());
    expect(agendaStreamUsecase(NoParams()), emitsDone);
  });
  test('Should return  when there is Stream Error', () {
    when(agendaRepository.getTodoStream())
        .thenAnswer((_) => Stream.error("Error"));
    expect(agendaStreamUsecase(NoParams()), emitsError("Error"));
  });
}
