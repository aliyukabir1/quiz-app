part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class Loading extends QuizState {}

class Initial extends QuizState {}

class Loaded extends QuizState {
  final List<Quiz> quizList;

  const Loaded({required this.quizList});
}

class Error extends QuizState {
  final String message;

  const Error({required this.message});
}
