import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/quiz.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class QuizAnswer extends StatelessWidget {
  const QuizAnswer({
    super.key,
    required this.id,
    required this.selected,
    required this.answer,
    required this.onPressed,
  });

  final String id;
  final Answer selected;
  final Answer answer;
  final void Function(Answer) onPressed;

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: () {
        onPressed(answer);
      },
      minSize: 34,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              color: identical(answer, selected)
                  ? AppColors.green
                  : AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: TextM(
                '$id.',
                fontSize: 25,
                color: AppColors.main,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Container(
            height: 34,
            width: 342 - 14 - 34 - 12,
            decoration: BoxDecoration(
              color: identical(answer, selected)
                  ? AppColors.green
                  : AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 2,
                color: AppColors.green,
              ),
            ),
            child: Center(
              child: TextM(
                answer.title,
                fontSize: 18,
                color: AppColors.main,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
