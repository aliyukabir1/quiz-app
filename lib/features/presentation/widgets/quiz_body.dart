import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/data/model/quiz_model.dart';
import 'package:quiz_app/features/domain/entity/quiz.dart';
import 'package:quiz_app/features/presentation/bloc/quiz_bloc.dart';
import 'package:quiz_app/features/presentation/widgets/options.dart';

class QuizBody extends StatefulWidget {
  final Quiz quiz;
  const QuizBody({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  @override
  Widget build(BuildContext context) {
    Quiz quiz = widget.quiz;
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
            onPressed: () {
              BlocProvider.of<QuizBloc>(context).add(Previous());
            },
            child: const Text(
              'Previous',
              style: TextStyle(color: Colors.white),
            ),
          ),
          context.read<QuizBloc>().displaySubmitButton
              ? MaterialButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    BlocProvider.of<QuizBloc>(context).add(Submit());
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : MaterialButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    BlocProvider.of<QuizBloc>(context).add(Next());
                  },
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
