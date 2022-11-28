import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/models/bmi_result.dart';
import 'package:bmi_calculator/repositories/database_repository.dart';
import 'package:equatable/equatable.dart';

part 'bmi_results_event.dart';
part 'bmi_results_state.dart';

enum SortBy { dateDesc, dateAsc, bmiResultDesc, bmiResultAsc }

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
      late List<BmiResult> results;

      if (event.sortBy == SortBy.dateAsc) {
        results = await _databaseRepository.getBmiResultsByDateAscending();
      } else if (event.sortBy == SortBy.dateDesc) {
        results = await _databaseRepository.getBmiResults();
      } else if (event.sortBy == SortBy.bmiResultAsc) {
        results = await _databaseRepository.getBmiResultsByBmiResultAscending();
      } else if (event.sortBy == SortBy.bmiResultDesc) {
        results =
            await _databaseRepository.getBmiResultsByBmiResultDescending();
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
