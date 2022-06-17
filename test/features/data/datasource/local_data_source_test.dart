// import 'package:flutter_test/flutter_test.dart';
// import 'package:quiz_app/features/data/datasource/local_data_source.dart';
// import 'package:quiz_app/features/data/model/quiz_model.dart';

// void main() {
//   late LocalDataSourceImpl localDataSourceImpl;

//   setUp(() {
//     localDataSourceImpl = LocalDataSourceImpl();
//   });

//   test('should return quiz list from local data source', () async {
//     //  String jsonString = fixture('quiz_list.json');

//     List<QuizModel> quizList = [
//       QuizModel(question: 'question', answers: [
//         Answer(text: 'option', isCorrect: true),
//         Answer(text: 'option', isCorrect: false),
//         Answer(text: 'option', isCorrect: false),
//         Answer(text: 'option', isCorrect: false)
//       ]),
//       QuizModel(question: 'question', answers: [
//         Answer(text: 'option', isCorrect: true),
//         Answer(text: 'option', isCorrect: false),
//         Answer(text: 'option', isCorrect: false),
//         Answer(text: 'option', isCorrect: false)
//       ]),
//     ];

//     final result = localDataSourceImpl.getQuiz();

//     expect(result, quizList);
//   });
// }
