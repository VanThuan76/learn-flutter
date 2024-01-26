import 'package:flutter/material.dart';
import 'package:quiz_app/shared/constants/dummy_data.dart';
import 'package:quiz_app/shared/widgets/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.restartQuiz});

  final List<String> chosenAnswers;

  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions conrrectly!',
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              QuestionsSummary(summaryData),
              const SizedBox(height: 30),
              TextButton(
                onPressed: restartQuiz,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ), // Biểu tượng reload
                    SizedBox(
                        width: 8), // Khoảng cách giữa biểu tượng và văn bản
                    Text(
                      'Restart Quiz!',
                      style: TextStyle(color: Colors.white),
                    ), // Văn bản của nút
                  ],
                ),
              )
            ])));
  }
}
