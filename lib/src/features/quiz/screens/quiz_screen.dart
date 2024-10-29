import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../../core/widgets/buttons/primary_button.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: -20,
                right: -60,
                child: Image.asset(
                  'assets/onboard/onboard.png',
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 150,
                  width: getWidth(context),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        AppColors.main,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 160,
                child: SvgPicture.asset('assets/bg/bg4.svg'),
              ),
              Positioned(
                bottom: 75,
                right: 90,
                child: SvgPicture.asset('assets/bg/bg5.svg'),
              ),
              Positioned(
                bottom: 250,
                right: 10,
                child: SvgPicture.asset('assets/bg/bg6.svg'),
              ),
              const Positioned(
                bottom: 200,
                left: 24,
                right: 24,
                child: TextB(
                  'Test your UEFA football knowledge in an exciting multiple-choice quiz',
                  fontSize: 28,
                  maxLines: 10,
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                bottom: 100,
                left: 16,
                right: 16,
                child: PrimaryButton(
                  title: 'START QUIZ',
                  onPressed: () {
                    context.push('/quiz');
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
