import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/widgets/reusable/answer_button.dart';
import 'package:flutter_quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.switchScreen, this.onSelectAnswer, {super.key});

  final void Function(String screenToSwitchToo) switchScreen;
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  late final Function(String screenToSwitchToo) switchScreen;
  late final Function(String answer) onSelectAnswer;

  @override
  void initState() {
    super.initState();
    onSelectAnswer = widget.onSelectAnswer;
    switchScreen = widget.switchScreen;
  }

  answerQuestion(String selectedAnswer) {
    onSelectAnswer(selectedAnswer);

    if (currentQuestionIndex + 1 < questions.length) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      switchScreen('results-screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.headline,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 64),
          ...currentQuestion.shuffledOptions.map((option) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnswerButton(option, () => answerQuestion(option)),
                const SizedBox(height: 16),
              ],
            );
          }),
        ],
      ),
    );
  }
}
