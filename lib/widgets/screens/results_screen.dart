import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/widgets/reusable/answer_result.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.switchScreen, this.selectedAnswers, {super.key});

  final void Function(String screenToSwitchToo) switchScreen;
  final List<String> selectedAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'index': i + 1,
        'question': questions[i].headline,
        'correct_answer': questions[i].options[0],
        'selected_answer': selectedAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final correctAnswersNum = summaryData.where((entry) {
      return entry['correct_answer'] == entry['selected_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'You answered $correctAnswersNum out of ${questions.length} questions correctly!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 64),
          SizedBox(
            height: 350,
            child: SingleChildScrollView(
              child: Column(
                children: summaryData.map((entry) {
                  return Column(
                    children: [
                      AnswerResult(
                        index: entry['index'] as int,
                        headline: entry['question'] as String,
                        correctAnswer: entry['correct_answer'] as String,
                        selectedAnswer: entry['selected_answer'] as String,
                      ),
                      const SizedBox(height: 32),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 64),
          FilledButton(
            onPressed: () {
              switchScreen('questions-screen');
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Retry Quiz',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 16),
                Icon(Icons.refresh),
              ],
            ),
          )
        ],
      ),
    );
  }
}
