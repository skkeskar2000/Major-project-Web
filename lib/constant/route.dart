
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:major_project/bloc/employee_bloc/sideBar_bloc/side_bar_bloc.dart';
import 'package:major_project/bloc/login_bloc/login_bloc.dart';
import 'package:major_project/presentation/employee/employee_home_screen.dart';
import 'package:major_project/presentation/login_screen.dart';
import 'package:major_project/presentation/manager/manager_home_screen.dart';
import 'package:major_project/presentation/welcome_screen.dart';
import '../bloc/manager_bloc/manage_side_bar_bloc/manager_side_bar_bloc.dart';

final GoRouter router =
    GoRouter(urlPathStrategy: UrlPathStrategy.path, routes: [
  GoRoute(
    path: '/',
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: WelcomeScreen(),
    ),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => BlocProvider(
      create: (context) => LoginBloc(),
      child: const LoginScreen(),
    ),
  ),
  GoRoute(
    path: '/managerHomeScreen',
    builder: (context, state) => BlocProvider(
      create: (context) => ManagerSideBarBloc(),
      child: const ManagerHomeScreen(),
    ),
  ),
  GoRoute(
    path: '/employeeHomeScreen',
    builder: (context, state) => BlocProvider(
      create: (context) => SideBarBloc(),
      child: const EmployeeHomeScreen(),
    ),
  ),
]);
