import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/others/internet/internet_widget.dart';
import '../../matches/pages/matches_page.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: InternetWidget(
        child: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeSettings) return const SettingsPage();

                if (state is HomeNews) return const Text('News');

                if (state is HomeQuiz) return const Text('Quiz');

                return const MatchesPage();
              },
            ),
            const NavBar(),
          ],
        ),
      ),
    );
  }
}
