import 'dart:math';

abstract class MetricSystem {
  static const int inchesInFoot = 12;

  String getBmiResult();
}

class Imperial extends MetricSystem {
  final int? feet;
  final double? inches;
  final double? lbs;

  Imperial({this.feet, this.inches, this.lbs});

  @override
  String getBmiResult() {
    double totalHeight = (feet! * MetricSystem.inchesInFoot) + inches!;
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
