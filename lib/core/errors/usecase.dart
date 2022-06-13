import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failure.dart';

abstract class UseCase<T> {
  Either<Failure, T> call();
}