import 'package:flutter/material.dart';

class AnswerResult extends StatelessWidget {
  const AnswerResult({
    super.key,
    required this.index,
    required this.headline,
    required this.correctAnswer,
    required this.selectedAnswer,
  });

  final int index;
  final String headline;
  final String correctAnswer;
  final String selectedAnswer;

  Color _getAccentColor() {
    if (correctAnswer == selectedAnswer) {
      return Colors.greenAccent;
    } else {
      return Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: _getAccentColor(),
            borderRadius: const BorderRadius.all(
              Radius.circular(55),
            ),
          ),
          child: Center(
            child: Text(
              '$index',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                headline,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                correctAnswer,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.purpleAccent,
                  fontSize: 16,
                ),
              ),
              Text(
                selectedAnswer,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: _getAccentColor(),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
