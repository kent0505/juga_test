import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/models/match_model.dart';
import '../../../core/others/loading_widget.dart';
import '../../../core/widgets/buttons/arrow_back_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../blocs/statistics/statistics_bloc.dart';
import '../widgets/failure_widget.dart';
import '../widgets/statistics_data.dart';

class MatchDetailScreen extends StatefulWidget {
  const MatchDetailScreen({
    super.key,
    required this.match,
  });

  final MatchModel match;

  @override
  State<MatchDetailScreen> createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen> {
  void onAgain() {
    logger(widget.match.id);
    context.read<StatisticsBloc>().add(GetStatisticsEvent(id: widget.match.id));
  }

  @override
  void initState() {
    super.initState();
    onAgain();
  }

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
              child: Image.asset(
                'assets/bg/match_detail_bg.png',
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
          BlocBuilder<StatisticsBloc, StatisticsState>(
            builder: (context, state) {
              logger(state);

              if (state is StatisticsLoading) return const LoadingWidget();

              if (state is StatisticsFailed) {
                return FailureWidget(onPressed: onAgain);
              }

              if (state is StatisticsLoaded) {
                return ListView(
                  children: [
                    const SizedBox(height: 60),
                    Center(
                      child: TextM(
                        widget.match.stadium,
                        fontSize: 14,
                        fontFamily: Fonts.montserratM,
                        color: AppColors.green,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 80,
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl: widget.match.logo1,
                                height: 72,
                              ),
                              const SizedBox(height: 10),
                              TextM(
                                widget.match.title1,
                                fontSize: 12,
                                fontFamily: Fonts.montserratM,
                                color: AppColors.green,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: 190,
                          child: Column(
                            children: [
                              TextB(
                                '${widget.match.goals1} : ${widget.match.goals2}',
                                fontSize: 63,
                                fontFamily: Fonts.heavy,
                                color: AppColors.green,
                              ),
                              const SizedBox(height: 25),
                              Container(
                                height: 18,
                                width: 132,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.white,
                                ),
                                child: const Center(
                                  child: TextB(
                                    'Game stats',
                                    fontSize: 13,
                                    fontFamily: Fonts.heavy,
                                    color: AppColors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: 80,
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl: widget.match.logo2,
                                height: 72,
                              ),
                              const SizedBox(height: 10),
                              TextM(
                                widget.match.title2,
                                fontSize: 12,
                                fontFamily: Fonts.montserratM,
                                color: AppColors.green,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: SizedBox(
                        width: 290,
                        height: 90,
                        child: Stack(
                          children: [
                            SvgPicture.asset('assets/stadium.svg'),
                            Positioned(
                              top: 20,
                              right: 90,
                              child: SvgPicture.asset('assets/ball.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    StatisticsData(
                      title: 'Shot',
                      left: state.statistics.team1.shots.toString(),
                      right: state.statistics.team2.shots.toString(),
                    ),
                    const SizedBox(height: 12),
                    StatisticsData(
                      title: 'Shots on goal',
                      left: state.statistics.team1.shotsOnGoal.toString(),
                      right: state.statistics.team2.shotsOnGoal.toString(),
                    ),
                    const SizedBox(height: 12),
                    StatisticsData(
                      title: 'Possession',
                      left: state.statistics.team1.possession,
                      right: state.statistics.team2.possession,
                    ),
                    const SizedBox(height: 12),
                    StatisticsData(
                      title: 'Passes',
                      left: state.statistics.team1.passes.toString(),
                      right: state.statistics.team2.passes.toString(),
                    ),
                    const SizedBox(height: 12),
                    StatisticsData(
                      title: 'Pass accuracy',
                      left: state.statistics.team1.passesAccuracy,
                      right: state.statistics.team2.passesAccuracy,
                    ),
                    const SizedBox(height: 12),
                    StatisticsData(
                      title: 'Fouls',
                      left: state.statistics.team1.fouls.toString(),
                      right: state.statistics.team2.fouls.toString(),
                    ),
                    const SizedBox(height: 12),
                    StatisticsData(
                      title: 'Yellow cards',
                      left: state.statistics.team1.yellowCards.toString(),
                      right: state.statistics.team2.yellowCards.toString(),
                    ),
                    const SizedBox(height: 12),
                    StatisticsData(
                      title: 'Red cards',
                      left: state.statistics.team1.redCards.toString(),
                      right: state.statistics.team2.redCards.toString(),
                    ),
                    const SizedBox(height: 12),
                    StatisticsData(
                      title: 'Offsides',
                      left: state.statistics.team1.offsides.toString(),
                      right: state.statistics.team2.offsides.toString(),
                    ),
                    const SizedBox(height: 12),
                    StatisticsData(
                      title: 'Corners',
                      left: state.statistics.team1.corners.toString(),
                      right: state.statistics.team2.corners.toString(),
                    ),
                    const SizedBox(height: 60),
                  ],
                );
              }

              return Container();
            },
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
