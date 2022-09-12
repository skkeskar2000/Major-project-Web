import 'package:major_project/model/user_entity.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}
class ErrorState extends LoginState {}

class LoginButtonState extends LoginState {
  final UserEntity userEntity;

  LoginButtonState({required this.userEntity});

}

class FailureState extends LoginState {
  final String message;

  FailureState({required this.message});

}

