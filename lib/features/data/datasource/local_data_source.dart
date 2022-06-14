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
      // final String? jsonString1 =
      //     File('lib/features/data/datasource/quiz_data.json')
      //         .readAsStringSync();
      // dataSource.setString('quiz', jsonString1!);
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
