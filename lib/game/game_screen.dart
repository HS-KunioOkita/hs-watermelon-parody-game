import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'my_game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text('Menu Item 1'),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text('Menu Item 2'),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text('Menu Item 3'),
                  ),
                ],
                elevation: 8.0,
              );
            },
          ),
        ],
      ),
      body: GameWidget(
        game: MyGame(),
      ),
    );
  }
}
