import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'play.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int _wordLength = 1;

  void _navigateToPlayScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Play()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(
                'HMG',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/l.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(120.0, 180.0, 70.0, 10.0),
                  child: SleekCircularSlider(
                    min: 1,
                    max: 10, // Update the range according to your preference
                    initialValue: _wordLength.toDouble(),
                    onChange: (double value) {
                      setState(() {
                        _wordLength = value.toInt();
                      });
                    },
                    innerWidget: (double value) {
                      return Center(
                        child: Text(
                          'Word Length: $_wordLength',
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50,bottom: 10,top: 10),
                  child: Ink(
                    child: GestureDetector(
                      child: Image.asset(
                        'images/PlayB.png',
                        width: 200,
                      ),
                      onTap: _navigateToPlayScreen,
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
