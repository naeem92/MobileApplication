import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'play.dart';
import 'game.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int _wordLength = 3;

  void _navigateToPlayScreen() {
    Game game = Game(wordLength: _wordLength); // Increase word length by 1 for generating words
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Play(game: game)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/dd.png',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: SleekCircularSlider(
                    min: 3,
                    max: 10,
                    initialValue: _wordLength.toDouble(),
                    innerWidget: (double value) {
                      return Center(
                        child: Text(
                          _wordLength.toString(),
                          style: TextStyle(fontSize: 36),
                        ),
                      );
                    },
                    onChange: (double value) {
                      setState(() {
                        _wordLength = value.toInt();
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  child: Image.asset(
                    'images/PlayB.png',
                    width: 200,
                  ),
                  onTap: _navigateToPlayScreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
