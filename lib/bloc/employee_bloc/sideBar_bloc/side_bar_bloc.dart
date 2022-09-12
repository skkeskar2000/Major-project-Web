
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project/bloc/employee_bloc/sideBar_bloc/side_bar_event.dart';
import 'package:major_project/bloc/employee_bloc/sideBar_bloc/side_bar_state.dart';

class SideBarBloc extends Bloc<SideBarEvent, SideBarState> {
  SideBarBloc() : super(SideBarInitialState()) {
    on<HomeEvent>((event, emit) =>emit(SideBarInitialState(),),);
    on<FillFormEvent>((event, emit) => emit(FillFormState()));
    on<DashboardEvent>((event, emit) => emit(DashboardState()));
  }
}
