import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project/bloc/manager_bloc/manage_side_bar_bloc/manager_side_bar_bloc.dart';
import 'package:major_project/bloc/manager_bloc/manage_side_bar_bloc/manager_side_bar_event.dart';

class ManagerSideBarWidget extends StatelessWidget {
  const ManagerSideBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          title: const Text('Manager'),
          onTap: () {
            BlocProvider.of<ManagerSideBarBloc>(context)
                .add(ManagerListEvent());
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Employee'),
          onTap: () {
            BlocProvider.of<ManagerSideBarBloc>(context)
                .add(ManagerEmployeeListEvent());
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('FillForm'),
          onTap: () {
            BlocProvider.of<ManagerSideBarBloc>(context)
                .add(ManagerFillFormEvent());
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Dashboard'),
          onTap: () {
            BlocProvider.of<ManagerSideBarBloc>(context)
                .add(ManagerDashboardEvent());
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Analysis'),
          onTap: () {
            BlocProvider.of<ManagerSideBarBloc>(context)
                .add(ManagerAnalysisEvent());
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Create Form'),
          onTap: () {
            BlocProvider.of<ManagerSideBarBloc>(context)
                .add(ManagerCreateFormEvent());
          },
        ),
        const Divider(),
        const SizedBox(
          height: 150,
        ),
        ListTile(
          title: const Text('Help'),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          title: const Text('LogOut'),
          onTap: () {},
        ),
      ],
    );
  }
}
