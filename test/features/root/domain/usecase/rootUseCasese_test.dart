import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/root/domain/usecase/rootUseCasese.dart';
import 'package:mockito/mockito.dart';

import '../../../agenda/mocks/agendaMocks.dart';

void main() {
  MockUser mockUser;
  MockRootRepository mockRootRepository;
  RootUsecase rootUsecase;

  setUp(() {
    mockRootRepository = MockRootRepository();
    rootUsecase = RootUsecase(rootrepository: mockRootRepository);
  });
  group('Root UseCase Test', () {
    test('Should return sucsess', () {
      when(mockRootRepository.loginCheck)
          .thenAnswer((_) => Stream.fromIterable([mockUser]));
      expect(rootUsecase(NoParams()), emitsInOrder([mockUser]));
    });

    test('Shold return Empty', () {
      when(mockRootRepository.loginCheck)
          .thenAnswer((_) => Stream.error("Error"));
      expect(rootUsecase(NoParams()), emitsError("Error"));
    });
    
    test('Should return null', () {
      when(mockRootRepository.loginCheck).thenAnswer((_) => Stream.empty());
      expect(rootUsecase(NoParams()), emitsDone);
    });
  });
}
