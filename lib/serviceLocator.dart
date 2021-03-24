import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mobileuiintern/features/login/data/datasources/loginDataSource.dart';
import 'package:mobileuiintern/features/login/data/repositories/loginRepositoryImpl.dart';
import 'package:mobileuiintern/features/login/domain/repositories/loginRepository.dart';
import 'package:mobileuiintern/features/login/domain/usecases/loginUseCase.dart';
import 'package:mobileuiintern/features/login/presentation/pages/loginViewModel.dart';
import 'package:mobileuiintern/features/todo/data/datasources/todoDataSources.dart';
import 'package:mobileuiintern/features/todo/data/repositories/todoRepositoryImpl.dart';
import 'package:mobileuiintern/features/todo/domain/repositories/todoRepository.dart';
import 'package:mobileuiintern/features/todo/domain/usecases/todoUsecaseInsert.dart';
import 'package:uuid/uuid.dart';

import 'features/register/data/datasources/registerDataSource.dart';
import 'features/register/data/repositories/registerRepositoryImpl.dart';
import 'features/register/domain/repositories/registerRepository.dart';
import 'features/register/domain/usecases/registerUserCase.dart';
import 'features/register/presentation/pages/registerViewModel.dart';
import 'features/todo/presentation/pages/todoViewModel.dart';
GetIt locator = GetIt.instance;

setUpServiceLocator() {
  initCore();
  initLogin();
  initRegister();
  insertTodoViewModel();
}

void initCore() {
  ///! core
  locator.registerLazySingleton(() => FirebaseAuth.instance);
  locator.registerLazySingleton(() => FirebaseFirestore.instance);
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
  locator.registerLazySingleton<RegisterDataSource>(() =>
      RegisterDataSourceImpl(
          firebaseAuth: locator(), firebaseFirestore: locator()));


  ///*viewodels
  locator.registerFactory(() => RegisterViewModel(registerUseCase: locator()));
}

void insertTodoViewModel() {
  ///* use cases
  locator.registerLazySingleton(() => TodoUsecaeInsert(toDoRepository: locator()));

  ///* repositories
  locator.registerLazySingleton<TodoRepository>(
          () => TodoRepositoryImpl(todoDataSources: locator()));

  ///* datasource
  locator.registerLazySingleton<TodoDataSources>(() =>
      TodoDataSourcesImpl(firestore: locator(),
          uuid: locator()));
  locator.registerLazySingleton(() => Uuid());


  ///*viewodels
  locator.registerLazySingleton(() => TodoViewModel(todoUsecaeInsert: locator()));
}