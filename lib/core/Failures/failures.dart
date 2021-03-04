import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure({this.failureMessage});
  final String failureMessage;
  @override
  List<Object> get props => [failureMessage];
}

class AuthFailure extends Failure {
  final String message;

  AuthFailure(this.message) : super(failureMessage: message);
}
