import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/quiz.dart';
import '../../../core/widgets/texts/text_r.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({
    super.key,
    required this.quiz,
  });

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      width: 342,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.green,
          width: 4,
        ),
      ),
      child: Center(
        child: TextB(
          quiz.title,
          fontSize: 18,
          fontFamily: Fonts.montserratB,
          color: AppColors.main,
          maxLines: 4,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
