import 'dart:convert';

import 'package:quiz_app/features/data/model/quiz_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  List<QuizModel> getQuiz();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences dataSource;

  LocalDataSourceImpl(this.dataSource);

  @override
  List<QuizModel> getQuiz() {
    try {
      List<QuizModel> quizModelList;
      final String? jsonString = dataSource.getString('quiz');
      final unconvertedList = jsonDecode(jsonString!) as List;
      quizModelList =
          unconvertedList.map((i) => QuizModel.fromJson(i)).toList();
      return quizModelList;
    } on Exception {
      throw Exception();
    }
  }
}
