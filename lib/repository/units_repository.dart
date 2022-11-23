import 'dart:math';

abstract class MetricSystem {
  static const double poundMultipier = 0.45359237;
  static const double inchesMultiplier = 2.54;

  String getBmiResult();
}

class Imperial extends MetricSystem {
  final int? feet;
  final double? inches;
  final double? lbs;

  Imperial({this.feet, this.inches, this.lbs});

  @override
  String getBmiResult() {
    int inchesInFoot = 12;

    double totalHeight = (feet! * inchesInFoot) + inches!;
    double result = 703 * (lbs! / (totalHeight * totalHeight));
    return result.toStringAsFixed(2);
  }
}

class Metric extends MetricSystem {
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
