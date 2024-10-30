part of 'match_bloc.dart';

@immutable
sealed class MatchState {}

final class MatchInitial extends MatchState {}

class MatchLoadingState extends MatchState {}

class MatchesLoadedState extends MatchState {
  final List<MatchModel> matches;
  MatchesLoadedState({required this.matches});
}

class MatchErrorState extends MatchState {}
