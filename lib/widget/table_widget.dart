import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project/bloc/manager_bloc/manage_side_bar_bloc/manager_side_bar_event.dart';
import 'package:major_project/bloc/manager_bloc/manager_analysis_bloc/manager_analysis_bloc.dart';
import 'package:major_project/bloc/manager_bloc/table_widget_bloc/table_widget_bloc.dart';
import 'package:major_project/model/form_entity.dart';

import '../bloc/manager_bloc/manager_analysis_bloc/manager_analysis_event.dart';
import '../bloc/manager_bloc/table_widget_bloc/table_widget_state.dart';
import '../data/form_data.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({Key? key, required this.allForm}) : super(key: key);

  final List<dynamic> allForm;

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      const SizedBox(
        height: 20,
      ),
      const Center(
        child: Text(
          'Analysis',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(
        height: 40,
      ),
      Row(
        children: const [
          Expanded(
            flex: 1,
            child: Text(
              'SrNo',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'ID',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Name',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Status',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Update',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      const Divider(
        color: Colors.black12,
      ),
      ListView.builder(
          shrinkWrap: true,
          itemCount: allForm.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          index.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          allForm[index]['_id'],
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          allForm[index]['userName'],
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: allForm[index]['isVerified']
                            ? const Text(
                                'Verified',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.green),
                              )
                            : const Text(
                                'Pending',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.red),
                              ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            if (allForm[index]['isVerified']) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('User All Ready Verified'),
                                ),
                              );
                            } else {
                              FormEntity formData = FormEntity(
                                  jobKnowledge: allForm[index]['jobKnowledge'],
                                  problemSolvingAbility: allForm[index]
                                      ['problemSolvingAbility'],
                                  productivity: allForm[index]['productivity'],
                                  communicationSkill: allForm[index]
                                      ['communicationSkill'],
                                  leadership: allForm[index]['leadership'],
                                  creativity: allForm[index]['creativity'],
                                  achievements: allForm[index]['achievements'],
                                  projects: allForm[index]['projects'],
                                  userId: allForm[index]['userId'],
                                  userName: allForm[index]['userName'],
                                  isVerified: true);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    _buildPopupDialog(
                                  context,
                                  allForm[index]['_id'],
                                  formData,
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                ],
              ),
            );
          }),
    ]);
  }

  Widget _buildPopupDialog(
      BuildContext context, String formId, FormEntity formData) {
    return AlertDialog(
      title: const Text('Records'),
      content: const ResultPageWidget(),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () async{
            if(await updateEmployeeForm(formData, formId)){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Submitted Successfully'),
                ),
              );
              Navigator.pop(context);
            }else{
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Something went wrong'),
                ),
              );
              BlocProvider.of<ManagerAnalysisBloc>(context).add(GetAllEmployeeAnalysisFormEvent());
              Navigator.pop(context);
            }
          },
          child: const Text('Verified'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (BuildContext context) =>
                  _buildUpdatePopupDialog(context),
            );
          },
          child: const Text('Update'),
        ),
      ],
    );
  }

  Widget _buildUpdatePopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Records'),
      content: const Text('Update'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}

class ResultPageWidget extends StatelessWidget {
  const ResultPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Score'),
              Text('100'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Score'),
              Text('100'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Score'),
              Text('100'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Score'),
              Text('100'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Score'),
              Text('100'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Score'),
              Text('100'),
            ],
          ),
        ),
      ],
    );
  }
}

Future<bool> updateEmployeeForm(FormEntity formData, String formId) async {
   if(await upDateForm(formData,formId,'employee')==200){
     print('200');
     return true;
   }
   else{
     return false;
   }
}
