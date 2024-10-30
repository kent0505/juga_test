import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/statistics.dart';
import '../../api/match_api.dart';

part 'statistics_event.dart';
part 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  final _matchApi = MatchApi();

  StatisticsBloc() : super(StatisticsInitial()) {
    on<StatisticsEvent>(
      (event, emit) => switch (event) {
        GetStatisticsEvent() => _getStatistics(event, emit),
      },
    );
  }

  Future<void> _getStatistics(
    GetStatisticsEvent event,
    Emitter<StatisticsState> emit,
  ) async {
    emit(StatisticsLoading());
    try {
      Statistics statistics = await _matchApi.fetchStatistics(event.id);
      emit(StatisticsLoaded(statistics: statistics));
    } on Object catch (_) {
      emit(StatisticsFailed());
    }
  }
}
