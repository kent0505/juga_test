import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/others/loading_widget.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/arrow_back_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../bloc/match_bloc.dart';
import '../widgets/match_error.dart';

class MatchDetailScreen extends StatefulWidget {
  const MatchDetailScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<MatchDetailScreen> createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.grey,
              BlendMode.color,
            ),
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Image.asset('assets/bg/match_detail_bg.png'),
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
          BlocListener<MatchBloc, MatchState>(
            listener: (context, state) {
              logger(state);
            },
            child: BlocBuilder<MatchBloc, MatchState>(
              builder: (context, state) {
                if (state is MatchLoadingState) return const LoadingWidget();

                if (state is MatchErrorState) return const MatchError();

                if (state is MatchesLoadedState) {
                  return ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 172 + getStatusBar(context),
                    ),
                    children: const [
                      // const Center(
                      //   child: Text(
                      //     'Matches',
                      //     style: TextStyle(
                      //       color: AppColors.green,
                      //       fontSize: 55,
                      //       fontFamily: Fonts.montserratM,
                      //       fontStyle: FontStyle.italic,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 26),
                      // ...List.generate(
                      //   state.matches.length,
                      //   (index) {
                      //     return MatchCard(match: state.matches[index]);
                      //   },
                      // ),
                    ],
                  );
                }

                return Container();
              },
            ),
          ),
          Positioned(
            top: getStatusBar(context),
            child: const ArrowBackButton(),
          ),
        ],
      ),
    );
  }
}
