import 'package:flutter/material.dart';
import 'package:quiz_app/locator.dart' as si;

import 'features/presentation/pages/quiz_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await si.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const QuizPage(),
    );
  }
}
