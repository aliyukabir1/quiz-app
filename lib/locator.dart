import 'package:get_it/get_it.dart';
import 'package:quiz_app/features/quiz/data/datasource/local_data_source.dart';
import 'package:quiz_app/features/quiz/data/repository/quix_repository_impl.dart';
import 'package:quiz_app/features/quiz/domain/repository/quiz_repository.dart';
import 'package:quiz_app/features/quiz/domain/usecase/get_quiz.dart';
import 'package:quiz_app/features/quiz/presentation/bloc/quiz_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => QuizBloc(getQuiz: sl()));
  sl.registerLazySingleton(() => GetQuiz(sl()));
  sl.registerLazySingleton<QuizRepository>(
      () => QuizRepositoryImplementation(sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}
