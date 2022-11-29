import 'dart:math';

abstract class UnitSystem {
  String getBmiResult();
}

class Imperial implements UnitSystem {
  static const int inchesInFoot = 12;

  final int? feet;
  final double? inches;
  final int? lbs;

  Imperial({this.feet, this.inches, this.lbs});

  @override
  String getBmiResult() {
    double totalHeight = (feet! * inchesInFoot) + inches!;
    double result = 703 * (lbs! / (totalHeight * totalHeight));
    return result.toStringAsFixed(2);
  }
}

class Metric implements UnitSystem {
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
