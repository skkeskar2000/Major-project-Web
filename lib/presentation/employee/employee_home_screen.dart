import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project/bloc/employee_bloc/employee_form_bloc/employee_form_bloc.dart';
import 'package:major_project/data/login_data.dart';
import 'package:major_project/presentation/employee/widget/dashboard_widget.dart';
import 'package:major_project/presentation/employee/widget/fillForm_widget.dart';
import 'package:major_project/presentation/employee/widget/home_widget.dart';
import 'package:major_project/presentation/employee/widget/sideBar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bloc/employee_bloc/sideBar_bloc/side_bar_bloc.dart';
import '../../bloc/employee_bloc/sideBar_bloc/side_bar_state.dart';
import '../../constant/constant.dart';

class EmployeeHomeScreen extends StatefulWidget {
  const EmployeeHomeScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeHomeScreen> createState() => _EmployeeHomeScreenState();
}

class _EmployeeHomeScreenState extends State<EmployeeHomeScreen> {
  int index = 1;
  String id = '';
  String name = '';
  bool sideBarIsExpanded = true;

  void changeBody(value) {
    setState(() {
      index = value;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id')!;
    name = prefs.getString('name')!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            setState((){
              sideBarIsExpanded = !sideBarIsExpanded;
            });
          },
        ),
        title: Text(
          "EmployeeAnalysis",
          style: kHeadingTextStyle,
        ),
      ),
      body: Row(
        children: [
          sideBarIsExpanded
              ? Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration:
                        BoxDecoration(color: kPrimaryColour, boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ]),
                    child: const SideBarWidget(),
                    // color: Colors.teal,
                  ),
                )
              : Container(),
          Expanded(
            flex: 5,
            child: BlocBuilder<SideBarBloc, SideBarState>(
                builder: (context, state) {
              if (state is DashboardState) {
                return BlocProvider(
                  create: (context) => EmployeeFormBloc(),
                  child: EmployeeDashboardWidget(
                    userId: id,
                    name: name,
                  ),
                );
              } else if (state is FillFormState) {
                return BlocProvider(
                  create: (context) => EmployeeFormBloc(),
                  child: FillFormWidget(
                    name: name,
                    id: id,
                  ),
                );
              } else {
                return const HomeWidget();
              }
            }),
          ),
        ],
      ),
    );
  }
}
