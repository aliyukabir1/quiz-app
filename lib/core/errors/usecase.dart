import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failure.dart';

abstract class UseCase<T> {
  Future<Either<Failure, T>> call(String topic);
}
