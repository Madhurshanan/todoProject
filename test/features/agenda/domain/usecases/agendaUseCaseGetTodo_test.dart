import 'dart:ffi';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/Failures/failures.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/agenda/domain/entites/agendaEntities.dart';
import 'package:mobileuiintern/features/agenda/domain/usecases/agendaUseCaseGetTodo.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/agendaMocks.dart';



void main() {
  final List<AgendaEntities> inputs = [
    AgendaEntities(docId: '', description: 'AAA', title: 'BBB'),
    AgendaEntities(docId: '', description: 'CCC', title: 'DDD'),
    AgendaEntities(docId: '', description: 'EEE', title: 'FFF'),
    AgendaEntities(docId: '', description: 'GGG', title: 'GGG'),
  ];

  MockAgendaRepository mockAgendaGettodoTodoRepository;
  AgendaUseCaseGetTodo agendaUseCaseGetTodo;

  setUp(() {
    mockAgendaGettodoTodoRepository = MockAgendaRepository();
    agendaUseCaseGetTodo =
        AgendaUseCaseGetTodo(agendaRepository: mockAgendaGettodoTodoRepository);
  });

  test("It should return pass when called", () async {
    when(mockAgendaGettodoTodoRepository.getTodo())
        .thenAnswer((_) async => Right(inputs));
    expect(await agendaUseCaseGetTodo(NoParams()), Right(inputs));
  });

  test("It will fail when called", () async {
    when(mockAgendaGettodoTodoRepository.getTodo())
        .thenAnswer((_) async => Left(ExcepitionIsGoingOn(error: 'Error')));
    expect(await agendaUseCaseGetTodo(NoParams()),
        Left(ExcepitionIsGoingOn(error: 'Error')));
  });
}
// StreamController<String> controller = StreamController<String>.broadcast();
// Stream stream = controller.stream;;
// StreamSubscription<String> streamSubscription = stream.listen((value) {
//       print('Value from controller: $value');
// }); 
// controller.sink.add("1"); // prints "Value from controller: 1"
// controller.sink.add("2"); // prints "Value from controller: 2"

// stream.someMethod() ; // prints
//                       // Value from controller: 1
//                       // Value from controller: 2
// controller.sink.add("3"); // prints "Value from controller: 3" by the someMethod()