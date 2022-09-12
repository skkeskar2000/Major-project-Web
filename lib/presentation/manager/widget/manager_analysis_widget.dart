import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project/bloc/manager_bloc/manager_analysis_bloc/manager_analysis_event.dart';
import 'package:major_project/bloc/manager_bloc/table_widget_bloc/table_widget_bloc.dart';
import 'package:major_project/widget/table_widget.dart';

import '../../../bloc/manager_bloc/manager_analysis_bloc/manager_analysis_bloc.dart';
import '../../../bloc/manager_bloc/manager_analysis_bloc/manager_analysis_state.dart';

class ManagerAnalysisWidget extends StatelessWidget {
  const ManagerAnalysisWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagerAnalysisBloc, ManagerAnalysisState>(
      builder: (context, state) {
        if (state is ManagerAnalysisInitialState) {
          BlocProvider.of<ManagerAnalysisBloc>(context).add(
              GetAllEmployeeAnalysisFormEvent());
          return const Center(child: CircularProgressIndicator());
        }
        else if (state is GetAllEmployeeFormState) {
          return BlocProvider(
            create: (context) => TableWidgetBloc(),
            child: TableWidget(allForm: state.allEmployeeForms,),
          );
        }
        else {
          return const Center(child: Text('Unable to get form'),);
        }
      },
    );
  }
}
