import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mobileuiintern/features/login/data/datasources/loginDataSource.dart';
import 'package:mobileuiintern/features/login/data/repositories/loginRepositoryImpl.dart';
import 'package:mobileuiintern/features/login/domain/repositories/loginRepository.dart';
import 'package:mobileuiintern/features/login/domain/usecases/loginUseCase.dart';
import 'package:mobileuiintern/features/login/presentation/pages/loginViewModel.dart';

import 'features/register/data/datasources/registerDataSource.dart';
import 'features/register/data/repositories/registerRepositoryImpl.dart';
import 'features/register/domain/repositories/registerRepository.dart';
import 'features/register/domain/usecases/registerUserCase.dart';
import 'features/register/presentation/pages/registerViewModel.dart';

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


void initRegister() {
  ///* use cases
  locator.registerLazySingleton(() => RegisterUseCase(repository: locator()));

  ///* repositories
  locator.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(registerDataSource: locator()));

  ///* datasource
  locator.registerLazySingleton<RegisterDataSource>(
      () => RegisterDataSourceImpl(firebaseAuth: locator()));

  ///! core
  locator.registerLazySingleton(() => FirebaseAuth.instance);

  ///*viewodels
  locator.registerFactory(() => RegisterViewModel(registerUseCase: locator()));
}
