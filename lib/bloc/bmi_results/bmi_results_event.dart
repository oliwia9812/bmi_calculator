part of 'bmi_results_bloc.dart';

abstract class BmiResultsEvent extends Equatable {
  const BmiResultsEvent();
}

class GetBmiResultsEvent extends BmiResultsEvent {
  final SortBy? sortBy;

  const GetBmiResultsEvent({this.sortBy});

  @override
  List<Object> get props => [];
}

class DeleteBmiResultsEvent extends BmiResultsEvent {
  final int id;

  const DeleteBmiResultsEvent({required this.id});

  @override
  List<Object> get props => [id];
}
