import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/db/prefs.dart';
import '../../../../core/models/match_model.dart';
import '../../../../core/utils.dart';
import '../../api/match_api.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final _matchApi = MatchApi();

  MatchBloc() : super(MatchInitial()) {
    on<MatchEvent>(
      (event, emit) => switch (event) {
        GetMatchesEvent() => _getMatches(event, emit),
      },
    );
  }

  Future<void> _getMatches(
    GetMatchesEvent event,
    Emitter<MatchState> emit,
  ) async {
    emit(MatchLoading());
    if (lastLoadDay == DateTime.now().day) {
      logger('LOADING FROM JSON');
      try {
        List<MatchModel> matches = await _matchApi.getJson(jsonData);
        emit(MatchesLoaded(matches: matches));
      } on Object catch (_) {
        emit(MatchFailed());
      }
    } else {
      logger('LOADING FROM API');
      try {
        List<MatchModel> matches = await _matchApi.getMatches();
        emit(MatchesLoaded(matches: matches));
      } on Object catch (_) {
        emit(MatchFailed());
      }
    }
  }
}
