import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import 'package:flappy_bird/game/assets.dart';
import 'package:flappy_bird/game/bird_movement.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame>,CollisionCallbacks {
  Bird();

  @override
  Future<void> onLoad() async {
    final birdmidflap = await gameRef.loadSprite(Assets.birdmidflap);
    final birdupflap = await gameRef.loadSprite(Assets.birdupflap);
    final birddownflap = await gameRef.loadSprite(Assets.birddownflap);

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = BirdMovement.middle;
    sprites = {
      BirdMovement.middle: birdmidflap,
      BirdMovement.up: birdupflap,
      BirdMovement.down: birddownflap,
    };

    add(CircleHitbox());
  }

  void fly() {
    add(MoveByEffect(
      Vector2(0, Config.gravity),
      EffectController(
        duration: 0.2,
        curve: Curves.decelerate,
      ),
      onComplete: () => current = BirdMovement.down,
    ));
    current =BirdMovement.up;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
   ) {
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }

  void reset(){
    position=Vector2(50, gameRef.size.y/2-size.y/2);
  }

  void gameOver(){
    gameRef.overlays.add('gameover');
    gameRef.pauseEngine();
    game.isHit=true;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.birdVelocity * dt;
  }
}
