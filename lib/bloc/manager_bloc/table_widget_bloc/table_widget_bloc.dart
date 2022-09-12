
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project/bloc/manager_bloc/table_widget_bloc/table_widget_event.dart';
import 'package:major_project/bloc/manager_bloc/table_widget_bloc/table_widget_state.dart';

class TableWidgetBloc extends Bloc<TableWidgetEvent, TableWidgetState> {
  TableWidgetBloc() : super(TableWidgetInitial()) {

    on<UpdateButtonEvent>((event, emit) => UpdateButtonState());
  }
}
