import 'package:quiz_app/features/domain/entity/quiz.dart';

class QuizModel extends Quiz {
  const QuizModel({required String question, required List<Answer> answers})
      : super(question: question, answers: answers);

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    var list = json['answers'] as List;
    List<Answer> answersList = list.map((i) => Answer.fromJson(i)).toList();
    return QuizModel(question: json['question'], answers: answersList);
  }

  Map<String, dynamic> toJson() {
    var answerList = (answers as List<Answer>).map((i) => i.toJson()).toList();

    return {'question': question, 'answers': answerList};
  }
}

class Answer {
  final String text;
  final bool isCorrect;
  Answer({required this.text, required this.isCorrect});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(text: json['text'], isCorrect: json['isCorrect']);
  }
  Map<String, dynamic> toJson() {
    return {"text": text, "isCorrect": isCorrect};
  }
}
