part of 'match_bloc.dart';

@immutable
sealed class MatchEvent {}

class GetMatchesEvent extends MatchEvent {}
