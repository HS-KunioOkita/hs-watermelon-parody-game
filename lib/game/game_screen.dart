// import 'package:flutter/material.dart';
// import 'package:hs_watermelon_parody_game/view/top_page.dart';
// import 'package:flame/game.dart';
// import 'package:flame_forge2d/flame_forge2d.dart';
//
// class GameScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final game = Game(screenSize: screenSize);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Game Screen'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.menu),
//             onPressed: () {
//               showMenu(
//                 context: context,
//                 position: RelativeRect.fromLTRB(100, 100, 0, 0),
//                 items: [
//                   PopupMenuItem<int>(
//                     value: 0,
//                     child: Text('Menu'),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => TopPage()),
//                       );
//                     },
//                   ),
//                 ],
//                 elevation: 8.0,
//               );
//             },
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           GameWidget(game: game),
//           Positioned(
//             top: 0,
//             left: 0,
//             child: Row(
//               children: [
//                 // Score表示
//                 ValueListenableBuilder<int>(
//                   valueListenable: game.score,
//                   builder: (context, score, _) {
//                     return Text(
//                       'Score \n $score',
//                       style: TextStyle(fontSize: 20, color: Colors.white),
//                     );
//                   },
//                 ),
//                 SizedBox(width: screenSize.width/10),
//                 // BestScore表示
//                 ValueListenableBuilder<int>(
//                   valueListenable: game.bestScore,
//                   builder: (context, bestScore, _) {
//                     return Text(
//                       'BestScore \n $bestScore',
//                       style: TextStyle(fontSize: 20, color: Colors.white),
//                     );
//                   },
//                 ),
//               // TODO:次のボールを表示させる
//                 // ValueListenableBuilder<int>(
//                 //   valueListenable: game.bestScore,
//                 //   builder: (context, bestScore, _) {
//                 //     return Text(
//                 //       'BestScore \n $bestScore',
//                 //       style: TextStyle(fontSize: 20, color: Colors.white),
//                 //     );
//                 //   },
//                 // ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// // ゲームクラス
// class Game extends Forge2DGame {
//   final screenSize;
//   Game({required this.screenSize});
//   final score = ValueNotifier<int>(0);
//   final bestScore = ValueNotifier<int>(100);
//   @override
//   Future<void> onLoad() async {
//     await super.onLoad();
//
//     await add(Wall(Vector2(50, 250), Vector2(50, 500)));   // 左の壁
//     await add(Wall(Vector2(300, 500), Vector2(300, 250))); // 右の壁
//     await add(Wall(Vector2(50, 500), Vector2(300, 500)));  // 下の壁
//
//     // await add(Wall(Vector2(screenSize.width/10, screenSize.height-700), Vector2(screenSize.width/10, screenSize.height-400)));   // 左の壁
//
//   }
// }
// // 壁クラス
// class Wall extends BodyComponent {
//   final Vector2 startingPosition;
//   final Vector2 endPosition;
//   late final Body body;
//   Wall(this.startingPosition, this.endPosition);
//   @override
//   Future<void> onLoad() async {
//     body = createBody();
//   }
//   @override
//   Body createBody() {
//     final length = (endPosition.y - startingPosition.y);
//     // 反射時の形状(どのような形状のあたり判定をつけるか)
//     final shape = PolygonShape()..setAsBox(5, length, Vector2.zero(), 0);
//     // 反射率
//     final reflection = FixtureDef(shape)..restitution = 0.8;
//
//     final bodyDef = BodyDef(position: Vector2(0, 0), type: BodyType.static);
//     return world.createBody(bodyDef)..createFixture(reflection);
//   }
//   @override
//   void render(Canvas canvas) {
//     // 壁の色、幅の設定
//     final paint = Paint()..color = Colors.white..strokeWidth = 5;
//     canvas.drawLine(
//       // 壁を描画する位置の設定
//       Offset(startingPosition.x, startingPosition.y),
//       Offset(endPosition.x, endPosition.y),
//       paint,
//     );
//   }
// }
