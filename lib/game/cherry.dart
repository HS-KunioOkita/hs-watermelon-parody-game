import 'package:hs_watermelon_parody_game/game/move_fruits.dart';
import 'package:hs_watermelon_parody_game/game/fruits.dart';
import 'package:flutter/material.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Cherry implements Fruits,MoveFruits {
  @override
  final fruitName = "cherry";

  @override
  final size = Vector2(5, 5);

  @override
  final fruitImage = "Cherry.png";

  @override
  final friction = 0.5;

  @override
  final restitution = 0.8;

  @override
  final density = 2.0;

  @override
  final velocity = Vector2(0,0);


  @override
  Color loadFruitImage() {
    // TODO: 画像読み込み処理に修正
    return  Colors.green;
  }

  @override
  collision() {
    // TODO:別オブジェクトに接触した時の処理を記載
    // 自分と異なるFruit -> 合体せず物理演算に即した移動をする
    // 自分と同じFruit -> 合体して、進化（新しいFruit の作成）するs
  }

  //TODO:
  @override
  moveFruits () {
    // TODO:フルーツの移動処理を記載
  }
}

// TODO:他のフルーツクラスを作成する