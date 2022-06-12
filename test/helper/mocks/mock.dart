import 'package:mockito/annotations.dart';
import 'package:quiz_app/features/domain/repository/quiz_repository.dart';
import 'package:quiz_app/features/domain/usecase/get_quiz.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([QuizRepository, SharedPreferences, GetQuiz])
void main() {}
