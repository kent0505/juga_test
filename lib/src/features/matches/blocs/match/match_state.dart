part of 'match_bloc.dart';

@immutable
sealed class MatchState {}

final class MatchInitial extends MatchState {}

class MatchLoading extends MatchState {}

class MatchesLoaded extends MatchState {
  MatchesLoaded({required this.matches});

  final List<MatchModel> matches;
}

class MatchFailed extends MatchState {}
