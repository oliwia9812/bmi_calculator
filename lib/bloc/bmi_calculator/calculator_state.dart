part of 'calculator_bloc.dart';

abstract class CalculatorState extends Equatable {
  const CalculatorState();
}

class CalculatorInitial extends CalculatorState {
  @override
  List<Object?> get props => [];
}

class CalculatorLoaded extends CalculatorState {
  final CurrentUnit? currentUnit;
  final String? result;
  final String? interpretation;

  const CalculatorLoaded({
    required this.result,
    this.currentUnit,
    this.interpretation,
  });

  @override
  List<Object?> get props => [currentUnit, result, interpretation];
}

class AgeChanged extends CalculatorState {
  final int age;

  const AgeChanged({required this.age});

  @override
  List<Object?> get props => [age];
}
