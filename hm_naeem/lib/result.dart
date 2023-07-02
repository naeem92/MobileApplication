import 'package:flutter/material.dart';
import 'slider.dart';
import 'game.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class Result extends StatefulWidget {
  final Game game;

  Result({required this.game});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late Game game;
  late AssetsAudioPlayer _audioPlayer;
  bool _isSoundMuted = false;

  @override
  void initState() {
    super.initState();
    game = widget.game;
    _audioPlayer = AssetsAudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        actions: [
          IconButton(
            icon: Icon(_isSoundMuted ? Icons.volume_off : Icons.volume_up),
            onPressed: () {
              setState(() {
                _isSoundMuted = !_isSoundMuted;
              });
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/dd.png', // Replace with your actual background image path
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
                  style: TextStyle(fontSize: 30),
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
      _playSound(true); // Play sound when the game is won

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
      _playSound(false); // Play sound when the game is lost

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

  void _playSound(bool isGameWon) {
    if (_isSoundMuted) return;

    String soundFileName;
    if (isGameWon) {
      soundFileName = "congratulations.mp3";
    } else {
      soundFileName = "loss.mp3";
    }

    String soundFilePath = "images/$soundFileName";
    _audioPlayer.open(
      Audio(soundFilePath),
    );
    _audioPlayer.play();
  }
}
