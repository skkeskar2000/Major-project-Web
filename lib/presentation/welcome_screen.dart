import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:major_project/constant/route.dart';

import '../constant/constant.dart';
import '../widget/reused_button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
      body: _body(context),
    );
  }

  Center _body(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 700,
        height: 250,
        child: Card(
          color: Colors.white60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Welcome to EmployeeAnalysis!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const Text(
                "This is the voice chat application. You can create Open, Public or Private rooms for voice cummunication on any topic. It's usefull for students, teachers, bussiness for communication in group.",
                textAlign: TextAlign.center,
              ),
              ReusedButtonWidget(onTap: () {
                context.go('/login');
               }, text: "Next ->",),
            ],
          ),
        ),
      ),
    );
  }
}


