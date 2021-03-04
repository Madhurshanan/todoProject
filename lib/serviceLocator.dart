import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mobileuiintern/features/login/data/datasources/loginDataSource.dart';
import 'package:mobileuiintern/features/login/data/repositories/loginRepositoryImpl.dart';
import 'package:mobileuiintern/features/login/domain/repositories/loginRepository.dart';
import 'package:mobileuiintern/features/login/domain/usecases/loginUseCase.dart';
import 'package:mobileuiintern/features/login/presentation/pages/loginViewModel.dart';

GetIt locator = GetIt.instance;

setUpServiceLocator() {
  initLogin();
}

void initLogin() {
  ///* use cases
  locator.registerLazySingleton(() => LoginUseCase(repository: locator()));

  ///* repositories
  locator.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginDataSource: locator()));

  ///* datasource
  locator.registerLazySingleton<LoginDataSource>(
      () => LoginDataSourceImpl(firebaseAuth: locator()));

  ///! core
  locator.registerLazySingleton(() => FirebaseAuth.instance);

  ///*viewodels
  locator.registerFactory(() => LoginViewModel(loginUseCase: locator()));
}
