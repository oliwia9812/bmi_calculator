part of 'calculator_bloc.dart';

abstract class CalculatorState extends Equatable {
  const CalculatorState();

  @override
  List<Object?> get props => [];
}

class CalculatorInitial extends CalculatorState {}

class CalculatorLoaded extends CalculatorState {
  final double? result;
  final String? intepretation;

  const CalculatorLoaded({required this.result, this.intepretation});

  @override
  List<Object?> get props => [result];
}
