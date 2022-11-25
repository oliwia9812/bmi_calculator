import 'package:isar/isar.dart';

part 'bmi_result.g.dart';

@collection
class BmiResult {
  Id id;
  int? weight;
  double? height;
  double? bmiResult;
  DateTime? date;
  String? currentUnit;
  String? interpretation;

  BmiResult({
    this.id = Isar.autoIncrement,
    required this.weight,
    required this.height,
    required this.bmiResult,
    required this.date,
    required this.currentUnit,
    required this.interpretation,
  });
}
