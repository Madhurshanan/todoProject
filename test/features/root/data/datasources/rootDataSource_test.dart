import 'package:flutter_test/flutter_test.dart';
import 'package:mobileuiintern/features/root/data/datasources/rootDataSource.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/firebaseMocks.dart';

void main() {
  MockFirebaseAuth mockFirebaseAuth;
  RootDataSourceImpl rootDataSourceImpl;
  MockUser mockuser;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockuser = MockUser();
    rootDataSourceImpl = RootDataSourceImpl(firebaseAuth: mockFirebaseAuth);
  });

  group('Root DataSource', () {
    test('Should return the datas successfully', () {
      when(mockFirebaseAuth.authStateChanges())
          .thenAnswer((_) => Stream.fromIterable([mockuser]));
      expect(rootDataSourceImpl.loginCheck, emitsInOrder([mockuser]));
    });
    test('Should retrn null', () {
      when(mockFirebaseAuth.authStateChanges())
          .thenAnswer((_) => Stream.empty());
      expect(rootDataSourceImpl.loginCheck, emitsDone);
    });
    test('Should return Error', () {
      when(mockFirebaseAuth.authStateChanges())
          .thenAnswer((_) => Stream.error("Error"));
      expect(rootDataSourceImpl.loginCheck, emitsError("Error"));
    });
  });
}
