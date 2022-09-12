import 'package:major_project/bloc/login_bloc/login_state.dart';

abstract class ListWidgetState {}

class ListWidgetInitial extends ListWidgetState {}
class AddButtonState extends ListWidgetState {}
class SuccessfullyAddedEmployee extends ListWidgetState {}
class UnableToAddEmployee extends ListWidgetState {}

//List of user
class GetSelectedUsers extends ListWidgetState {
  final List<dynamic> user;
  GetSelectedUsers({required this.user});
}
class UnableToGetUsers extends ListWidgetState {}