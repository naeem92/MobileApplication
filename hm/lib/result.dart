import 'package:flutter/material.dart';
import 'package:hm/slider.dart';
import 'package:hm/play.dart';
import 'package:hm/game.dart';

class Result extends StatelessWidget {
  final Game game;

  Result.fromData(this.game);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/bg.png', // Replace with your actual background image path
            fit: BoxFit.cover,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _getResult(),
                Text(
                  "Word: " + (game.secretWord ?? ""),
                  style: TextStyle(fontSize: 20),
                ),
                _getStars(),
                Ink(
                  child: GestureDetector(
                    child: Image.asset(
                      'images/nextWord.png',
                      width: 200,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return SliderScreen();
                      }));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getResult() {
    if (game.isWordGuessed()) {
      return Column(
        children: <Widget>[
          Image.asset(
            'images/win.png',
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              "CONGRATULATIONS \nWinner 🏆",
              style: TextStyle(fontSize: 32),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Image.asset(
            'images/lose.png',
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              "Better Luck\nNext Time 😢",
              style: TextStyle(fontSize: 32),
            ),
          ),
        ],
      );
    }
  }

  Widget _getStars() {
    if (game.isWordGuessed()) {
      if (game.wrongLettersGuessed.length == 0)
        return Image.asset(
          "images/star3.png",
          height: 50,
        );
      else if (game.wrongLettersGuessed.length <= 2)
        return Image.asset(
          "images/star2.png",
          height: 50,
        );
      else
        return Image.asset(
          "images/star1.png",
          height: 50,
        );
    } else {
      return Image.asset(
        "images/star0.png",
        height: 50,
      );
    }
  }
}
