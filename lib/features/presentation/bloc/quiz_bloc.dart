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
        _getQuestions(emit);
      } else if (event is Next) {
        _nextQuestion(emit);
      } else if (event is Previous) {
        _previousQuestion(emit);
      }
    });
  }

  //methods for getting questions, next and previous questions...s
  void _getQuestions(Emitter<QuizState> emit) async {
    emit(Loading());
    final failurOrList = await getQuiz.call();
    failurOrList
        .fold((failure) => emit(const Error(message: 'can not find any quiz')),
            (listOfQuiz) {
      listOfQuizes = listOfQuiz;
      emit(Loaded(quiz: listOfQuiz[indexOfQuiz]));
    });
  }

  void _previousQuestion(Emitter<QuizState> emit) {
    if (indexOfQuiz > 0) {
      emit(Loading());
      indexOfQuiz -= 1;
      emit(Loaded(quiz: listOfQuizes[indexOfQuiz]));
    }
  }

  void _nextQuestion(Emitter<QuizState> emit) {
    if (indexOfQuiz < listOfQuizes.length) {
      emit(Loading());
      indexOfQuiz += 1;
      emit(Loaded(quiz: listOfQuizes[indexOfQuiz]));
    }
  }
}
