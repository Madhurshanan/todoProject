import 'package:firebase_auth/firebase_auth.dart';

abstract class RootDataSource {
  Stream<User> get loginCheck;
}

class RootDataSourceImpl implements RootDataSource {
  final FirebaseAuth firebaseAuth;
  //final User user;
  //final Uuid uuid;

  RootDataSourceImpl(/*this.user,*/ {this.firebaseAuth} /*this.uuid*/);

  @override
  Stream<User> get loginCheck => firebaseAuth.authStateChanges();

}
