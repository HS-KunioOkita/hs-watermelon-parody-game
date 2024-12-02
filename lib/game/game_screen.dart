import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'my_game.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(100, 100, 0, 0),
                items: [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text('Menu Item 1'),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text('Menu Item 2'),
                  ),
                  PopupMenuItem<int>(
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
