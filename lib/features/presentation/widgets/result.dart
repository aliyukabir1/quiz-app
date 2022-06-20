import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final int total;
  final void Function()? onpressed;
  const ResultPage(
      {Key? key,
      required this.score,
      required this.total,
      required this.onpressed})
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
            onPressed: onpressed,
            child: const Text(
              'Restart',
              style: TextStyle(color: Colors.red),
            ))
      ],
    );
  }
}
