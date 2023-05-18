import 'package:flutter/material.dart';
import 'package:table_app/secreen2.dart';

class Secreen1 extends StatefulWidget {
  const Secreen1({super.key});

  @override
  State<Secreen1> createState() => _Secreen1State();
}

class _Secreen1State extends State<Secreen1> {
  int _table = 1, start = 1, end = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: const Text(
        'Table Generator App',
        style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold),
      ),
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                ' Table Number:  $_table',
                style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
              ),
            ),
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: TextFormField(
          initialValue: _table.toString(),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {
              _table = int.tryParse(value) ?? 1;
            });
          },
          decoration: InputDecoration(
            labelText: 'Table',
            border: OutlineInputBorder(),
          ),
        ),
      ),



            Center(
              child: Text(
                'Table starting point:  $start',
                style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
              ),
            ),
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: TextField(
          keyboardType: TextInputType.number,
          controller: TextEditingController(text: start.toString()),
          onChanged: (value) {
            setState(() {
              start = int.tryParse(value) ?? start;
            });
          },
          decoration: InputDecoration(
            labelText: 'Start',
            border: OutlineInputBorder(),
          ),
        ),
      ),

      Center(
              child: Text(
                'Table ending Limit:  $end',
                style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
              ),
            ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: TextEditingController(text: end.toString()),
            onChanged: (value) {
              setState(() {
                end = int.tryParse(value) ?? end;
              });
            },
            decoration: InputDecoration(
              labelText: 'End',
              border: OutlineInputBorder(),
            ),
          ),
        ),

        Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Secreen2(
                                  table: _table,
                                  start: start,
                                  end: end,
                                )));
                  },
                  child: const Text(
                    'Generate Table',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
