import 'package:equatable/equatable.dart';


class UsersEntites extends Equatable {
  final String name;
  final String email;
  final String password;

  UsersEntites(this.name, this.email, this.password);

  @override
  // TODO: implement props
  List<Object> get props => [name,email,password];


}