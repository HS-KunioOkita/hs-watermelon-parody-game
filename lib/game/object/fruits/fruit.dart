import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

abstract class Fruit extends BodyComponent {
  String get fruitName;
  Vector2 get size;
  String get fruitImage;
  int get friction;
  int get restitution;
  int get density;

  Future<SpriteComponent> loadSprite();
}
