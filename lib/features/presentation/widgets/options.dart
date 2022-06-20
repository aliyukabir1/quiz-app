import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/data/model/quiz_model.dart';
import 'package:quiz_app/features/presentation/bloc/quiz_bloc.dart';

class Options extends StatefulWidget {
  final List<Answer> answer;
  const Options({Key? key, required this.answer}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<QuizBloc>(context);
    int groupVal = context.watch<QuizBloc>().selectedOption;
    return Column(
      children: [
        RadioListTile(
            title: Text(widget.answer[0].text),
            value: 0,
            groupValue: groupVal,
            onChanged: (value) {
              setState(() {
                groupVal = 0;
              });
              bloc.onSelect(groupVal);
            }),
        RadioListTile(
            title: Text(widget.answer[1].text),
            value: 1,
            groupValue: groupVal,
            onChanged: (value) {
              setState(() {
                groupVal = 1;
              });
              bloc.onSelect(groupVal);
            }),
        RadioListTile(
            title: Text(widget.answer[2].text),
            value: 2,
            groupValue: groupVal,
            onChanged: (value) {
              setState(() {
                groupVal = 2;
              });
              bloc.onSelect(groupVal);
            }),
        RadioListTile(
            title: Text(widget.answer[3].text),
            value: 3,
            groupValue: groupVal,
            onChanged: (value) {
              setState(() {
                groupVal = 3;
              });
              bloc.onSelect(groupVal);
            }),
      ],
    );
  }
}
