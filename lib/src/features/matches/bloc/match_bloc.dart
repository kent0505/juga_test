import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/prefs.dart';
import '../../../core/models/match_model.dart';
import '../../../core/utils.dart';
import '../api/match_api.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final matchApi = MatchApi();

  MatchBloc() : super(MatchInitial()) {
    on<GetMatchesEvent>((event, emit) async {
      emit(MatchLoadingState());

      final now = DateTime.now();
      // final datetime = DateTime(now.year, now.month, now.day - 1);
      // final date = DateFormat('yyyy-MM-dd').format(datetime);

      if (lastLoadDay == now.day) {
        logger('LOADING FROM JSON');
        Result result = await matchApi.getJson(jsonData);
        if (result is JsonResult) {
          emit(MatchesLoadedState(matches: result.matches));
        } else {
          emit(MatchErrorState());
        }
      } else {
        logger('LOADING FROM API');
        Result result = await matchApi.getMatches();
        if (result is SuccessResult) {
          await saveLoad(now.day, result.jsonData);
          emit(MatchesLoadedState(matches: result.matches));
        } else {
          emit(MatchErrorState());
        }
      }
    });
  }
}
