import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/presentation/bloc/quiz_bloc.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final int total;
  const ResultPage({Key? key, required this.score, required this.total})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: CircularProgressIndicator(
            value: score / total,
            backgroundColor: Colors.grey,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'You Scored $score out of $total',
          style: const TextStyle(color: Colors.blueAccent, fontSize: 20),
        ),
        const SizedBox(height: 40),
        TextButton(
            onPressed: () {
              BlocProvider.of<QuizBloc>(context).add(Restart());
            },
            child: const Text(
              'Restart',
              style: TextStyle(color: Colors.red),
            ))
      ],
    );
  }
}
