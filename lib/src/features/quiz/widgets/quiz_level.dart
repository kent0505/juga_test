import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class QuizLevel extends StatelessWidget {
  const QuizLevel({
    super.key,
    required this.index,
    required this.current,
  });

  final int index;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (identical(index, current)) SvgPicture.asset('assets/molny.svg'),
        const SizedBox(height: 3),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Center(
            child: TextM(
              index.toString(),
              fontSize: 25,
              color: identical(index, current)
                  ? AppColors.main
                  : const Color(0xff818181),
            ),
          ),
        ),
      ],
    );
  }
}
