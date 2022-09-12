import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project/bloc/employee_bloc/employee_form_bloc/employee_form_bloc.dart';
import 'package:major_project/bloc/employee_bloc/employee_form_bloc/employee_form_event.dart';
import 'package:major_project/bloc/employee_bloc/employee_form_bloc/employee_form_state.dart';
import 'package:major_project/widget/bar_chart_widget.dart';
import 'package:major_project/widget/pie_chart_widget.dart';

class EmployeeDashboardWidget extends StatelessWidget {
  const EmployeeDashboardWidget(
      {Key? key, required this.userId, required this.name})
      : super(key: key);
  final String userId;
  final String name;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EmployeeFormBloc>(context)
        .add(GetFormEvent(userId: userId));
    return Scaffold(
      body: BlocBuilder<EmployeeFormBloc, EmployeeFormState>(
          builder: (context, state) {
        if (state is EmployeeFormInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(state is FormNotVerifiedState) {
          return const Center(child: Text('Verifying your report'));
        }
        else if (state is GetFormDataState) {
          var total = state.formData.problemSolvingAbility +
              state.formData.productivity +
              state.formData.communicationSkill +
              state.formData.leadership +
              state.formData.creativity +
              state.formData.achievements +
              state.formData.jobKnowledge +
              state.formData.projects;

          var percent = (100*total)/40;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ]),
                  child: ListTile(
                    minLeadingWidth: 0,
                    leading: const Icon(Icons.person_pin),
                    title: Text(name),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 5),
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                ),
                              ]),
                          child: Column(
                            children: [
                              const Text(
                                'RESULT',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                color: Colors.black,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('jobKnowledge'),
                                    Text((state.formData.jobKnowledge * 2 * 10)
                                        .toString()),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Achievement'),
                                    Text((state.formData.achievements * 2 * 10)
                                        .toString()),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Creativity'),
                                    Text((state.formData.creativity * 2 * 10)
                                        .toString()),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Leadership'),
                                    Text((state.formData.leadership * 2 * 10)
                                        .toString()),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('CommunicationSkill'),
                                    Text((state.formData.communicationSkill *
                                            2 *
                                            10)
                                        .toString()),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Productivity'),
                                    Text((state.formData.productivity * 2 * 10)
                                        .toString()),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Productivity'),
                                    Text((state.formData.problemSolvingAbility *
                                            2 *
                                            10)
                                        .toString()),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.black,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Percentage',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '${percent.toString()} %',
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 320,
                              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Colors.black12),
                              ),
                              child: BarChartWidget(
                                formData: state.formData,
                              ),
                            ),
                            Container(
                              height: 280,
                              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Colors.black12),
                              ),
                              child: PieChartWidget(
                                formEntity: state.formData,
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ],
            ),
          );
        }
        else {
          return const Center(
            child: Text("Unable to fetch data"),
          );
        }
      }),
    );
  }
}
