import 'package:flutter/material.dart';
import '../constant/constant.dart';
import '../data/login_data.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heght = MediaQuery.of(context).size.height;

    String email = '';
    String password = '';
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          height: 300,
          child: Card(
            color: Colors.white60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Log In"),
                  TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Your Email',
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Your Password',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _logIn(context, email, password);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: kPrimaryTextColour,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "LogIn",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _logIn(BuildContext context, String email, String password) {
    logInUser(email, password, context,);
  }
}
