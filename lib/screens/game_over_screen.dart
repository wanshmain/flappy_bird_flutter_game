import 'dart:ui';

import 'package:flappy_bird/game/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class GameOverScreen extends StatelessWidget{
  final FlappyBirdGame game;
  static const String id='gameover';
  const GameOverScreen({Key? key,required this.game}):super(key:key);

  @override
  Widget build (BuildContext content){
    return Material(
      color:Colors.black38,
      child:Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.gameOver),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRestart,
              style:ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('restart',style: TextStyle(fontSize: 20)),
              )
          ],
        ),
      )
    );
  }

  void onRestart(){
    game.bird.reset();
    game.overlays.remove('gameover');
    game.resumeEngine();
  }
}