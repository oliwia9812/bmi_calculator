import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/repository/units_repository.dart';
import 'package:bmi_calculator/utils/calculation_helper.dart';
import 'package:equatable/equatable.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

enum InputType { height, weight, feet, inches, lbs }

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitial()) {
    on<UpdateMetricEvent>(_handleUpdateMetric);
    on<SwitchCurrentUnit>(_handleSwitchCurrentUnit);
    on<UpdateImperialEvent>(_handleUpdateImperial);
    on<ResetInputEvent>(_handleResetInput);
    on<ResetEvent>(_handleReset);
  }

  CurrentUnit? _currentUnit;
  int? _weight;
  int? _height;
  int? _feet;
  double? _inches;
  double? _lbs;
  String? result;
  String? interpretation;

  void _handleSwitchCurrentUnit(
      SwitchCurrentUnit event, Emitter<CalculatorState> emit) {
    _currentUnit = event.currentUnit;

    emit(CalculatorLoaded(result: null, currentUnit: _currentUnit));
  }

  void _handleUpdateMetric(
      UpdateMetricEvent event, Emitter<CalculatorState> emit) {
    setPropertiesMetric(event);

    if (_height != null && _weight != null) {
      result = Metric(height: _height, weight: _weight).getBmiResult();
      interpretation =
          CalculationHelper.getInterpretation(double.parse(result!));

      return emit(CalculatorLoaded(
        result: result,
        currentUnit: _currentUnit,
        interpretation: interpretation,
      ));
    }

    return emit(CalculatorLoaded(result: null, currentUnit: _currentUnit));
  }

  void _handleUpdateImperial(
      UpdateImperialEvent event, Emitter<CalculatorState> emit) {
    setPropertiesImperial(event);

    if (_feet != null && _inches != null && _lbs != null) {
      result = Imperial(feet: _feet, inches: _inches, lbs: _lbs).getBmiResult();
      interpretation =
          CalculationHelper.getInterpretation(double.parse(result!));
      return emit(CalculatorLoaded(
          result: result,
          currentUnit: _currentUnit,
          interpretation: interpretation));
    }

    return emit(CalculatorLoaded(result: null, currentUnit: _currentUnit));
  }

  void setPropertiesMetric(UpdateMetricEvent event) {
    event.height != null ? _height = event.height : null;
    event.weight != null ? _weight = event.weight : null;
  }

  void setPropertiesImperial(UpdateImperialEvent event) {
    event.feet != null ? _feet = event.feet : null;
    event.inches != null ? _inches = event.inches : null;
    event.lbs != null ? _lbs = event.lbs : null;
  }

  void _handleResetInput(ResetInputEvent event, Emitter<CalculatorState> emit) {
    switch (event.inputType) {
      case InputType.height:
        _height = null;
        break;
      case InputType.weight:
        _weight = null;
        break;
      case InputType.feet:
        _feet = null;
        break;
      case InputType.inches:
        _inches = null;
        break;
      case InputType.lbs:
        _lbs = null;
        break;
    }

    emit(CalculatorLoaded(result: null, currentUnit: _currentUnit));
  }

  void _handleReset(ResetEvent event, Emitter<CalculatorState> emit) {
    _weight = null;
    _height = null;
    _feet = null;
    _inches = null;
    _lbs = null;

    emit(CalculatorInitial());
    return emit(const CalculatorLoaded(
      result: null,
      interpretation: null,
      currentUnit: CurrentUnit.metric,
    ));
  }
}
