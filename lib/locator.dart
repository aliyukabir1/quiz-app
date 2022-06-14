import 'package:get_it/get_it.dart';
import 'package:quiz_app/features/data/datasource/local_data_source.dart';
import 'package:quiz_app/features/data/repository/quix_repository_impl.dart';
import 'package:quiz_app/features/domain/repository/quiz_repository.dart';
import 'package:quiz_app/features/domain/usecase/get_quiz.dart';
import 'package:quiz_app/features/presentation/bloc/quiz_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => QuizBloc(getQuiz: sl()));
  sl.registerLazySingleton(() => GetQuiz(sl()));
  sl.registerLazySingleton<QuizRepository>(
      () => QuizRepositoryImplementation(sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sl()));
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
