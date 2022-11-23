class CalculationHelper {
  static String getInterpretation(double result) {
    if (result < 16.0) {
      return "Very severly underweight";
    } else if (result >= 16.0 && result < 16.9) {
      return "Severly Underweight";
    } else if (result >= 16.9 && result < 18.5) {
      return "Underweight";
    } else if (result >= 18.5 && result < 24.9) {
      return "Normal weight";
    } else if (result >= 24.9 && result < 29.9) {
      return "Overweight";
    } else if (result >= 29.9 && result < 34.9) {
      return "Obese class I";
    } else if (result >= 34.9 && result < 39.9) {
      return "Obese class II";
    } else if (result >= 39.0) {
      return "Obese class III";
    }
    return "";
  }
}
