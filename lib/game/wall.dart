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
    final shape = PolygonShape()
      ..setAsBox(length, 10, Vector2(length / 2, startPosition.y), 0);
    final fixtureDef = FixtureDef(shape)
      ..restitution = 0.2;
    final bodyDef = BodyDef(position: Vector2.zero(), type: BodyType.static);
    final bottomWall = world.createBody(bodyDef)..createFixture(fixtureDef);

    // 左の壁
    final leftShape = PolygonShape()
      ..setAsBox(10, endPosition.y - startPosition.y, Vector2(startPosition.x, (startPosition.y + endPosition.y) / 2), 0);
    final leftFixtureDef = FixtureDef(leftShape)
      ..restitution = 0.2;
    final leftBodyDef = BodyDef(position: Vector2.zero(), type: BodyType.static);
    final leftWall = world.createBody(leftBodyDef)..createFixture(leftFixtureDef);

    // 右の壁
    final rightShape = PolygonShape()
      ..setAsBox(10, endPosition.y - startPosition.y, Vector2(endPosition.x, (startPosition.y + endPosition.y) / 2), 0);
    final rightFixtureDef = FixtureDef(rightShape)..restitution = 0.2;
    final rightBodyDef = BodyDef(position: Vector2.zero(), type: BodyType.static);
    final rightWall = world.createBody(rightBodyDef)..createFixture(rightFixtureDef);

    return [bottomWall, leftWall, rightWall];
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5;

    // 下の壁の描画
    canvas.drawLine(
      Offset(startPosition.x, startPosition.y),
      Offset(endPosition.x, endPosition.y),
      paint
    );

    // 左の壁の描画
    canvas.drawLine(
      Offset(startPosition.x, startPosition.y),
      Offset(startPosition.x, endPosition.y),
      paint,
    );

    // 右の壁の描画
    canvas.drawLine(
      Offset(endPosition.x, startPosition.y),
      Offset(endPosition.x, endPosition.y),
      paint,
    );
  }
}

