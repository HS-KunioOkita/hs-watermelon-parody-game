import 'package:flame_forge2d/flame_forge2d.dart';

abstract class Fruits {
  final fruitName = "";
  final size = Vector2(0, 0);
  final fruitImage = "";
  final friction = 0.0;
  final restitution = 0.0;
  final density = 0.0;

  void loadFruitImage() ;
}