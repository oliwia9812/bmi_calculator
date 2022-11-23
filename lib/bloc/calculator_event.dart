part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();
}

class UpdateMetricEvent extends CalculatorEvent {
  final int? height;
  final int? weight;
  const UpdateMetricEvent({this.height, this.weight});

  @override
  List<Object?> get props => [height, weight];
}

class UpdateImperialEvent extends CalculatorEvent {
  final int? feet;
  final double? inches;
  final double? lbs;
  const UpdateImperialEvent({this.feet, this.inches, this.lbs});

  @override
  List<Object?> get props => [feet, inches, lbs];
}

class SwitchCurrentUnit extends CalculatorEvent {
  final CurrentUnit currentUnit;

  const SwitchCurrentUnit({required this.currentUnit});

  @override
  List<Object> get props => [currentUnit];
}

class ResetInputEvent extends CalculatorEvent {
  final InputType inputType;

  const ResetInputEvent({required this.inputType});

  @override
  List<Object?> get props => [inputType];
}

class ResetEvent extends CalculatorEvent {
  @override
  List<Object?> get props => [];
}
