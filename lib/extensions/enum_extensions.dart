import 'package:bmi_calculator/repositories/units_repository.dart';

extension UnitExtension on CurrentUnit {
  String currentUnitToString() {
    switch (this) {
      case CurrentUnit.metric:
        return "Metric";
      case CurrentUnit.imperial:
        return "Imperial";
    }
  }
}
