import 'package:bmi_calculator/models/bmi_result.dart';
import 'package:isar/isar.dart';

class DatabaseRepository {
  final Isar _isar;

  DatabaseRepository({required Isar isar}) : _isar = isar;

  Future<void> saveResult(BmiResult bmiResult) async {
    await _isar.writeTxn(() => _isar.bmiResults.put(bmiResult));
  }

  Future<List<BmiResult>> getBmiResults() async {
    List<BmiResult> resultsList =
        await _isar.bmiResults.where().sortByDateDesc().findAll();
    return resultsList;
  }
}
