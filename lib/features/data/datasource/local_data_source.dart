import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quiz_app/features/data/model/quiz_model.dart';

abstract class LocalDataSource {
  Future<List<QuizModel>> getQuiz();
}

class LocalDataSourceImpl implements LocalDataSource {
  Future<String> getList() async {
    final list = await rootBundle.loadString('assets/quiz_data.json');
    return list;
  }

  @override
  Future<List<QuizModel>> getQuiz() async {
    try {
      final jsonString = await getList();

      List<QuizModel> quizModelList;
      final unconvertedList = jsonDecode(jsonString) as List;
      quizModelList =
          unconvertedList.map((i) => QuizModel.fromJson(i)).toList();
      return Future.value(quizModelList);
    } catch (e) {
      throw Exception([e]);
    }
  }
}
