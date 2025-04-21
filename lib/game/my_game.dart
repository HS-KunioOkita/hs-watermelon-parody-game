import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    // ゲームの初期化処理をここに記述
    add(TextComponent(
      text: 'Hello World',
      position: Vector2(100, 100),
      textRenderer: TextPaint(style: const TextStyle(fontSize: 24, color: Colors.white)),
    ));
  }
}