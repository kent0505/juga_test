part of 'statistics_bloc.dart';

@immutable
sealed class StatisticsState {}

final class StatisticsInitial extends StatisticsState {}

class StatisticsLoading extends StatisticsState {}

class StatisticsLoaded extends StatisticsState {
  StatisticsLoaded({required this.statistics});

  final Statistics statistics;
}

class StatisticsFailed extends StatisticsState {}
