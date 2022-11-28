import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/models/bmi_result.dart';
import 'package:bmi_calculator/repositories/database_repository.dart';
import 'package:equatable/equatable.dart';

part 'bmi_results_event.dart';
part 'bmi_results_state.dart';

class BmiResultsBloc extends Bloc<BmiResultsEvent, BmiResultsState> {
  final DatabaseRepository _databaseRepository;

  BmiResultsBloc({required DatabaseRepository databaseRepository})
      : _databaseRepository = databaseRepository,
        super(BmiResultsInitial()) {
    on<GetBmiResultsEvent>(_handleGetBmiResults);
    on<DeleteBmiResultsEvent>(_handleDeleteBmiResult);
  }

  Future<void> _handleGetBmiResults(
      GetBmiResultsEvent event, Emitter<BmiResultsState> emit) async {
    emit(BmiResultsLoading());

    try {
      List<BmiResult> results;
      if (event.isSortByDateAscending == true) {
        results = await _databaseRepository.getBmiResultsByDateAscending();
      } else {
        results = await _databaseRepository.getBmiResults();
      }

      return emit(BmiResultsLoaded(results: results));
    } catch (e) {
      return emit(BmiResultsFailed());
    }
  }

  Future<void> _handleDeleteBmiResult(
      DeleteBmiResultsEvent event, Emitter<BmiResultsState> emit) async {
    try {
      await _databaseRepository.deleteBmiResult(event.id);
      List<BmiResult> results = await _databaseRepository.getBmiResults();
      return emit(BmiResultsLoaded(results: results));
    } catch (e) {
      return emit(BmiResultsFailed());
    }
  }
}
