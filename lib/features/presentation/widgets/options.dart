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
            value: val,
            groupValue: groupVal,
            onChanged: (value) {
              setState(() {
                groupVal = val;
              });
            }),
        RadioListTile(
            value: val + 1,
            groupValue: groupVal,
            onChanged: (value) {
              setState(() {
                groupVal = val;
              });
            })
      ],
    );
  }
}
