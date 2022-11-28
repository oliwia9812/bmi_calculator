part of 'bmi_results_bloc.dart';

abstract class BmiResultsEvent extends Equatable {
  const BmiResultsEvent();
}

class GetBmiResultsEvent extends BmiResultsEvent {
  final bool? isSortByDateAscending;

  const GetBmiResultsEvent({this.isSortByDateAscending});

  @override
  List<Object> get props => [];
}

class DeleteBmiResultsEvent extends BmiResultsEvent {
  final int id;

  const DeleteBmiResultsEvent({required this.id});

  @override
  List<Object> get props => [id];
}
