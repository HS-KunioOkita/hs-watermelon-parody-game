import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/cupertino.dart';

import 'fruit.dart';

abstract class FruitBody extends BodyComponent with TapCallbacks {
  final Fruit fruit;
  @override
  final Vector2 position;

  FruitBody(this.fruit, this.position);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final sprite = await fruit.loadSprite();
    add(sprite);
  }

  @override
  Body createBody() {
    final shape = CircleShape()..radius = fruit.size.x / 2;

    final fixtureDef = FixtureDef(shape)
      ..density = fruit.density.toDouble()
      ..friction = fruit.friction.toDouble()
      ..restitution = fruit.restitution.toDouble();

    final bodyDef = BodyDef()
      ..type = BodyType.dynamic
      ..position = position
      ..gravityScale = Vector2(0,0);

    body = world.createBody(bodyDef);
    body.createFixture(fixtureDef);
    return body;
  }
}
