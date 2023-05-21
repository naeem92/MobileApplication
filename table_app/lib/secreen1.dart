import 'package:flutter/material.dart';
import 'package:table_app/secreen2.dart';

class Secreen1 extends StatefulWidget {
  const Secreen1({Key? key}) : super(key: key);

  @override
  State<Secreen1> createState() => _Secreen1State();
}

class _Secreen1State extends State<Secreen1> {
  int _table = 1, start = 1, end = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Table Generator App',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Table Number:  $_table',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Slider(
                value: _table.toDouble(),
                min: 1,
                max: 100,
                divisions: 100,
                onChanged: (double value) {
                  setState(() {
                    _table = value.toInt();
                  });
                },
                label: 'Table $_table',
              ),
            ),
            Center(
              child: Text(
                'Table starting point:  $start',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Slider(
                value: start.toDouble(),
                min: 1,
                max: 100,
                divisions: 100,
                onChanged: (double value) {
                  setState(() {
                    start = value.toInt();
                  });
                },
                label: 'Start $start',
              ),
            ),
            Center(
              child: Text(
                'Table ending Limit:  $end',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Slider(
                value: end.toDouble(),
                min: 1,
                max: 100,
                divisions: 100,
                onChanged: (double value) {
                  setState(() {
                    end = value.toInt();
                  });
                },
                label: 'End $end',
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (start < end) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Secreen2(
                          table: _table,
                          start: start,
                          end: end,
                        ),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Alert Massege'),
                          content: const Text('Please select a starting point that is less than the ending point.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text(
                  'Generate Table',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
