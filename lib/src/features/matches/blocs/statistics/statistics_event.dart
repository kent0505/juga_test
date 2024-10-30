part of 'statistics_bloc.dart';

@immutable
sealed class StatisticsEvent {}

class GetStatisticsEvent extends StatisticsEvent {
  GetStatisticsEvent({required this.id});

  final int id;
}
