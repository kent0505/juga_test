import 'package:flutter/material.dart';

import '../../../core/models/quiz.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/arrow_back_button.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/correct_answers_dialog.dart';
import '../widgets/quiz_answer.dart';
import '../widgets/quiz_image.dart';
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
      setState(() {
        answer = defaultAnswer;
        index++;
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
