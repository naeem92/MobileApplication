// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'package:table_app/secreen2.dart';
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
  State<Secreen3> createState() => _Secreen3State(end: end, start: start);
}

class _Secreen3State extends State<Secreen3> {
  _Secreen3State({required this.end, required this.start});
  final int end, start;
  int? positionRandom, randomNumber3, randomNumber2, multiply, randomNumber;
  var randomGenerator = Random();
  bool isCorrect = false, isPressed = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    positionRandom = randomGenerator.nextInt(4);

    randomNumber = start + randomGenerator.nextInt(end - start);
    randomNumber2 =
        widget.start + randomGenerator.nextInt(widget.end - widget.start);
    randomNumber3 =
        widget.start + randomGenerator.nextInt(widget.end - widget.start);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    positionRandom = randomGenerator.nextInt(4);
    int multiply = randomNumber!;
    int answer = widget.table * multiply;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
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
                    SizedBox(
                      height: 90,
                      child: Text(
                        ' ${widget.table} * $multiply = ___ ',
                        style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                      ),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (!isPressed)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          positionRandom == 1
                              ? '${widget.table * multiply}'
                              : '${(widget.table + positionRandom!) * randomNumber2!}',
                          style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        ),
                        Text(
                          positionRandom == 2
                              ? '${widget.table * multiply}'
                              : '${(widget.table - positionRandom!) * randomNumber!}',
                          style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        ),
                        Text(
                          positionRandom == 3
                              ? '${widget.table * multiply}'
                              : '${(widget.table + positionRandom! + 2) * randomNumber3!}',
                          style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (!isPressed)
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          fillColor: Colors.grey,
                          contentPadding: EdgeInsets.all(8),
                          hintText: 'Enter Value',
                          // labelText: hint,
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (!isPressed)
                    ElevatedButton(
                      onPressed: () {
                        isPressed = true;
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }

                        controller.text == answer.toString()
                            ? isCorrect = true
                            : isCorrect = false;
                        setState(() {});
                      },
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
                            fontSize: 30),
                      ),
                    ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => Secreen1(),
                          ),
                        );
                        // Add your code here for the second button
                      },
                      child:  Text(
                        'Generate Table',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Secreen3(
                            table: widget.table,
                            start: widget.start,
                            end: widget.end,
                          ),
                        ),
                      );
                    },
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
