import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

enum InputType { height, weight }

enum Gender { male, female }

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitial()) {
    on<GetBmiResult>(_onGetBmiResult);
    on<ResetInput>(_onResetInput);
  }

  double? weight;
  double? height;
  double? result;

  void _onGetBmiResult(GetBmiResult event, Emitter<CalculatorState> emit) {
    event.weight != null ? weight = event.weight : null;
    event.height != null ? height = event.height : null;

    if (weight != null && height != null) {
      result = (weight! / pow((height! / 100), 2));
      emit(CalculatorLoaded(
          result: result, intepretation: _getInterpretation()));
    } else {
      emit(const CalculatorLoaded(result: null));
    }
  }

  void _onResetInput(ResetInput event, Emitter<CalculatorState> emit) {
    if (event.inputType == InputType.height) height = null;
    if (event.inputType == InputType.weight) weight = null;

    emit(const CalculatorLoaded(result: null));
  }

  String _getInterpretation() {
    if (result! < 16.0) {
      return "Very severly underweight";
    } else if (result! >= 16.0 && result! < 16.9) {
      return "Severly Underweight";
    } else if (result! >= 16.9 && result! < 18.5) {
      return "Underweight";
    } else if (result! >= 18.5 && result! < 24.9) {
      return "Normal weight";
    } else if (result! >= 24.9 && result! < 29.9) {
      return "Overweight";
    } else if (result! >= 29.9 && result! < 34.9) {
      return "Obese class I";
    } else if (result! >= 34.9 && result! < 39.9) {
      return "Obese class II";
    } else if (result! >= 39.0) {
      return "Obese class III";
    }
    return "";
  }
}
