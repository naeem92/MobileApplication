import 'dart:math';
import 'package:flutter/material.dart';
import 'package:table_app/secreen1.dart';

class Secreen3 extends StatefulWidget {
  const Secreen3({
    Key? key,
    required this.table,
    required this.start,
    required this.end,
  }) : super(key: key);

  final int table, start, end;

  @override
  State<Secreen3> createState() => _Secreen3State();
}

class _Secreen3State extends State<Secreen3> {
  int? positionRandom, randomNumber3, randomNumber2, randomNumber;
  var randomGenerator = Random();
  bool isCorrect = false, isPressed = false;
  late int multiply; // Updated type
  int questionCount = 0;
  int correctCount = 0;
  int selectedAnswerIndex = -1;

  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

  void generateQuestion() {
    if (questionCount < 4) {
      positionRandom = randomGenerator.nextInt(3) + 1;
      randomNumber = randomGenerator.nextInt(widget.end - widget.start + 1) + widget.start;
      randomNumber2 = randomGenerator.nextInt(widget.end - widget.start + 1) + widget.start;
      randomNumber3 = randomGenerator.nextInt(widget.end - widget.start + 1) + widget.start;
      multiply = randomNumber!;
      setState(() {
        isCorrect = false;
        isPressed = false;
        selectedAnswerIndex = -1;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Quiz Results'),
            content: Text('You attempted $questionCount questions. $correctCount answers were correct.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Secreen1()),
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }

  void checkAnswer() {
    if (selectedAnswerIndex == -1) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please select an answer.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    isPressed = true;
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    isCorrect = selectedAnswerIndex == positionRandom;
    setState(() {
      questionCount++;
      if (isCorrect) {
        correctCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Quiz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Remaining Questions ${4 - questionCount}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!isPressed)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 35.0),
                      child: SizedBox(
                        height: 50,
                        child: Text(

                          ' ${widget.table} * $multiply = ___ ',
                          style: const TextStyle(

                            fontSize: 45,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 0,
                  ),
                  if (!isPressed)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAnswerIndex = 1;
                              });
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: selectedAnswerIndex == 1
                                  ? Colors.green
                                  : (positionRandom == 1 ? Colors.red : Colors.red),
                              child: Text(
                                positionRandom == 1 ? '${widget.table * multiply}' : '${(widget.table + positionRandom!) * randomNumber2!}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAnswerIndex = 2;
                              });
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: selectedAnswerIndex == 2
                                  ? Colors.green
                                  : (positionRandom == 2 ? Colors.red : Colors.red),
                              child: Text(
                                positionRandom == 2 ? '${widget.table * multiply}' : '${(widget.table - positionRandom!) * randomNumber!}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(35.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAnswerIndex = 3;
                              });
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: selectedAnswerIndex == 3
                                  ? Colors.green
                                  : (positionRandom == 3 ? Colors.red : Colors.red),
                              child: Text(
                                positionRandom == 3 ? '${widget.table * multiply}' : '${(widget.table + positionRandom! + 2) * randomNumber3!}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (!isPressed)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: checkAnswer,
                      child: const Text(
                        'Result',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (isPressed)
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        isCorrect
                            ? 'Correct'
                            : 'Your answer is wrong \n correct answer is  ${widget.table * multiply}',
                        style: TextStyle(
                          color: isCorrect ? Colors.green : Colors.red,
                          fontSize: 30,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Secreen1()),
                      );
                    },
                    child: const Text(
                      'Generate Table',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: isPressed ? generateQuestion : null,
                    child: const Text(
                      'Next Question',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
