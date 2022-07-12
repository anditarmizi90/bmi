import 'package:bmi/constants/const.dart';
import 'package:bmi/view/bmi_data_screen.dart';
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
          scaffoldBackgroundColor: primaryColor,
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme(
            backgroundColor: primaryColor,
          ),
          primarySwatch: Colors.blue,
        ),
        home: BmiDataScreen());
  }
}
