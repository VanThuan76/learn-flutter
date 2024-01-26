import 'package:flutter/material.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:quiz_app/shared/constants/dummy_data.dart';
import 'package:quiz_app/shared/widgets/gradient_container.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
            chosenAnswers: _selectedAnswers, restartQuiz: restartQuiz);
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      activeScreen = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: GradientContainer(const Color.fromARGB(255, 33, 5, 109),
          const Color.fromARGB(255, 68, 21, 149), activeScreen!),
    ));
  }
}
