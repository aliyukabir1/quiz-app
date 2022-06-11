import 'dart:convert';

import 'package:quiz_app/features/data/model/quiz_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<QuizModel> getQuiz();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences dataSource;

  LocalDataSourceImpl(this.dataSource);

  @override
  Future<QuizModel> getQuiz() async {
    try {
      final String? jsonString = dataSource.getString('quiz');

      return Future.value(QuizModel.fromJson(jsonDecode(jsonString!)));
    } on Exception {
      throw Exception();
    }
  }
}
