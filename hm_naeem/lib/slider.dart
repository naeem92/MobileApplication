import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'play.dart';
import 'game.dart';
import 'package:flutter/services.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int _wordLength = 3;
  late AssetsAudioPlayer _audioPlayer;
  bool _isSoundMuted = false;

  void _navigateToPlayScreen() {
    Game game = Game(wordLength: _wordLength); // Increase word length by 1 for generating words
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Play(game: game)),
    );
  }

  void _playSound() {
    if (!_isSoundMuted) {
      _audioPlayer.open(
        Audio("images/start.mp3"),
      );
      _audioPlayer.play();
    }
  }

  @override
  void initState() {
    super.initState();
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
        title: Text("Slider"),
        actions: [
          IconButton(
            icon: _isSoundMuted ? Icon(Icons.volume_off) : Icon(Icons.volume_up),
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
                  onTap: () {
                    _playSound();
                    _navigateToPlayScreen();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
