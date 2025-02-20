import 'package:flutter/material.dart';
import 'package:hs_watermelon_parody_game/view/top_page.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/events.dart';
import 'dart:async';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final game = GameObject(screenSize: screenSize);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                items: [
                  PopupMenuItem<int>(
                    value: 0,
                    child: const Text('メニューへ'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TopPage()),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          GameWidget(game: game),
          Positioned(
            top: 0,
            left: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<int>(
                  valueListenable: game.score,
                  builder: (context, score, _) {
                    return Text(
                      'Score\n $score',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    );
                  },
                ),
                const Padding(padding: EdgeInsets.all(10.0)),
                ValueListenableBuilder<int>(
                  valueListenable: game.bestScore,
                  builder: (context, bestScore, _) {
                    return Text(
                      'BestScore \n $bestScore',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    );
                  },
                ),
                const Padding(padding: EdgeInsets.all(10.0)),
                ValueListenableBuilder<int>(
                  valueListenable: game.bestScore,
                  builder: (context, bestScore, _) {
                    return const Text(
                      '次のボール', // TODO:次のボールを表示させるようにする
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// ゲームクラス
class GameObject extends Forge2DGame with TapDetector {
  final Size screenSize;
  // TODO:計算した点数を代入する
  final score = ValueNotifier<int>(0);

  // TODO:ベストスコアを表示する(Serverからデータ取得する？)
  final bestScore = ValueNotifier<int>(100);

  GameObject({required this.screenSize});

  @override
  Future<void> onLoad() async {
    world.gravity = Vector2(0, 0);
    // 壁を追加
    await add(Wall(Vector2(screenSize.width*0.2, screenSize.height*0.2), Vector2(screenSize.width*0.2, screenSize.height*0.5))); // 左の壁
    await add(Wall(Vector2(screenSize.width*0.8, screenSize.height*0.5), Vector2(screenSize.width*0.8, screenSize.height*0.2))); // 右の壁
    await add(Wall(Vector2(screenSize.width*0.2, screenSize.height*0.5), Vector2(screenSize.width*0.8, screenSize.height*0.5))); // 下の壁

    // 最初のボール表示
    add(Fruits(Vector2(screenSize.width*0.5, screenSize.height*0.15)));
    pawnBallPeriodically();
  }
  var  x = 0.0;
  // ボール表示メソッド
  void ballDrawing(Timer timer) {
    x += 1.0;
    world.gravity = Vector2(0, 0);
    add(Fruits(Vector2(screenSize.width*0.5 + x, screenSize.height*0.15)));
  }

  // 一定間隔でボールを表示
  // TODO: ランダムで違う数字のボールを表示させる
  void pawnBallPeriodically() {
    Timer.periodic(const Duration(seconds: 5), ballDrawing);
  }
  // TODO:一定時間経過後重力を発生させる(ボールを落とす)

  // TODO:左右にボールを動かす処理を入れる

  // TODO:点数計算処理を入れる

  // タップした時に重力を設定して、ボールを落とす
  @override
  void onTapDown(TapDownInfo info) {
    world.gravity = Vector2(0, 50);
  }
}

// フルーツクラス
interface class Fruits extends BodyComponent {
  @override
  final Vector2 position;
  Fruits(this.position);

  @override
  Body createBody() {
    final shape = CircleShape()..radius = 10;
    final fixtureDef = FixtureDef(shape)
    ..density = 0.5
    ..restitution = 0.5;
    final bodyDef = BodyDef(position: position, type: BodyType.dynamic);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  // ボールのレイアウト設定メソッド
  @override
  void render(Canvas canvas) {
    // TODO:画像を設定できるようにする
    final paint = Paint()..color = Colors.green;
    canvas.drawCircle(Offset.zero, 10, paint);
  }
}

class Cloud {

}

// 壁クラス
class Wall extends BodyComponent {
  final Vector2 startPosition, endPosition;
  Wall(this.startPosition, this.endPosition);

  @override
  Body createBody() {
    //  TODO:左右の壁の当たり判定をつける
    final length = (endPosition.x - startPosition.x);
    // 長方形の当たり判定をつける(横：下の壁の長さ、縦：線の太さ*2、中心点：下の壁の中心、角度：0度)
    final shape = PolygonShape()..setAsBox(length, 10, Vector2(length/2,startPosition.y), 0);
    // 反射率
    final fixtureDef = FixtureDef(shape)..restitution = 0.2;
    final bodyDef = BodyDef(position: Vector2.zero(), type: BodyType.static);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.white..strokeWidth = 5;
    canvas.drawLine(Offset(startPosition.x, startPosition.y), Offset(endPosition.x, endPosition.y), paint);
  }
}