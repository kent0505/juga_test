part of 'home_bloc.dart';

abstract class HomeEvent {}

class ChangeHomeTab extends HomeEvent {
  ChangeHomeTab({required this.index});

  final int index;
}
