import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/models/bmi_result.dart';
import 'package:bmi_calculator/repositories/database_repository.dart';
import 'package:bmi_calculator/repositories/units_repository.dart';
import 'package:bmi_calculator/utils/calculation_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:bmi_calculator/extensions/enum_extensions.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

enum InputType { height, weight, feet, inches, lbs }

enum Gender { male, female }

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final DatabaseRepository _databaseRepository;
  CalculatorBloc({required DatabaseRepository databaseRepository})
      : _databaseRepository = databaseRepository,
        super(CalculatorInitial()) {
    on<UpdateMetricEvent>(_handleUpdateMetric);
    on<SwitchCurrentUnit>(_handleSwitchCurrentUnit);
    on<UpdateImperialEvent>(_handleUpdateImperial);
    on<ResetInputEvent>(_handleResetInput);
    on<ResetEvent>(_handleReset);
    on<SaveBmiResultEvent>(_handleSaveBmiResult);
    on<SetGenderEvent>(_handleSetGender);
    on<UpdateAgeEvent>(_handleUpdateAge);
  }

  CurrentUnit? _currentUnit;
  int _age = Constants.initialAge;
  Gender? _gender;
  int? _weight;
  int? _height;
  int? _feet;
  double? _inches;
  int? _lbs;
  String? _result;
  String? _interpretation;
  bool saveBmiResultButtonIsEnable = false;

  void _handleSwitchCurrentUnit(
      SwitchCurrentUnit event, Emitter<CalculatorState> emit) {
    _currentUnit = event.currentUnit;

    emit(CalculatorLoaded(
      result: null,
      currentUnit: _currentUnit,
    ));
  }

  void _handleUpdateMetric(
      UpdateMetricEvent event, Emitter<CalculatorState> emit) {
    setPropertiesMetric(event);

    if (_height != null && _weight != null) {
      saveBmiResultButtonIsEnable = true;
      _result = Metric(height: _height, weight: _weight).getBmiResult();
      _interpretation =
          CalculationHelper.getInterpretation(double.parse(_result!));

      return emit(CalculatorLoaded(
        result: _result,
        currentUnit: _currentUnit,
        interpretation: _interpretation,
      ));
    }

    return emit(CalculatorLoaded(
      result: null,
      currentUnit: _currentUnit,
    ));
  }

  void _handleUpdateImperial(
      UpdateImperialEvent event, Emitter<CalculatorState> emit) {
    setPropertiesImperial(event);

    if (_feet != null && _inches != null && _lbs != null) {
      saveBmiResultButtonIsEnable = true;
      _result =
          Imperial(feet: _feet, inches: _inches, lbs: _lbs).getBmiResult();
      _interpretation =
          CalculationHelper.getInterpretation(double.parse(_result!));
      return emit(CalculatorLoaded(
        result: _result,
        currentUnit: _currentUnit,
        interpretation: _interpretation,
      ));
    }

    return emit(CalculatorLoaded(
      result: null,
      currentUnit: _currentUnit,
    ));
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
    saveBmiResultButtonIsEnable = false;

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

    emit(CalculatorLoaded(
      result: null,
      currentUnit: _currentUnit,
    ));
  }

  void _handleReset(ResetEvent event, Emitter<CalculatorState> emit) {
    _weight = null;
    _height = null;
    _feet = null;
    _inches = null;
    _lbs = null;
    _gender = null;
    _age = Constants.initialAge;
    _interpretation = null;
    _result = null;

    emit(AgeChanged(age: _age));
    emit(CalculatorInitial());
    return emit(const CalculatorLoaded(
      result: null,
      interpretation: null,
      currentUnit: CurrentUnit.metric,
    ));
  }

  void _handleSetGender(SetGenderEvent event, Emitter<CalculatorState> emit) {
    event.gender != null ? _gender = event.gender : null;
  }

  void _handleUpdateAge(UpdateAgeEvent event, Emitter<CalculatorState> emit) {
    if (event.isIncrement) {
      if (_age >= 105) return;
      _age++;
    } else {
      if (_age <= 1) return;
      _age--;
    }

    emit(AgeChanged(age: _age));
    emit(CalculatorLoaded(
      result: _result,
      interpretation: _interpretation,
      currentUnit: _currentUnit,
    ));
  }

  void _handleSaveBmiResult(
      SaveBmiResultEvent event, Emitter<CalculatorState> emit) {
    late double? imperialHeight;

    if (_currentUnit == CurrentUnit.imperial) {
      imperialHeight = double.parse("$_feet.${_inches!.toInt()}");
    }
    _databaseRepository.saveResult(
      BmiResult(
        bmiResult: double.parse(_result!),
        currentUnit: _currentUnit!.currentUnitToString(),
        date: DateTime.now(),
        height: _currentUnit == CurrentUnit.imperial
            ? imperialHeight
            : double.parse(_height.toString()),
        interpretation: _interpretation,
        weight: _currentUnit == CurrentUnit.imperial ? _lbs : _weight,
      ),
    );
  }
}
