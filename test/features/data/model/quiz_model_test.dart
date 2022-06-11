import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/features/data/model/quiz_model.dart';
import 'package:quiz_app/features/domain/entity/quiz.dart';

import '../../../helper/fixtures/fixture_reader.dart';

void main() {
  QuizModel quizModel = QuizModel(
    question: 'question',
    answers: [
      Answer(text: 'option', isCorrect: true),
      Answer(text: 'option', isCorrect: false),
      Answer(text: 'option', isCorrect: false),
      Answer(text: 'option', isCorrect: false),
    ],
  );
  test('quiz model should be a quiz type', () {
    expect(quizModel, isA<Quiz>());
  });

  group('fromjson', () {
    test('should return a quizmodel', () {
      final jsonString = fixture('quiz.json');
      prints(jsonString);
      var result = QuizModel.fromJson(jsonDecode(jsonString));
      expect(result, isA<QuizModel>());
    });
  });

  group('to json', () {
    test('should convert quiz model to json', () {
      final Map<String, dynamic> jsonMap = {
        "question": 'question',
        "answers": [
          {"text": "option", "isCorrect": true},
          {"text": "option", "isCorrect": false},
          {"text": "option", "isCorrect": false},
          {"text": "option", "isCorrect": false}
        ]
      };
      final result = quizModel.toJson();
      expect(result, jsonMap);
    });
  });
}
