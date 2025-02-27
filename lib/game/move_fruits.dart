import 'package:flame_forge2d/flame_forge2d.dart';

abstract class MoveFruits {
  final velocity = Vector2(0, 0);
  void collision();
  void moveFruits();
}