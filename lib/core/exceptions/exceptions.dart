import 'package:flutter/widgets.dart';

class AuthException implements Exception {
  final String message;
  AuthException({@required this.message});
}
class ExceptionMessage implements Exception{
  final String error;

  ExceptionMessage({@required this.error});
}
