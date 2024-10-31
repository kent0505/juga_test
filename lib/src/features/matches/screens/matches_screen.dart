import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/others/loading_widget.dart';
import '../../../core/utils.dart';
import '../blocs/match/match_bloc.dart';
import '../widgets/match_card.dart';
import '../widgets/failure_widget.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.color,
          ),
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Image.asset(
              'assets/bg/match_bg.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: getWidth(context) - 500 + getStatusBar(context),
          left: 0,
          right: 0,
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.main.withOpacity(0),
                  AppColors.main.withOpacity(0.1),
                  AppColors.main.withOpacity(0.3),
                  AppColors.main.withOpacity(0.5),
                  AppColors.main.withOpacity(0.9),
                  AppColors.main,
                  AppColors.main,
                ],
              ),
            ),
          ),
        ),
        BlocBuilder<MatchBloc, MatchState>(
          builder: (context, state) {
            logger(state);

            if (state is MatchLoading) return const LoadingWidget();

            if (state is MatchFailed) {
              return FailureWidget(
                onPressed: () {
                  context.read<MatchBloc>().add(GetMatchesEvent());
                },
              );
            }

            if (state is MatchesLoaded) {
              return ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 172 + getStatusBar(context),
                ),
                children: [
                  const Center(
                    child: Text(
                      'Matches',
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 55,
                        fontFamily: Fonts.montserratM,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  ...List.generate(
                    state.matches.length,
                    (index) {
                      return MatchCard(match: state.matches[index]);
                    },
                  ),
                ],
              );
            }

            return Container();
          },
        ),
      ],
    );
  }
}
