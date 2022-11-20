import 'package:bmi_calculator/generated/fonts.gen.dart';
import 'package:bmi_calculator/screens/bmi_calculator/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: FontFamily.montserrat,
      ),
      home: const BmiCalculatorScreen(),
    );
  }
}
