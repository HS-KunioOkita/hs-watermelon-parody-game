import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';


class Cloud {
  final Forge2DGame game;
  Cloud(this.game);

  final size = Vector2(0, 0);
  final CloudImage = "";
  final velocity = Vector2(0, 0);

  // タッチアップでCherryを落とす処理
  void fallFruit() {
    game.world.gravity = Vector2(0, 50);
  }

  //  TODO:スワイプで雲が動く処理
}