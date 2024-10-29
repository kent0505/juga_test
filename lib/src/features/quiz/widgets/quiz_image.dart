import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/quiz.dart';

class QuizImage extends StatelessWidget {
  const QuizImage({super.key, required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 192,
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/quiz/quiz${quiz.id}.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
