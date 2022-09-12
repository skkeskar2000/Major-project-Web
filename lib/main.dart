import 'package:flutter/material.dart';
import 'package:major_project/constant/route.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: Routes.onGenerateRoute,
      // initialRoute: welcomeScreen,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      // home: ManagerDashboardWidget(),
    );
  }
}
