part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();
}

class GetBmiResult extends CalculatorEvent {
  final double? height;
  final double? weight;
  final int? age;
  final Gender? gender;

  const GetBmiResult({this.height, this.weight, this.age, this.gender});

  @override
  List<Object?> get props => [height, weight, age, gender];
}

class ResetInput extends CalculatorEvent {
  final InputType inputType;

  const ResetInput({required this.inputType});

  @override
  List<Object?> get props => [inputType];
}
