import 'package:bmi_calculator/models/bmi_result.dart';
import 'package:isar/isar.dart';

class DatabaseRepository {
  final Isar _isar;

  DatabaseRepository({required Isar isar}) : _isar = isar;

  void saveResult(BmiResult bmiResult) async {
    await _isar.writeTxn(() => _isar.bmiResults.put(bmiResult));
  }
}
