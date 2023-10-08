import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/theme/theme.dart';
import 'package:flutter_quiz_app/widgets/screens/start_screen.dart';
import 'package:flutter_quiz_app/widgets/screens/questions_screen.dart';
import 'package:flutter_quiz_app/widgets/screens/results_screen.dart';

class QuizWrapper extends StatefulWidget {
  const QuizWrapper({super.key});

  @override
  State<QuizWrapper> createState() => _QuizWrapperState();
}

class _QuizWrapperState extends State<QuizWrapper> {
  List<String> selectedAnswers = [];
  var _activeScreen = 'start-screen';

  void switchScreen(String screenToSwitchTo) {
    setState(() {
      if (selectedAnswers.isNotEmpty && screenToSwitchTo == 'questions-screen') {
        selectedAnswers = [];
      }

      _activeScreen = screenToSwitchTo;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  Widget _buildBody() {
    switch (_activeScreen) {
      case 'questions-screen':
        return QuestionsScreen(switchScreen, chooseAnswer);
      case 'results-screen':
        return ResultsScreen(switchScreen, selectedAnswers);
      default:
        return StartScreen(switchScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: _buildBody(),
        ),
      ),
    );
  }
}
