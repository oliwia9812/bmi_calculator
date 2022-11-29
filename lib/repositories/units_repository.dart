import 'dart:math';

abstract class UnitSystem {
  static const int inchesInFoot = 12;

  String getBmiResult();
}

class Imperial extends UnitSystem {
  final int? feet;
  final double? inches;
  final int? lbs;

  Imperial({this.feet, this.inches, this.lbs});

  @override
  String getBmiResult() {
    double totalHeight = (feet! * UnitSystem.inchesInFoot) + inches!;
    double result = 703 * (lbs! / (totalHeight * totalHeight));
    return result.toStringAsFixed(2);
  }
}

class Metric extends UnitSystem {
  final int? height;
  final int? weight;

  Metric({this.height, this.weight});

  @override
  String getBmiResult() {
    double result = (weight! / pow((height! / 100), 2));
    return result.toStringAsFixed(2);
  }
}

enum CurrentUnit { metric, imperial }
