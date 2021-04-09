import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/root/domain/repositories/rootrepository.dart';

class RootUsecase extends StreamUseCase<User, NoParams> {
  final RootRepository rootrepository;
  RootUsecase({
    this.rootrepository,
  }) : assert(rootrepository != null, "Root Repo Can't to be null");

  @override
  Stream<User> call(NoParams params) {
    return rootrepository.loginCheck;
  }
}
