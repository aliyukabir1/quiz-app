// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:quiz_app/features/quiz/domain/entity/quiz.dart';
// import 'package:quiz_app/features/quiz/presentation/bloc/quiz_bloc.dart';

// import '../../../helper/mocks/mock.mocks.dart';

// void main() {
//   late MockGetQuiz mockGetQuiz;
//   late QuizBloc bloc;

//   List<Quiz> quizList = const [
//     Quiz(question: 'question', answers: ['ans', 'ans', 'ans']),
//     Quiz(question: 'question', answers: ['ans', 'ans', 'ans']),
//     Quiz(question: 'question', answers: ['ans', 'ans', 'ans'])
//   ];
//   setUp(() {
//     mockGetQuiz = MockGetQuiz();
//     bloc = QuizBloc(getQuiz: mockGetQuiz);
//   });

//   test('initial state should be initial', () {
//     expect(bloc.state, Initial());
//   });

//   group('for success', () {
//     test('should get list of quizes', () async {
//       when(mockGetQuiz())
//           .thenAnswer((realInvocation) async => Future.value(Right(quizList)));
//       bloc.add(GetQuizEvent());
//       await untilCalled(mockGetQuiz());
//       verify(mockGetQuiz());
//     });
//     test('should emit [loading,loaded] when gotten succesfully', () {
//       when(mockGetQuiz())
//           .thenAnswer((realInvocation) async => Future.value(Right(quizList)));

//       bloc.add(GetQuizEvent());
//       final expected = [Loading(), Loaded(quiz: quizList[0])];
//       expect(bloc.stream, emitsInOrder(expected));
//     });

//   //   test('should emit [loading,Result] when submitted', () {
//   //     bloc.add(Submit());
//   //     final expected = [Loading(), const Result(score: 2, total: 2)];
//   //     expect(bloc.stream, emitsInOrder(expected));
//   //   });

//   //   test('should emit [loading,Initial] when Restarted', () {
//   //     bloc.add(Restart());
//   //     final expected = [Loading(), Initial()];
//   //     expect(bloc.stream, emitsInOrder(expected));
//   //   });
//   // });

//   // group('for error', () {
//   //   test('should emit [loading,Error] when gotten succesfully', () {
//   //     when(mockGetQuiz())
//   //         .thenAnswer((realInvocation) => Future.value(Left(Failure())));

//   //     bloc.add(GetQuizEvent());
//   //     final expected = [
//   //       Loading(),
//   //       const Error(message: 'can not find any quiz')
//   //     ];
//   //     expect(bloc.stream, emitsInOrder(expected));
//   //   });
//   // });
// }
