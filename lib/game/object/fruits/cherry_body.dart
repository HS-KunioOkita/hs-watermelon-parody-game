import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/cupertino.dart';
import 'cherry.dart';
import 'fruit_body.dart';

class CherryBody extends FruitBody with TapCallbacks {
  CherryBody(Vector2 position) : super(Cherry(), position);

  /// タップされた時の処理
  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    // このインスタンスの重力を有効化
    body.gravityScale = Vector2(0,10);
    // true にしないと、静止状態が維持され続ける
    body.setAwake(true);
    debugPrint('${fruit.fruitName} tapped! Gravity ON.');
  }
}

