import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/features/domain/entity/quiz.dart';
import 'package:quiz_app/features/domain/usecase/get_quiz.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final GetQuiz getQuiz;
  QuizBloc({required this.getQuiz}) : super(Initial()) {
    on<QuizEvent>((event, emit) {
      if (event is GetQuizEvent) {
        emit(Loading());
        final failurOrList = getQuiz.call();
        failurOrList.fold(
            (failure) => emit(const Error(message: 'can not find any quiz')),
            (listOfQuiz) => emit(Loaded(quizList: listOfQuiz)));
      }
    });
  }
}
