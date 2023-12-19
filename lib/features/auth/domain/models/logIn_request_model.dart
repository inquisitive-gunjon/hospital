import 'package:equatable/equatable.dart';

class UserLoginData extends Equatable{
  final String email;
  final String password;

  const UserLoginData({required this.email,required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email,password];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}