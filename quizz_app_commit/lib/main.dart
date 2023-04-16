import 'package:flutter/material.dart';
import 'package:quizapp_sec_b/quiz_brain.dart';

void main() {
  runApp(MyApp());
}

QuizBrain obj = QuizBrain();


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    ),);
  }
}