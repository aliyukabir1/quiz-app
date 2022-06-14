import 'package:flutter/material.dart';
import 'package:quiz_app/features/data/model/quiz_model.dart';
import 'package:quiz_app/features/domain/entity/quiz.dart';
import 'package:quiz_app/features/presentation/widgets/options.dart';

class QuizBody extends StatelessWidget {
  final Quiz quiz;
  const QuizBody({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final answers = quiz.answers as List<Answer>;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        quiz.question,
        style: const TextStyle(
            fontSize: 20, color: Color.fromARGB(255, 28, 63, 29)),
      ),
      const SizedBox(height: 30),
      Options(answer: answers),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            color: Colors.blueAccent,
            onPressed: () {},
            child: const Text(
              'Previous',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            color: Colors.blueAccent,
            onPressed: () {},
            child: const Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      )
    ]);
  }
}
