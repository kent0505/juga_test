import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<ChangeHomeTab>(_changePage);
  }

  void _changePage(ChangeHomeTab event, Emitter<HomeState> emit) {
    if (event.index == 0) {
      if (state is HomeInitial) return;
      emit(HomeInitial());
    } else if (event.index == 1) {
      if (state is HomeNews) return;
      emit(HomeNews());
    } else if (event.index == 2) {
      if (state is HomeQuiz) return;
      emit(HomeQuiz());
    } else {
      if (state is HomeSettings) return;
      emit(HomeSettings());
    }
  }
}
