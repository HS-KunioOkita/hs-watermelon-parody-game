import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

class WallDraw extends BodyComponent {
  final Vector2 startPosition, endPosition;

  WallDraw(this.startPosition, this.endPosition);

  // TODO:左右の壁にもあたり判定をつける
  @override
  Body createBody() {
    final length = (endPosition.x - startPosition.x);
    // 長方形型の当たり判定をつける(横：下の壁の長さ、縦：線の太さ*2、中心点：下の壁の中心、角度：0度)
    final shape = PolygonShape()..setAsBox(length, 10, Vector2(length / 2, startPosition.y), 0);
    final fixtureDef = FixtureDef(shape)..restitution = 0.2;
    final bodyDef = BodyDef(position: Vector2.zero(), type: BodyType.static);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.white..strokeWidth = 5;
    canvas.drawLine(Offset(startPosition.x, startPosition.y), Offset(endPosition.x, endPosition.y), paint);
  }
}