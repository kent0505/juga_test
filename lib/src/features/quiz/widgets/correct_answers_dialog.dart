import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class CorrectAnswersDialog extends StatelessWidget {
  const CorrectAnswersDialog({
    super.key,
    required this.correctAnswers,
  });

  final int correctAnswers;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.main,
      child: SizedBox(
        height: 150,
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextB(
              'Correct answers: $correctAnswers',
              fontSize: 18,
            ),
            const Spacer(),
            CuperButton(
              padding: 0,
              onPressed: () {
                context.pop();
                context.pop();
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextM(
                    'OK',
                    fontSize: 14,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
