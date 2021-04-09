import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobileuiintern/features/root/data/datasources/rootDataSource.dart';
import 'package:mobileuiintern/features/root/domain/repositories/rootrepository.dart';

class RootRepositotyImpl extends RootRepository {
  final RootDataSource rootDataSource;
  RootRepositotyImpl({@required this.rootDataSource})
      : assert(rootDataSource != null, "Root Data Source Canot be null");
  @override
  Stream<User> get loginCheck {
    return rootDataSource.loginCheck;
  }
}
