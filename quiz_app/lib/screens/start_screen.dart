import 'package:flutter/material.dart';
import 'package:quiz_app/shared/widgets/styled_text.dart';

class StartScreen extends StatefulWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(
            "assets/images/quiz-logo.png",
            width: 350,
          ),
        ),
        const SizedBox(height: 80),
        const StyledText('Learn Flutter the fun way!'),
        const SizedBox(height: 20),
        OutlinedButton.icon(
            onPressed: widget.startQuiz,
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(20),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz')),
      ],
    );
  }
}
