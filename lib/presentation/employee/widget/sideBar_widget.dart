import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project/bloc/employee_bloc/sideBar_bloc/side_bar_event.dart';import '../../../bloc/employee_bloc/sideBar_bloc/side_bar_bloc.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          title: const Text('Home'),
          onTap: () {
            BlocProvider.of<SideBarBloc>(context).add(HomeEvent());
          },
        ),
        ListTile(
          title: const Text('Fill Form'),
          onTap: () {
            BlocProvider.of<SideBarBloc>(context).add(FillFormEvent());
          },
        ),
        ListTile(
          title: const Text('Dashboard'),
          onTap: () {
            BlocProvider.of<SideBarBloc>(context).add(DashboardEvent());
          },
        ),
        const SizedBox(
          height: 400,
        ),
        ListTile(
          title: const Text('Help'),
          onTap: () {
          },
        ),
        ListTile(
          title: const Text('LogOut'),
          onTap: () {
          },
        ),
      ],
    );;
  }
}
