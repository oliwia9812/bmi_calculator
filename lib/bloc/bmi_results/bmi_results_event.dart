part of 'bmi_results_bloc.dart';

abstract class BmiResultsEvent extends Equatable {
  const BmiResultsEvent();
}

class GetBmiResultsEvent extends BmiResultsEvent {
  @override
  List<Object> get props => [];
}
