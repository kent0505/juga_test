import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/others/internet/internet_widget.dart';
import '../../matches/screens/matches_screen.dart';
import '../../news/screens/news_screen.dart';
import '../../quiz/screens/quiz_screen.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return CustomScaffold(
          settings: state is HomeSettings,
          body: InternetWidget(
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeSettings) return const SettingsScreen();

                    if (state is HomeQuiz) return const QuizScreen();

                    if (state is HomeNews) return const NewsScreen();

                    return const MatchesScreen();
                  },
                ),
                const NavBar(),
              ],
            ),
          ),
        );
      },
    );
  }
}
