import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/events.dart';
import 'package:hs_watermelon_parody_game/game/score.dart';
import 'package:hs_watermelon_parody_game/game/fruits.dart';
import 'package:hs_watermelon_parody_game/game/wall.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:hs_watermelon_parody_game/game/cloud.dart';

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
  void fruitsView(Vector2 position) {
    world.gravity = Vector2(0, 0);
    add(FruitsDraw(position, Cherry().density, Cherry().restitution));
  }

  @override
  Future<void> onLoad() async {
    world.gravity = Vector2(0, 0);
    wallView();
    fruitsView(Vector2(screenSize.width*0.5,screenSize.height*0.15));
    pawnBallPeriodically();
  }

  //  一定間隔でフルーツ描画
  void pawnBallPeriodically() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      // TODO: ランダムで違う数字のボールを表示させる
      fruitsView(Vector2(screenSize.width*0.5, screenSize.height*0.15));
    });
  }
  @override
  void onTapDown(TapDownInfo info) {
    Cloud(this).fallFruit();
  }
}