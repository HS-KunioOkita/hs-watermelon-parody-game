import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

abstract class Fruits {
  String fruitName = "";
  Vector2 size = Vector2(0, 0);
  String fruitImage = "";

  double friction = 0.0;
  double restitution = 0.0;
  double density = 0.0;
}

class Cherry implements Fruits {
  @override
  String fruitName = "cherry";

  @override
  Vector2 size = Vector2(5, 5);

  @override
  String fruitImage = "Cherry.png";

  @override
  double friction = 0.5;

  @override
  double restitution = 0.8;

  @override
  double density = 2.0;
}

class FruitsDraw extends BodyComponent {
  final Vector2 position;
  final double density;
  final double restitution;

  FruitsDraw(this.position, this.density, this.restitution);

  @override
  Body createBody() {
    final shape = CircleShape()..radius = 10;
    final fixtureDef = FixtureDef(shape)
      ..density = density
      ..restitution = restitution;
    final bodyDef = BodyDef(position: position, type: BodyType.dynamic);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.green;
    canvas.drawCircle(Offset.zero, 10, paint);
  }
}

class NextFruit {
//   TODO:次のフルーツを決める処理
}