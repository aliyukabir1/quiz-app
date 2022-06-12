import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failure.dart';
import 'package:quiz_app/features/domain/entity/quiz.dart';

abstract class QuizRepository {
  Either<Failure, List<Quiz>> getQuiz();
}
