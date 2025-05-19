import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'fruit.dart';

// フルーツの「データ」（名前、画像、サイズ、物理パラメータなど）
class Cherry extends Fruit {
  @override
  String get fruitName => 'Cherry';

  @override
  Vector2 get size => Vector2.all(1.0); // m単位

  @override
  String get fruitImage => 'cherry.png'; // assets/images/cherry.png

  @override
  int get friction => 1;

  @override
  int get restitution => 0;

  @override
  int get density => 1;

  @override
  Future<SpriteComponent> loadSprite() async {
    final sprite = await Sprite.load(fruitImage);
    return SpriteComponent(
      sprite: sprite,
      size: size * 10, // 表示サイズ調整
      anchor: Anchor.center,
    );
  }
}
