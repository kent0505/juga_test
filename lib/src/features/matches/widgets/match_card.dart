import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/match_model.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    super.key,
    required this.match,
  });

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.green,
          width: 4,
        ),
      ),
      child: CuperButton(
        onPressed: () {
          context.push('/match', extra: match);
        },
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CachedNetworkImage(
                    imageUrl: match.logo1,
                    height: 40,
                  ),
                  TextM(
                    match.title1,
                    fontSize: 12,
                    fontFamily: Fonts.montserratM,
                    color: AppColors.green,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  TextB(
                    match.goals1.toString(),
                    fontSize: 40,
                    fontFamily: Fonts.heavy,
                    color: AppColors.main,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Spacer(),
                  TextM(
                    match.stadium,
                    fontSize: 14,
                    fontFamily: Fonts.montserratM,
                    color: AppColors.green,
                    maxLines: 4,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Container(
                    height: 18,
                    width: 132,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.main,
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CachedNetworkImage(
                    imageUrl: match.logo2,
                    height: 40,
                  ),
                  TextM(
                    match.title2,
                    fontSize: 12,
                    fontFamily: Fonts.montserratM,
                    color: AppColors.green,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  TextB(
                    match.goals2.toString(),
                    fontSize: 40,
                    fontFamily: Fonts.heavy,
                    color: AppColors.main,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
