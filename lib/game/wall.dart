import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

class WallDraw extends BodyComponent {
  final Vector2 startPosition, endPosition;

  WallDraw(this.startPosition, this.endPosition);

  @override
  Body createBody() {
    final wallBody = world.createBody(BodyDef(position: Vector2.zero(), type: BodyType.static));

    const double wallThickness = 10; // 壁の太さ（共通）

    // 下の壁
    final double horizontalLength = (endPosition.x - startPosition.x).abs();
    final shapeBottom = PolygonShape()
      ..setAsBox(
        horizontalLength / 2,
        wallThickness / 2,
        Vector2(startPosition.x + horizontalLength / 2, startPosition.y),
        0,
      );
    wallBody.createFixture(FixtureDef(shapeBottom)..restitution = 0.2);

    // 左の壁
    final double verticalHeight = (endPosition.y - startPosition.y).abs();
    final shapeLeft = PolygonShape()
      ..setAsBox(
        wallThickness / 2,
        verticalHeight / 2,
        Vector2(startPosition.x, startPosition.y - verticalHeight / 2),
        0,
      );
    wallBody.createFixture(FixtureDef(shapeLeft)..restitution = 0.2);

    // 右の壁
    final shapeRight = PolygonShape()
      ..setAsBox(
        wallThickness / 2,
        verticalHeight / 2,
        Vector2(endPosition.x, startPosition.y - verticalHeight / 2),
        0,
      );
    wallBody.createFixture(FixtureDef(shapeRight)..restitution = 0.2);

    return wallBody;
  }

  // 壁描写メソッド
  @override
  void render(Canvas canvas) {
    // 壁の太さ
    final paint = Paint()..color = Colors.white..strokeWidth = 5;
    canvas.drawLine(Offset(startPosition.x, startPosition.y), Offset(endPosition.x, endPosition.y), paint);
  }
}

