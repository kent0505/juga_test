import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_r.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextM('Quiz', fontSize: 20),
      ],
    );
  }
}
