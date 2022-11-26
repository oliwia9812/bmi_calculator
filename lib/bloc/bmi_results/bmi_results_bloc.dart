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
  }

  Future _handleGetBmiResults(
      GetBmiResultsEvent event, Emitter<BmiResultsState> emit) async {
    emit(BmiResultsLoading());

    try {
      List<BmiResult> results = await _databaseRepository.getBmiResults();

      return emit(BmiResultsLoaded(results: results));
    } catch (e) {
      return emit(BmiResultsFailed());
    }
  }
}
