import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/game/pipe_position.dart';

class Pipegroup extends PositionComponent{
  Pipegroup();

  @override
  Future<void> onLoad() async{
    addAll([
      Pipe(pipePosition: PipePosition.top, height: 150),
    ]);
  }
}