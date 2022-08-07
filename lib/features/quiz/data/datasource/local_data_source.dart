import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quiz_app/features/quiz/data/model/quiz_model.dart';

abstract class LocalDataSource {
  Future<List<QuizModel>> getQuiz(String topic);
}

class LocalDataSourceImpl implements LocalDataSource {
  Future<String> getList(String topic) async {
    final list = await rootBundle.loadString('assets/$topic.json');
    return list;
  }

  @override
  Future<List<QuizModel>> getQuiz(String topic) async {
    try {
      final jsonString = await getList(topic);

      List<QuizModel> quizModelList;
      final unconvertedList = jsonDecode(jsonString) as List;
      quizModelList =
          unconvertedList.map((i) => QuizModel.fromJson(i)).toList();
      return Future.value(quizModelList);
    } catch (e) {
      throw Exception();
    }
  }
}
