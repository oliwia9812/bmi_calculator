part of 'bmi_results_bloc.dart';

abstract class BmiResultsState extends Equatable {
  const BmiResultsState();
}

class BmiResultsInitial extends BmiResultsState {
  @override
  List<Object> get props => [];
}

class BmiResultsLoading extends BmiResultsState {
  @override
  List<Object> get props => [];
}

class BmiResultsLoaded extends BmiResultsState {
  final List<BmiResult> results;

  const BmiResultsLoaded({required this.results});

  @override
  List<Object> get props => [results];
}

class BmiResultsFailed extends BmiResultsState {
  @override
  List<Object> get props => [];
}
