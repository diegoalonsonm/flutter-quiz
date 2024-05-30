import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.resetQuiz});

  final List<String> chosenAnswers;
  final void Function() resetQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctAnwsers = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( 'You answered $correctAnwsers out of $totalQuestions questions correctley!', 
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            TextButton(onPressed: () { resetQuiz(); }, style: TextButton.styleFrom (
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 11, 100, 173),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            ), 
              child: const Text('Restart quiz')
            )
          ],
        ),
      ),
    );
  }
}