
import 'package:major_project/model/user_entity.dart';

abstract class LoginEvent {}

class LoginButtonEvent extends LoginEvent{
  final UserEntity userEntity;

  LoginButtonEvent({required this.userEntity});
}

class LoginButtonFailureEvent extends LoginEvent{
  final String message;

  LoginButtonFailureEvent({required this.message});
}

