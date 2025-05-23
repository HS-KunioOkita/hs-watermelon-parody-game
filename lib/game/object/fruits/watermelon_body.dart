import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/cupertino.dart';
import 'watermelon.dart';
import 'fruit_body.dart';

class WatermelonBody extends FruitBody with TapCallbacks {
  WatermelonBody(Vector2 position) : super(Watermelon(), position);

  /// タップされた時の処理
  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    // このインスタンスの重力を有効化
    body.gravityScale = Vector2(0,20);
    // true にしないと、静止状態が維持され続ける
    body.setAwake(true);
    debugPrint('${fruit.fruitName} tapped! Gravity ON.');
  }
}

