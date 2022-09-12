import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:major_project/model/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/manager_bloc/list_widget_bloc/list_widget_state.dart';

Future<dynamic> logInUser(String email, String password, BuildContext context) async {
  try {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '<Your token>',
    };

    var url = Uri.parse(
        'http://localhost:5000/auth/login?email=$email&password=$password');

    final response = await http.get(url, headers: headers);

    var data = jsonDecode(response.body);


    if(response.statusCode == 200){
      UserEntity userData = UserEntity(
        email: data["email"],
        id: data["_id"],
        role: data['role'],
        name: data['name'],
      );
      // Obtain shared preferences.
      saveData(userData.id, userData.email, userData.name, userData.role);

      gotoSeparateScreen(context,userData);
      print('login successful');
    }else{
      print(data['message']);
      ScaffoldMessenger.of(context)
          .showSnackBar(
           SnackBar(content: Text(data['message'])));
    }

  } catch (error) {
    print(error);
    return 'server side error';
  }
}

void gotoSeparateScreen(BuildContext context,UserEntity userData){
  if(userData.role == "employee"){
    print(userData.role);
    context.go('/employeeHomeScreen');
  }
  else if(userData.role == "manager"){
    print(userData.role);
    context.go('/managerHomeScreen');
  }
  else{
    print("else");
  }
}


void saveData(String id,String email, String name, String role)async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('id', id);
  await prefs.setString('email', email);
  await prefs.setString('role', role);
  await prefs.setString('name', name);
  print("data saved successful");
}


Future<void>addNewUser(event, Emitter<ListWidgetState> emit)async{

  try{
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '<Your token>',
    };


    var data = jsonEncode({
      'email' : event.email,
      'password' : event.password,
      'role' : event.role,
      'name' : event.name
    });

    var url = Uri.parse('http://localhost:5000/auth/register');

    var response = await http.post(url, headers: headers, body: data);

    print('save data');
    print(response.statusCode);

    if(response.statusCode == 200){
      emit(SuccessfullyAddedEmployee());
    }
    else{
      emit(UnableToAddEmployee());
    }

  }catch(error){
    print(error);
  }
}

Future<void>getSelectedUser(event,Emitter<ListWidgetState>emit)async{
  try{

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '<Your token>',
    };

    var url = Uri.parse(
        'http://localhost:5000/auth/selecteduser?role=${event.role}');

    final response = await http.get(url, headers: headers);

    var user = jsonDecode(response.body);


    if(response.statusCode==200){
      emit(GetSelectedUsers(user: user as List));
    }
    else{
      emit(UnableToGetUsers());
    }

  }catch(error){
    print(error);
    emit(UnableToGetUsers());
  }
}