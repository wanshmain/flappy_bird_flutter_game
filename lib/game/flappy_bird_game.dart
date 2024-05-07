import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe_group.dart';
import 'package:flappy_bird/game/configuration.dart';


class FlappyBirdGame extends FlameGame with TapDetector{
  FlappyBirdGame();

  late Bird bird;
  Timer interval =Timer(Config.pipeInterval, repeat: true);
  
  @override
  Future<void> onLoad() async{
    addAll([
      Background(),
      Ground(),
      bird=Bird(),
      Pipegroup(),
    ]);
    interval.onTick =()=>add(Pipegroup());
  }

  @override
  void onTap(){
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt){
    super.update(dt);
    interval.update(dt);
  }

}