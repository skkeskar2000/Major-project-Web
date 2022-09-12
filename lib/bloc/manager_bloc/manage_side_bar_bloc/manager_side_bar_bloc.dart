import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project/bloc/manager_bloc/manage_side_bar_bloc/manager_side_bar_event.dart';
import 'package:major_project/bloc/manager_bloc/manage_side_bar_bloc/manager_side_bar_state.dart';

class ManagerSideBarBloc
    extends Bloc<ManagerSideBarEvent, ManagerSideBarState> {
  ManagerSideBarBloc() : super(ManagerSideBarInitialState()) {
    on<ManagerListEvent>((event, emit) => emit(ManagerListState()));
    on<ManagerEmployeeListEvent>(
        (event, emit) => emit(ManagerEmployeeListState()));
    on<ManagerFillFormEvent>((event, emit) => emit(ManagerFillFormState()));
    on<ManagerDashboardEvent>((event, emit) => emit(ManagerDashboardState()));
    on<ManagerAnalysisEvent>((event, emit) => emit(ManagerAnalysisState()));
    on<ManagerCreateFormEvent>((event, emit) => emit(ManagerCreateFormState()));
  }
}
