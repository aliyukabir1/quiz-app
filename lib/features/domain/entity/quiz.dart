import 'package:equatable/equatable.dart';

class Quiz extends Equatable {
  final String question;
  final List answers;

  const Quiz({required this.question, required this.answers});

  @override
  List<Object?> get props => [];
}
