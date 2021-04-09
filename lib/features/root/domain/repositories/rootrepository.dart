import 'package:firebase_auth/firebase_auth.dart';

abstract class RootRepository {
 Stream<User>  get loginCheck;
 
}
