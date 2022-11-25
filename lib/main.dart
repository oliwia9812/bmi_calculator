import 'package:bmi_calculator/app.dart';
import 'package:bmi_calculator/models/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Isar isar = await Isar.open([BmiResultSchema]);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App(
    isar: isar,
  ));

  FlutterNativeSplash.remove();
}
