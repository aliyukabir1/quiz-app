import 'package:quiz_app/core/errors/failure.dart';
import 'package:quiz_app/features/data/datasource/local_data_source.dart';
import 'package:quiz_app/features/data/model/quiz_model.dart';
import 'package:dartz/dartz.dart';
import 'package:quiz_app/features/domain/repository/quiz_repository.dart';

class QuizRepositoryImplementation implements QuizRepository {
  final LocalDataSource dataSource;

  QuizRepositoryImplementation(this.dataSource);
  @override
  Either<Failure, List<QuizModel>> getQuiz() {
    try {
      return Right(dataSource.getQuiz());
    } on Exception {
      throw Failure();
    }
  }
}
