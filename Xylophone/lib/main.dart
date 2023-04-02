import 'package:flutter/material.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
//import 'package:audioplayer/audioplayer.dart';
void main() {
  runApp(MyXylophoneApp());
}


//CTRL + ALt + L
class MyXylophoneApp extends StatelessWidget {
  void myFunction(int num, String name){
    final player = AssetsAudioPlayer();
    player.open(
      Audio("assets/note$num.wav"),
    );
    print(name);
  }

  Expanded Create_Button(int number,String name,String buttonText,Color colur){
    return Expanded(child: ElevatedButton(
      onPressed: (){
        myFunction(number,name);
      },
      child: Text(buttonText),
      style: ElevatedButton.styleFrom(
        primary: colur, // This is what you need!
      ),
    ),);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          title: Text("Naeem's Xylophone App"),

          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Create_Button(1,"","Brown",Colors.brown),
            Create_Button(2,"","Red",Colors.red),
            Create_Button(3,"","",Colors.orange),
            Create_Button(4,"","",Colors.black),
            Create_Button(5,"","",Colors.purple),
            Create_Button(6,"","",Colors.pink),
            Create_Button(7,"","",Colors.red),
          ],),
      ),
    );
  }
}