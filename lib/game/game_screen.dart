import 'package:flutter/material.dart';
import 'package:hs_watermelon_parody_game/view/top_page.dart';
import 'package:hs_watermelon_parody_game/game/game_ui_object.dart';
import 'package:flame/game.dart';

// ゲーム画面を表示するクラス
class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final game = GameUIObject(screenSize: screenSize);

    return Scaffold(
      appBar: AppBar(
        title: Text(game.title),
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
                  valueListenable: ValueNotifier<int>(game.score),
                  builder: (context, score, _) {
                    return Text(
                      'Score\n $score',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    );
                  },
                ),
                const Padding(padding: EdgeInsets.all(10.0)),
                ValueListenableBuilder<int>(
                  valueListenable: ValueNotifier<int>(game.bestScore),
                  builder: (context, bestScore, _) {
                    return Text(
                      'BestScore \n $bestScore',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    );
                  },
                ),
                const Padding(padding: EdgeInsets.all(10.0)),
                ValueListenableBuilder<int>(
                  valueListenable: ValueNotifier<int>(game.bestScore),
                  builder: (context, bestScore, _) {
                    return const Text(
                      '次のボール',
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
