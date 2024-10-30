import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/quiz.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/arrow_back_button.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/correct_answers_dialog.dart';
import '../widgets/quiz_answer.dart';
import '../widgets/quiz_image.dart';
import '../widgets/quiz_level.dart';
import '../widgets/quiz_question.dart';

class QuizPlayScreen extends StatefulWidget {
  const QuizPlayScreen({super.key});

  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  int index = 0;
  int correctAnswers = 0;

  late Answer answer;
  Answer defaultAnswer = Answer(
    title: '',
    correct: false,
  );

  List<int> levelsIndex = [1, 2, 3, 4, 5];

  void onSelectAnswer(Answer value) {
    setState(() {
      answer = value;
    });
  }

  void onAnswer() {
    if (answer.correct) correctAnswers++;
    if (index == 19) {
      setState(() {
        answer = defaultAnswer;
      });
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CorrectAnswersDialog(correctAnswers: correctAnswers);
        },
      );
    } else {
      precacheImage(
        AssetImage('assets/quiz/quiz${quizesList[index + 1].id}.png'),
        context,
      );
      setState(() {
        answer = defaultAnswer;
        index++;
        if (index == 5) levelsIndex = [2, 3, 4, 5, 6];
        if (index == 6) levelsIndex = [3, 4, 5, 6, 7];
        if (index == 7) levelsIndex = [4, 5, 6, 7, 8];
        if (index == 8) levelsIndex = [5, 6, 7, 8, 9];
        if (index == 9) levelsIndex = [6, 7, 8, 9, 10];
        if (index == 10) levelsIndex = [7, 8, 9, 10, 11];
        if (index == 11) levelsIndex = [8, 9, 10, 11, 12];
        if (index == 12) levelsIndex = [9, 10, 11, 12, 13];
        if (index == 13) levelsIndex = [10, 11, 12, 13, 14];
        if (index == 14) levelsIndex = [11, 12, 13, 14, 15];
        if (index == 15) levelsIndex = [12, 13, 14, 15, 16];
        if (index == 16) levelsIndex = [13, 14, 15, 16, 17];
        if (index == 17) levelsIndex = [14, 15, 16, 17, 18];
        if (index == 18) levelsIndex = [15, 16, 17, 18, 19];
        if (index == 19) levelsIndex = [16, 17, 18, 19, 20];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    answer = defaultAnswer;
    quizesList.shuffle();
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
          const ArrowBackButton(),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Spacer(),
              QuizLevel(index: levelsIndex[0], current: index + 1),
              const _Line(),
              QuizLevel(index: levelsIndex[1], current: index + 1),
              const _Line(),
              QuizLevel(index: levelsIndex[2], current: index + 1),
              const _Line(),
              QuizLevel(index: levelsIndex[3], current: index + 1),
              const _Line(),
              QuizLevel(index: levelsIndex[4], current: index + 1),
              const _Line(),
            ],
          ),
          const Spacer(),
          QuizImage(quiz: quizesList[index]),
          const Spacer(),
          QuizQuestion(quiz: quizesList[index]),
          const Spacer(),
          QuizAnswer(
            id: 'A',
            selected: answer,
            answer: quizesList[index].answers[0],
            onPressed: onSelectAnswer,
          ),
          const SizedBox(height: 16),
          QuizAnswer(
            id: 'B',
            selected: answer,
            answer: quizesList[index].answers[1],
            onPressed: onSelectAnswer,
          ),
          const SizedBox(height: 16),
          QuizAnswer(
            id: 'C',
            selected: answer,
            answer: quizesList[index].answers[2],
            onPressed: onSelectAnswer,
          ),
          const Spacer(),
          PrimaryButton(
            title: 'Answer',
            active: answer.title.isNotEmpty,
            width: 342,
            onPressed: onAnswer,
          ),
          const SizedBox(height: 55),
        ],
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: Center(
          child: Container(
            height: 4,
            color: AppColors.green,
          ),
        ),
      ),
    );
  }
}
