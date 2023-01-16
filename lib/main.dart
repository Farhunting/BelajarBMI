import 'package:bmi_flutter_test/constant/constant.dart';
import 'package:bmi_flutter_test/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BMI_MFR',
        theme: ThemeData(
          primaryColor: primarycolor,
          scaffoldBackgroundColor: primarycolor,
          appBarTheme: const AppBarTheme(backgroundColor: primarycolor),
          primarySwatch: Colors.red,
        ),
        home: const bmi_data_screen());
  }
}
