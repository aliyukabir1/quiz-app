import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/core/errors/failure.dart';
import 'package:quiz_app/features/domain/entity/quiz.dart';
import 'package:quiz_app/features/domain/usecase/get_quiz.dart';

import '../../../helper/mocks/mock.mocks.dart';

void main() {
  late MockQuizRepository repository;
  late GetQuiz usecase;

  setUp(() {
    repository = MockQuizRepository();
    usecase = GetQuiz(repository);
  });

  test('should return  a list of quizes', () async {
    List<Quiz> quizList = const [
      Quiz(question: 'question', answers: ['ans', 'ans', 'ans']),
      Quiz(question: 'question', answers: ['ans', 'ans', 'ans']),
      Quiz(question: 'question', answers: ['ans', 'ans', 'ans'])
    ];
    when(repository.getQuiz()).thenReturn(Right(quizList));
    final result = usecase.call();
    expect(result, Right(quizList));
    verify(repository.getQuiz());
  });

  test('should return  a failure', () async {
    Failure failure = Failure();
    when(repository.getQuiz()).thenReturn(Left(failure));

    final result = usecase.call();
    expect(result, Left(failure));
    verify(repository.getQuiz());
  });
}
