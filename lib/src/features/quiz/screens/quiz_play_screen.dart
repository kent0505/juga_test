import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/quiz.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/quiz_image.dart';

class QuizPlayScreen extends StatefulWidget {
  const QuizPlayScreen({super.key});

  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  int index = 0;

  void onAnswer() {
    if (index == 19) {
      //
    } else {
      setState(() {
        index++;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    for (Quiz quiz in quizesList) {
      quiz.answers.shuffle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      id: 3,
      body: Column(
        children: [
          SizedBox(height: getStatusBar(context)),
          Row(
            children: [
              const SizedBox(width: 10),
              CuperButton(
                onPressed: () {
                  context.pop();
                },
                minSize: 50,
                child: SvgPicture.asset('assets/back.svg'),
              ),
            ],
          ),
          QuizImage(quiz: quizesList[index]),
          const Spacer(),
          PrimaryButton(
            title: 'Answer',
            width: 342,
            onPressed: onAnswer,
          ),
          const SizedBox(height: 55),
        ],
      ),
    );
  }
}
