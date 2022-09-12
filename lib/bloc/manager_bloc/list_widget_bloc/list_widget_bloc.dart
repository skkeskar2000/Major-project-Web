import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project/data/login_data.dart';

import 'list_widget_event.dart';
import 'list_widget_state.dart';

class ListWidgetBloc extends Bloc<ListWidgetEvent, ListWidgetState> {
  ListWidgetBloc() : super(ListWidgetInitial()) {
    on<AddButtonEvent>((event, emit) => emit(
          AddButtonState(),
        ));

    on<AddButton2Event>((event, emit) async {
      await addNewUser(event, emit);
    });

    on<GetSelectedUserEvent>((event, emit) async {
      await getSelectedUser(event, emit);
    });

  }
}
