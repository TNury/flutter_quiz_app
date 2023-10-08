import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final Function(String screenToSwitchTo) switchScreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/media/quiz-logo.png',
            width: 250,
          ),
          const SizedBox(height: 64),
          const Text(
            'Master Flutter while having a blast!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 48),
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
                  'Start Quiz',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 16),
                Icon(Icons.arrow_right),
              ],
            ),
          )
        ],
      ),
    );
  }
}
