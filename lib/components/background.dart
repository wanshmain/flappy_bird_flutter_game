import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/game/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame>{
  Background();

  @override
  Future<void> onLoad() async{//background image adding
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;//size of the screen
    sprite =Sprite(background);//new instance creating
  }
}