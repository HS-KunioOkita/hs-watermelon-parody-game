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
      ),
      body: GameWidget(
        game: MyGame(),
      ),
    );
  }
}
