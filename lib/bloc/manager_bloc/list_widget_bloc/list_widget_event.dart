import 'package:major_project/bloc/manager_bloc/list_widget_bloc/list_widget_bloc.dart';

abstract class ListWidgetEvent {}

class AddButtonEvent extends ListWidgetEvent {}
class AddButton2Event extends ListWidgetEvent {
  final String email;
  final String password;
  final String role;
  final String name;

  AddButton2Event({required this.name, required this.email, required this.password, required this.role,});
}

class GetSelectedUserEvent extends ListWidgetEvent {
  final String role;

  GetSelectedUserEvent({required this.role});

}