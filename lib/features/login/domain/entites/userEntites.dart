import 'package:equatable/equatable.dart';


class UsersEntites extends Equatable {
  final String email;
  final String password;

  UsersEntites(this.email, this.password);


  @override
  // TODO: implement props
  List<Object> get props => [email,password];
}
