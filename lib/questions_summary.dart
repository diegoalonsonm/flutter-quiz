import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(children: [
              // Text (((data['question_index'] as int) + 1).toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              Expanded(
                child: Column (children: [
                  Text(data['question'] as String, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 5,),
                  Text(data['user_answer'] as String, style: TextStyle(color: data['user_answer'] == data['correct_answer'] ? Colors.green : Colors.red, fontWeight: FontWeight.bold)),
                  Text(data['correct_answer'] as String, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                ]),
              ), // makes the widget inside Expanded to take all the spacre provided by the row
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
