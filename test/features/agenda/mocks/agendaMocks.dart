import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobileuiintern/features/agenda/domain/repositories/agendaRepository.dart';
import 'package:mobileuiintern/features/root/domain/repositories/rootrepository.dart';
import 'package:mockito/mockito.dart';

class MockAgendaRepository extends Mock implements AgendaRepository {}

class MockRootRepository extends Mock implements RootRepository {}

class MockUser extends Mock implements User {}
