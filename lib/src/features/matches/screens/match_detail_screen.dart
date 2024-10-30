import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/match_model.dart';
import '../../../core/others/loading_widget.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/arrow_back_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../blocs/statistics/statistics_bloc.dart';
import '../widgets/failure_widget.dart';

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
    context.read<StatisticsBloc>().add(GetStatisticsEvent(id: widget.match.id));
  }

  @override
  void initState() {
    super.initState();
    logger(widget.match.id);
    context.read<StatisticsBloc>().add(GetStatisticsEvent(id: widget.match.id));
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
          BlocBuilder<StatisticsBloc, StatisticsState>(
            builder: (context, state) {
              logger(state);

              if (state is StatisticsLoading) return const LoadingWidget();

              if (state is StatisticsFailed) {
                return FailureWidget(onPressed: onAgain);
              }

              if (state is StatisticsLoaded) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
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
                          Expanded(
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
                        ],
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
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
                    ],
                  ),
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
