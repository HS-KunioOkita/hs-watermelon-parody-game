import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/painting.dart';
import 'package:hs_watermelon_parody_game/view/game_page.dart';

class Cloud extends PositionComponent with HasGameRef<Forge2DGame> {
  final Forge2DGame game;
  Vector2 velocity = Vector2(0.5, 0); // 初期速度（右方向）
  Cloud(this.game) {
    size = Vector2(100, 50); // 雲のサイズ
  }

  // タップした時にフルーツを落とす処理
  void fallFruit() {
    game.world.gravity = Vector2(0, 50);
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = const Color(0xFFFFFFFF);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.x, size.y),
        Radius.circular(20),
      ),
      paint,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity;
    if (position.x <= 0) {
      velocity.x = velocity.x.abs(); // 右向きに反転
    } else if (position.x + size.x >= game.size.x) {
      velocity.x = -velocity.x.abs(); // 左向きに反転
    }
  }
}






