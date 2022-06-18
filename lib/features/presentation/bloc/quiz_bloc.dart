import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/features/domain/entity/quiz.dart';
import 'package:quiz_app/features/domain/usecase/get_quiz.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final GetQuiz getQuiz;
  int indexOfQuiz = 0;
  List<Quiz> listOfQuizes = [];
  QuizBloc({required this.getQuiz}) : super(Initial()) {
    on<QuizEvent>((event, emit) async {
      if (event is GetQuizEvent) {
        emit(Loading());
        final failurOrList = await getQuiz.call();
        failurOrList.fold(
            (failure) => emit(const Error(message: 'can not find any quiz')),
            (listOfQuiz) {
          listOfQuizes = listOfQuiz;
          emit(Loaded(quiz: listOfQuiz[indexOfQuiz]));
        });
      } else if (event is Next) {
        if (indexOfQuiz < listOfQuizes.length) {
          emit(Loading());
          indexOfQuiz += 1;
          emit(Loaded(quiz: listOfQuizes[indexOfQuiz]));
        }
      } else if (event is Previous) {
        if (indexOfQuiz > 0) {
          emit(Loading());
          indexOfQuiz -= 1;
          emit(Loaded(quiz: listOfQuizes[indexOfQuiz]));
        }
      }
    });
  }
}
