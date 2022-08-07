import 'package:flutter/material.dart';
import 'package:quiz_app/features/quiz/presentation/pages/quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goToQuiz(String topic) {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => QuizPage(topic: topic))));
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text('Choose Quiz Topic',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  goToQuiz('fiqh');
                },
                child: const Text(
                  'Fiqh',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    goToQuiz('quran');
                  },
                  child: const Text(
                    "Qur'an",
                    style: TextStyle(fontSize: 18),
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    goToQuiz('seerah');
                  },
                  child: const Text(
                    'Seerah',
                    style: TextStyle(fontSize: 18),
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    goToQuiz('tauheed');
                  },
                  child: const Text(
                    'Tauheed',
                    style: TextStyle(fontSize: 18),
                  ))
            ]),
      ),
    );
  }
}
