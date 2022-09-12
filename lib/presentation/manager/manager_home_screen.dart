import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project/bloc/manager_bloc/list_widget_bloc/list_widget_bloc.dart';
import 'package:major_project/bloc/manager_bloc/manage_side_bar_bloc/manager_side_bar_bloc.dart';
import 'package:major_project/bloc/manager_bloc/manage_side_bar_bloc/manager_side_bar_state.dart';
import 'package:major_project/bloc/manager_bloc/manager_analysis_bloc/manager_analysis_bloc.dart';
import 'package:major_project/presentation/manager/widget/manager_analysis_widget.dart';
import 'package:major_project/presentation/manager/widget/manager_dashboard_widget.dart';
import 'package:major_project/presentation/manager/widget/manager_employee_list_widget.dart';
import 'package:major_project/presentation/manager/widget/manager_fillform_widget.dart';
import 'package:major_project/presentation/manager/widget/manager_manger_list_widget.dart';
import 'package:major_project/presentation/manager/widget/manager_sidebar_widget.dart';
import '../../constant/constant.dart';

class ManagerHomeScreen extends StatefulWidget {
  const ManagerHomeScreen({Key? key}) : super(key: key);

  @override
  State<ManagerHomeScreen> createState() => _ManagerHomeScreenState();
}

class _ManagerHomeScreenState extends State<ManagerHomeScreen> {
  int index = 1;
  void changeBody(value){
    setState((){
      index = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "EmployeeAnalysis",
          style: kHeadingTextStyle,
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: kPrimaryColour,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ]
              ),
              child: const ManagerSideBarWidget(),
              // color: Colors.teal,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: const Color(0xFFEFEFEF),
              child: BlocBuilder<ManagerSideBarBloc,ManagerSideBarState>(
                  builder: (context,state) {
                    if(state is ManagerDashboardState){
                      return const ManagerDashboardWidget();
                    }
                    else if(state is ManagerListState){
                      print(state);
                      return  BlocProvider(
                        create: (context) => ListWidgetBloc(),
                        child: ManagerManagerListWidget(),
                      );
                    }
                    else if(state is ManagerEmployeeListState){
                      return  BlocProvider(
                        create: (context)=> ListWidgetBloc(),
                        child: ManagerEmployeeListWidget(),
                      );
                    }
                    else if(state is ManagerFillFormState){
                      return const ManagerFillFormWidget();
                    }
                    else if(state is ManagerAnalysisState){
                      return BlocProvider(
                          create: (context) => ManagerAnalysisBloc(),
                        child: const ManagerAnalysisWidget(),
                      );
                    }
                    else if(state is ManagerCreateFormState){
                      return const Text('Create Form');
                    }
                    else{
                      return const Text('Home Page');
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
