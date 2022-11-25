import 'package:bmi_calculator/bloc/bmi_calculator/calculator_bloc.dart';
import 'package:bmi_calculator/generated/fonts.gen.dart';
import 'package:bmi_calculator/repositories/database_repository.dart';
import 'package:bmi_calculator/repositories/units_repository.dart';
import 'package:bmi_calculator/screens/bmi_calculator/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

class App extends StatelessWidget {
  final Isar isar;
  const App({required this.isar, super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DatabaseRepository(isar: isar),
      child: BlocProvider(
        create: (context) => CalculatorBloc(
            databaseRepository: context.read<DatabaseRepository>())
          ..add(
            const SwitchCurrentUnit(currentUnit: CurrentUnit.metric),
          ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: FontFamily.montserrat,
          ),
          home: const BmiCalculatorScreen(),
        ),
      ),
    );
  }
}
