import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:quiz_app/features/quiz/presentation/widgets/quiz_body.dart';
import 'package:quiz_app/features/quiz/presentation/widgets/result.dart';
import 'package:quiz_app/locator.dart';

class QuizPage extends StatelessWidget {
  final String topic;
  const QuizPage({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$topic Quiz'),
        centerTitle: true,
        elevation: 2,
      ),
      body: BlocProvider(
        create: (context) => sl<QuizBloc>(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              if (state is Initial) {
                return Center(
                  child: MaterialButton(
                    color: Colors.white,
                    elevation: 0,
                    onPressed: () {
                      BlocProvider.of<QuizBloc>(context)
                          .add(GetQuizEvent(topic));
                    },
                    child: const Text(
                      'Start Quiz',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              } else if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is Loaded) {
                return QuizBody(
                  quiz: state.quiz,
                );
              } else if (state is Result) {
                return ResultPage(
                  score: state.score,
                  total: state.total,
                  onpressed: () {
                    BlocProvider.of<QuizBloc>(context).add(Restart());
                  },
                );
              }
              return const Center(
                  child: Text(
                'oops something went terribly wrong',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontStyle: FontStyle.italic),
              ));
            },
          ),
        ),
      ),
    );
  }
}
