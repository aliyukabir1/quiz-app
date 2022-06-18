part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class Loading extends QuizState {}

class Initial extends QuizState {}

class Loaded extends QuizState {
  final Quiz quiz;

  const Loaded({required this.quiz});
}

class Error extends QuizState {
  final String message;

  const Error({required this.message});
}
