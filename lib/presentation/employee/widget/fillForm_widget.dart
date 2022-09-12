import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project/bloc/employee_bloc/employee_form_bloc/employee_form_bloc.dart';
import 'package:major_project/bloc/employee_bloc/employee_form_bloc/employee_form_state.dart';
import 'package:major_project/widget/dropdown_button_widget.dart';
import 'package:major_project/widget/reused_button_widget.dart';

import '../../../bloc/employee_bloc/employee_form_bloc/employee_form_event.dart';


class FillFormWidget extends StatelessWidget {
  FillFormWidget({Key? key, required this.id, required this.name})
      : super(key: key);

  final String id;
  final String name;
  String role = 'employee';
  List<String> items = ['1', '2', '3', '4', '5'];

  String formOneQuestion = "";
  String formTwoQuestion = "";
  String formThreeQuestion = "";
  String formFourQuestion = "";
  String formFiveQuestion = "";
  String formSixQuestion = "";
  String formSevenQuestion = "";
  String formEightQuestion = "";


  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EmployeeFormBloc>(context).add(CheckFormFilledEvent(userId: id));
    return BlocBuilder<EmployeeFormBloc, EmployeeFormState>(
      builder: (context, state) {
        if (state is EmployeeFormInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AllReadyFormFilledState) {
          return const Center(
            child: Text(
              'Form All Ready Filled',
              style: TextStyle(color: Colors.black),
            ),
          );
        } else if (state is FormNotFilledState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropDownButtonWidget(
                    items: items,
                    onChanged: (value) {
                      formOneQuestion = value;
                    },
                    questionTitle: 'Job knowledge',
                  ),
                  DropDownButtonWidget(
                    items: items,
                    onChanged: (value) {
                      formTwoQuestion = value;
                    },
                    questionTitle: 'Problem Solving Ability',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropDownButtonWidget(
                    items: items,
                    onChanged: (value) {
                      formThreeQuestion = value;
                    },
                    questionTitle: 'Productivity',
                  ),
                  DropDownButtonWidget(
                    items: items,
                    onChanged: (value) {
                      formFourQuestion = value;
                    },
                    questionTitle: 'Communication Skill',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropDownButtonWidget(
                    items: items,
                    onChanged: (value) {
                      formFiveQuestion = value;
                    },
                    questionTitle: 'Leadership',
                  ),
                  DropDownButtonWidget(
                    items: items,
                    onChanged: (value) {
                      formSixQuestion = value;
                    },
                    questionTitle: 'Creativity',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropDownButtonWidget(
                    items: items,
                    onChanged: (value) {
                      formSevenQuestion = value;
                    },
                    questionTitle: 'Achievement',
                  ),
                  DropDownButtonWidget(
                    items: items,
                    onChanged: (value) {
                      formEightQuestion = value;
                    },
                    questionTitle: 'Project',
                  ),
                ],
              ),
              BlocBuilder<EmployeeFormBloc,EmployeeFormState>(builder: (context,state){
                if(state is FillAllFieldState){
                  return Text(state.message,style: const TextStyle(color: Colors.red),);
                }
                else{
                  return Container();
                }
              }),
              ReusedButtonWidget(
                  onTap: () {
                    BlocProvider.of<EmployeeFormBloc>(context).add(
                        SubmitButtonEvent(
                          formOneQuestion: int.parse(formOneQuestion),
                          formTwoQuestion: int.parse(formTwoQuestion),
                          formThreeQuestion: int.parse(formThreeQuestion),
                          formFourQuestion: int.parse(formFourQuestion),
                          formFiveQuestion: int.parse(formFiveQuestion),
                          formSixQuestion: int.parse(formSixQuestion),
                          formSevenQuestion: int.parse(formSevenQuestion),
                          formEightQuestion: int.parse(formEightQuestion),
                          name: name,
                          userId: id,
                          role: role,
                        ),
                    );
                  },
                  text: 'Submit'),
            ],
          );
        }
        else if(state is SuccessfulSubmittedFormState){
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }
        else if(state is ErrorSubmitFormState){
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }
        else {
          return const Center(
            child: Text(
              'Some Thing Went wrong',
              style: TextStyle(color: Colors.black),
            ),
          );
        }
      },
    );
  }
}
