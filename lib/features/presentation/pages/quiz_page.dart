import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/presentation/bloc/quiz_bloc.dart';
import 'package:quiz_app/features/presentation/widgets/quiz_body.dart';
import 'package:quiz_app/locator.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz'), centerTitle: true),
      body: BlocProvider(
        create: (context) => sl<QuizBloc>(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              if (state is Initial) {
                return Center(
                  child: MaterialButton(
                    onPressed: () {
                      BlocProvider.of<QuizBloc>(context).add(GetQuizEvent());
                    },
                    child: const Text('Start Quiz'),
                  ),
                );
              } else if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is Loaded) {
                return QuizBody(
                  quiz: state.quiz,
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
