import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/features/root/data/datasources/rootDataSource.dart';
import 'package:mobileuiintern/features/root/data/repositories/rootRepoImpl.dart';
import 'package:mockito/mockito.dart';

import '../../../agenda/mocks/agendaMocks.dart';

class MockRootDataSource extends Mock implements RootDataSource {}

void main() {
  MockRootDataSource mockRootDataSource;
  RootRepositotyImpl rootRepositotyImpl;
  MockUser user;

  setUp(() {
    mockRootDataSource = MockRootDataSource();
    rootRepositotyImpl = RootRepositotyImpl(rootDataSource: mockRootDataSource);
  });

  group('Login Chechk ', () {
    test('It Should login automatically ', () {
      when(mockRootDataSource.loginCheck)
          .thenAnswer((_) => Stream.fromIterable([user]));
      expect(rootRepositotyImpl.loginCheck, emitsInAnyOrder([user]));
    });
    test('It Should return Error', () {
      when(mockRootDataSource.loginCheck)
          .thenAnswer((_) => Stream.error("Error"));
      expect(rootRepositotyImpl.loginCheck, emitsError("Error"));
    });

    test('It should return null', () {
      when(mockRootDataSource.loginCheck).thenAnswer((_) => Stream.empty());
      expect(rootRepositotyImpl.loginCheck, emitsDone);
    });
  });
}
