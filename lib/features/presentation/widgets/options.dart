import 'package:flutter/material.dart';
import 'package:quiz_app/features/data/model/quiz_model.dart';

class Options extends StatefulWidget {
  final List<Answer> answer;
  const Options({Key? key, required this.answer}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int val = 0;
  int groupVal = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
            title: Text(widget.answer[0].text),
            value: 1,
            groupValue: groupVal,
            onChanged: (value) {
              setState(() {
                groupVal = 1;
              });
            }),
        RadioListTile(
            title: Text(widget.answer[1].text),
            value: 2,
            groupValue: groupVal,
            onChanged: (value) {
              setState(() {
                groupVal = 2;
              });
            }),
        RadioListTile(
            title: Text(widget.answer[2].text),
            value: 3,
            groupValue: groupVal,
            onChanged: (value) {
              setState(() {
                groupVal = 3;
              });
            }),
        RadioListTile(
            title: Text(widget.answer[3].text),
            value: 4,
            groupValue: groupVal,
            onChanged: (value) {
              setState(() {
                groupVal = 4;
              });
            }),
      ],
    );
  }
}
