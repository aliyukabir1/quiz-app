import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failure.dart';
import 'package:quiz_app/features/quiz/domain/entity/quiz.dart';

abstract class QuizRepository {
  Future<Either<Failure, List<Quiz>>> getQuiz(String topic);
}
