part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class GetQuizEvent extends QuizEvent {}

class Next extends QuizEvent {}

class Previous extends QuizEvent {}

class Submit extends QuizEvent {}