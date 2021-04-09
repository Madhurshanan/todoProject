import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobileuiintern/core/exceptions/exceptions.dart';
import 'package:mobileuiintern/features/agenda/presentation/pages/agenda.dart';
import 'package:mobileuiintern/features/login/presentation/pages/loginView.dart';
import 'package:uuid/uuid.dart';

abstract class RootDataSource {
  Stream<User> loginCheck;
}

 class RootDataSourceImpl implements RootDataSource {
  final FirebaseAuth firebaseAuth;
  //final User user;
  //final Uuid uuid;

  RootDataSourceImpl(/*this.user,*/{ this.firebaseAuth} /*this.uuid*/);

  @override
  Stream<User> get loginCheck {
    try {
       FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user == null) {
          return LoginView();
        } else {
          return Agenda();
        }
      });
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message);
    } on Exception catch (e) {
      throw AuthException(message: e.toString());
    }
  }



 }
