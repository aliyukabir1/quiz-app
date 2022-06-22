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
  List answersCheck = [];
  List expectedAnswers = [];
  bool displaySubmitButton = false;
  late int selectedOption;
  int score = 0;

  //business logics
  QuizBloc({required this.getQuiz}) : super(Initial()) {
    on<QuizEvent>((event, emit) async {
      if (event is GetQuizEvent) {
        await _getQuestions(emit);
        selectedOption = answersCheck[indexOfQuiz];
      } else if (event is Next) {
        _nextQuestion(emit);
      } else if (event is Previous) {
        _previousQuestion(emit);
      } else if (event is Submit) {
        markQuiz(emit);
      } else if (event is Restart) {
        restart(emit);
      }
    });
  }

  //methods for getting questions, next and previous
  Future<void> _getQuestions(Emitter<QuizState> emit) async {
    emit(Loading());
    final failurOrList = await getQuiz.call();
    failurOrList
        .fold((failure) => emit(const Error(message: 'can not find any quiz')),
            (listOfQuiz) {
      listOfQuizes = listOfQuiz;
      answersCheck = List.filled(listOfQuiz.length, -1);
      emit(Loaded(quiz: listOfQuiz[indexOfQuiz]));
    });
  }

  void _previousQuestion(Emitter<QuizState> emit) {
    if (indexOfQuiz > 0) {
      emit(Loading());
      indexOfQuiz -= 1;
      selectedOption = answersCheck[indexOfQuiz];
      shouldShowSubmit();
      emit(Loaded(quiz: listOfQuizes[indexOfQuiz]));
    }
  }

  void _nextQuestion(Emitter<QuizState> emit) {
    if (indexOfQuiz < listOfQuizes.length && answersCheck[indexOfQuiz] != -1) {
      emit(Loading());
      indexOfQuiz += 1;
      selectedOption = answersCheck[indexOfQuiz];
      shouldShowSubmit();
      emit(Loaded(quiz: listOfQuizes[indexOfQuiz]));
    }
  }

// set the option value
  void onSelect(int groupValue) {
    answersCheck[indexOfQuiz] = groupValue;
    selectedOption = answersCheck[indexOfQuiz];
  }

  void shouldShowSubmit() {
    displaySubmitButton = indexOfQuiz == listOfQuizes.length - 1 ? true : false;
  }

  markQuiz(Emitter<QuizState> emit) {
    if (answersCheck[indexOfQuiz] != -1) {
      emit(Loading());
      for (var item in listOfQuizes) {
        var value =
            item.answers.indexWhere((element) => element.isCorrect == true);
        expectedAnswers.add(value);
      }
      for (var i = 0; i < listOfQuizes.length; i++) {
        if (expectedAnswers[i] == answersCheck[i]) {
          score += 1;
        } else {
          score = score;
        }
      }
      emit(Result(score: score, total: listOfQuizes.length));
    }
  }

  restart(Emitter<QuizState> emit) {
    emit(Loading());
    indexOfQuiz = 0;
    score = 0;
    displaySubmitButton = false;
    answersCheck = [];
    expectedAnswers = [];
    emit(Initial());
  }
}
