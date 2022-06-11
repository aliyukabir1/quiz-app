import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/features/data/datasource/local_data_source.dart';
import 'package:quiz_app/features/data/model/quiz_model.dart';

import '../../../helper/fixtures/fixture_reader.dart';
import '../../../helper/mocks/mock.mocks.dart';

void main() {
  late LocalDataSourceImpl localDataSourceImpl;
  late MockSharedPreferences sharedPreferences;

  setUp(() {
    sharedPreferences = MockSharedPreferences();
    localDataSourceImpl = LocalDataSourceImpl(sharedPreferences);
  });

  test('should return quiz list from local data source', () async {
    String jsonString = fixture('quiz.json');

    final tQuiz = QuizModel.fromJson(jsonDecode(fixture('quiz.json')));

    when(sharedPreferences.getString(any)).thenReturn(jsonString);
    final result = await localDataSourceImpl.getQuiz();

    expect(result, equals(tQuiz));
    verify(sharedPreferences.getString(any));
  });
}
