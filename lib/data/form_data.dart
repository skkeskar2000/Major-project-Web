import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:major_project/bloc/employee_bloc/employee_form_bloc/employee_form_state.dart';
import 'package:major_project/model/form_entity.dart';

import '../bloc/employee_bloc/employee_form_bloc/employee_form_event.dart';
import '../bloc/manager_bloc/manager_analysis_bloc/manager_analysis_state.dart';

Future<void> saveForm(event, Emitter<EmployeeFormState> emit) async {
  emit(EmployeeFormInitialState());
  try {
    var data = jsonEncode({
      'jobKnowledge': event.formOneQuestion,
      'problemSolvingAbility': event.formTwoQuestion,
      'productivity': event.formThreeQuestion,
      'communicationSkill': event.formFourQuestion,
      'leadership': event.formFiveQuestion,
      'creativity': event.formSixQuestion,
      'achievements': event.formSevenQuestion,
      'projects': event.formEightQuestion,
      'userId': event.userId,
      'userName': event.name,
      'role': event.role,
      'isVerified': false,
    });

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '<Your token>',
    };
    var url = Uri.parse('http://localhost:5000/form/saveform');

    var response = await http.post(url, headers: headers, body: data);
    print(response.statusCode);

    if (response.statusCode == 200) {
      emit(SuccessfulSubmittedFormState(message: "Saved Successful"));
    } else if (response.statusCode == 401) {
      emit(FillAllFieldState(message: 'please fill all fields'));
    } else {
      emit(ErrorSubmitFormState(message: "Unable to submit form"));
    }
  } catch (error) {
    print(error);
    emit(ErrorSubmitFormState(message: "Unable to submit form"));
  }
}

Future<void> getForm(event, Emitter<EmployeeFormState> emit) async {

  emit(EmployeeFormInitialState());

  try {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '<Your token>',
    };

    var url =
        Uri.parse('http://localhost:5000/form/getform?userId=${event.userId}&isDisplay=${event.isDisplay}');

    final response = await http.get(url, headers: headers);
    var data = jsonDecode(response.body);

    if (response.statusCode == 400) {
      emit(FormNotFilledState());
    } else if (response.statusCode == 200) {
      if (event is CheckFormFilledEvent) {
        emit(AllReadyFormFilledState());
      } else {
        FormEntity formData = FormEntity(
          jobKnowledge: data['jobKnowledge'],
          problemSolvingAbility: data['problemSolvingAbility'],
          productivity: data['productivity'],
          communicationSkill: data['communicationSkill'],
          leadership: data['leadership'],
          creativity: data['creativity'],
          achievements: data['achievements'],
          projects: data['projects'],
          userId: data['userId'],
          userName: data['userName'],
          isVerified: data['isVerified'],
        );
        if(formData.isVerified){
          emit(GetFormDataState(formData: formData));
        }
        else{
          emit(FormNotVerifiedState());
        }
      }
    } else {
      emit(FailureState());
    }
  } catch (error) {
    emit(FailureState());
    print(error);
  }
}

Future<void> getAllForm(event,Emitter<ManagerAnalysisState> emit) async {
    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '<Your token>',
      };

      var url =
      Uri.parse('http://localhost:5000/form/getallform?role=employee');

      final response = await http.get(url, headers: headers);
      var formData = jsonDecode(response.body) as List;

      if (response.statusCode == 400) {
        emit(FailureAnalysisState());
      }
      else if (response.statusCode == 200) {
        emit(GetAllEmployeeFormState(allEmployeeForms: formData));
      } else {
        emit(FailureAnalysisState());
      }

  }catch(error){
    emit(FailureAnalysisState());
  }
}

Future<int> upDateForm(FormEntity formData,String formId,String role)async{
  try{
    var data = jsonEncode({
      'formId' : formId,
      'jobKnowledge': formData.jobKnowledge,
      'problemSolvingAbility': formData.problemSolvingAbility,
      'productivity': formData.productivity,
      'communicationSkill': formData.communicationSkill,
      'leadership': formData.leadership,
      'creativity': formData.creativity,
      'achievements': formData.achievements,
      'projects': formData.projects,
      'userId': formData.userId,
      'userName': formData.userName,
      'role': role,
      'isVerified': formData.isVerified,
    });

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '<Your token>',
    };
    var url = Uri.parse('http://localhost:5000/form/updateform');

    var response = await http.post(url, headers: headers, body: data);

    // print(response.statusCode);

    return response.statusCode;

  }catch(error){
    print(error);
    return 404;
  }
}