import 'package:bmi/constants/const.dart';
import 'package:bmi/view/bmi_splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BMI App',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: primaryColor,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: primaryColor),
            titleTextStyle: TextStyle(
              color: primaryColor,
            ),
            backgroundColor: Colors.blue,
          ),
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen());
  }
}
