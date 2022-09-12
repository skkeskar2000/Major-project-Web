import 'package:flutter_bloc/flutter_bloc.dart';
import '../sideBar_bloc/side_bar_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(EmployeeDashboardInitialState()) {

  }
}
