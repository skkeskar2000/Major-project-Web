import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project/data/form_data.dart';

import 'employee_form_event.dart';
import 'employee_form_state.dart';

class EmployeeFormBloc extends Bloc<EmployeeFormEvent, EmployeeFormState> {
  EmployeeFormBloc() : super(EmployeeFormInitialState()) {
    on<CheckFormFilledEvent>((event, emit) async {
      await getForm(event, emit);
    });
    on<FailureEvent>((event, emit) => emit(FailureState()));
    on<SubmitButtonEvent>((event, emit) async {
      await saveForm(event,emit);
    });
    on<GetFormEvent>((event, emit)async{
      await getForm(event, emit);
    });
  }
}
