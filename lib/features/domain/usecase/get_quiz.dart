import 'package:quiz_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/usecase.dart';
import 'package:quiz_app/features/domain/entity/quiz.dart';
import 'package:quiz_app/features/domain/repository/quiz_repository.dart';

class GetQuiz implements UseCase<List<Quiz>> {
  final QuizRepository repository;

  GetQuiz(this.repository);
  @override
  Either<Failure, List<Quiz>> call() {
    try {
      return repository.getQuiz();
    } on Exception {
      throw Failure();
    }
  }
}
