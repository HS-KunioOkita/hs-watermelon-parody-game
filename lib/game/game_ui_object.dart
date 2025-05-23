import 'dart:math';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/events.dart';
import 'package:hs_watermelon_parody_game/game/object/fruits/watermelon_body.dart';
import 'package:hs_watermelon_parody_game/game/score.dart';
import 'package:hs_watermelon_parody_game/game/object/fruits/cherry.dart';
import 'package:hs_watermelon_parody_game/game/wall.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:hs_watermelon_parody_game/game/cloud.dart';

import 'fruits_draw.dart';
import 'object/fruits/cherry_body.dart';

class GameUIObject extends Forge2DGame with TapDetector {

  final title = "game Screen";
  final velocity = Vector2(0, 0);
  final uiImage = "";

  final Size screenSize;
  final score = Score().score;
  final bestScore = BestScore().bestScore;

  GameUIObject({required this.screenSize});

  // 壁描画メソッド
  void wallView() {
    add(WallDraw(Vector2(screenSize.width*0.2, screenSize.height*0.2), Vector2(screenSize.width*0.2, screenSize.height*0.5)));
    add(WallDraw(Vector2(screenSize.width*0.8, screenSize.height*0.5), Vector2(screenSize.width*0.8, screenSize.height*0.2)));
    add(WallDraw(Vector2(screenSize.width*0.2, screenSize.height*0.5), Vector2(screenSize.width*0.8, screenSize.height*0.5)));
  }

  // フルーツ描画メソッド
  Future<void> fruitsView(Vector2 position) async {
    final fruitBodies = [
          () => CherryBody(position),
          () => WatermelonBody(position),
    ];

    final random = Random();
    final fruit = fruitBodies[random.nextInt(fruitBodies.length)]();
    await add(fruit);
  }

  void cloudView() {
    // TODO:雲を描画させる
  }

  @override
  Future<void> onLoad() async {
    world.gravity = Vector2(0, 10);
    wallView();
    fruitsView(Vector2(screenSize.width*0.5,screenSize.height*0.15));
    pawnBallPeriodically();
  }

  // 一定間隔でフルーツ描画
  void pawnBallPeriodically() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      // TODO: ランダムで違うフルーツを表示させる
      fruitsView(Vector2(screenSize.width*0.5, screenSize.height*0.15));
    });
  }

  // @override
  // void onTapDown(TapDownInfo info) {
  //   Cloud(this).fallFruit();
  // }
}