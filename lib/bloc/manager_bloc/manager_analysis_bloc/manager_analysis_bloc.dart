
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project/data/form_data.dart';

import 'manager_analysis_event.dart';
import 'manager_analysis_state.dart';

class ManagerAnalysisBloc extends Bloc<ManagerAnalysisEvent, ManagerAnalysisState> {
  ManagerAnalysisBloc() : super(ManagerAnalysisInitialState()) {
    on<GetAllEmployeeAnalysisFormEvent>((event, emit) async{
      await getAllForm(event, emit);
    });
  }
}
